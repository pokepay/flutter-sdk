// Dart側の invokeMethod 呼び出しと Android/iOS プラグインの case 分岐の
// 整合性を検査するリント。CI およびリリース前チェックで使用する。
//
// 検査内容:
//   1. Dartが呼ぶメソッド名が Java / Swift 両方の switch に存在するか
//   2. Dartが送る引数キーをネイティブ側が同名で読んでいるか
//      (snake_case / camelCase の食い違いは実行時に null になるため error)
//   3. pubspec.yaml / podspec / build.gradle のバージョン一貫性
//
// 使い方: dart run tool/check_native_links.dart [--strict]
//   --strict: warning も exit code 1 にする

import 'dart:io';

// ネイティブ側が Dart から受け取らない引数を意図的に読むケースなど、
// 検査対象から除外したい (メソッド名, キー) の組。
const Map<String, Set<String>> ignoredKeys = {};

// Dart から呼ばれないがネイティブに存在する case は後方互換のため許容する。
// (古いバージョンの Dart コードとの組み合わせで動く必要があるため)

class DartCall {
  final String method;
  final Set<String> keys;
  final String location;
  DartCall(this.method, this.keys, this.location);
}

class NativeCase {
  final String method;
  final Set<String> keys;
  NativeCase(this.method, this.keys);
}

final List<String> errors = [];
final List<String> warnings = [];

String canonical(String key) => key.toLowerCase().replaceAll('_', '');

void main(List<String> args) {
  final strict = args.contains('--strict');
  final root = findRepoRoot();

  final dartCalls = collectDartCalls(root);
  // 手書き switch が先にマッチし、default で自動生成ハンドラへ委譲される。
  // 実行時と同じ優先順で結合する (同名 case は手書き側が勝つ)。
  final javaArgPatterns = [
    RegExp(r'call\.argument\("([^"]+)"\)'),
    RegExp(r'call\.hasArgument\("([^"]+)"\)'),
  ];
  final javaCases = mergeNativeCases(
    collectNativeCases(
      File('$root/android/src/main/java/jp/pokepay/pokepay_sdk/PokepaySdkPlugin.java'),
      argPatterns: javaArgPatterns,
    ),
    collectNativeCases(
      File('$root/android/src/main/java/jp/pokepay/pokepay_sdk/AutogenMethodHandlers.java'),
      argPatterns: javaArgPatterns,
    ),
    'Android',
  );
  final swiftArgPatterns = [RegExp(r'args\["([^"]+)"\]')];
  final swiftCases = mergeNativeCases(
    collectNativeCases(
      File('$root/ios/Classes/SwiftPokepaySdkPlugin.swift'),
      argPatterns: swiftArgPatterns,
    ),
    collectNativeCases(
      File('$root/ios/Classes/AutogenMethodHandlers.swift'),
      argPatterns: swiftArgPatterns,
    ),
    'iOS',
  );

  checkPlatform(dartCalls, javaCases, 'Android (PokepaySdkPlugin.java)');
  checkPlatform(dartCalls, swiftCases, 'iOS (SwiftPokepaySdkPlugin.swift)');
  checkVersions(root);

  for (final w in warnings) {
    stdout.writeln('WARNING: $w');
  }
  for (final e in errors) {
    stdout.writeln('ERROR: $e');
  }
  stdout.writeln('');
  stdout.writeln('checked ${dartCalls.length} Dart call sites, '
      '${javaCases.length} Java cases, ${swiftCases.length} Swift cases');
  stdout.writeln('${errors.length} error(s), ${warnings.length} warning(s)');

  if (errors.isNotEmpty || (strict && warnings.isNotEmpty)) {
    exit(1);
  }
}

String findRepoRoot() {
  var dir = Directory.current;
  while (true) {
    if (File('${dir.path}/pubspec.yaml').existsSync()) return dir.path;
    final parent = dir.parent;
    if (parent.path == dir.path) {
      stderr.writeln('pubspec.yaml が見つかりません。リポジトリ内で実行してください。');
      exit(2);
    }
    dir = parent;
  }
}

// ---------------------------------------------------------------------------
// Dart 側の抽出
// ---------------------------------------------------------------------------

List<DartCall> collectDartCalls(String root) {
  final calls = <DartCall>[];
  final libDir = Directory('$root/lib');
  final files = libDir
      .listSync(recursive: true)
      .whereType<File>()
      .where((f) => f.path.endsWith('.dart') && !f.path.endsWith('.g.dart'));

  for (final file in files) {
    final src = file.readAsStringSync();
    final rel = file.path.substring(root.length + 1);
    // invokeMethod<T>(factory, 'name', {...}) と
    // channel.invokeMethod('name', {...}) の両方を拾う
    for (final m in RegExp(r'invokeMethod(?:<[^(]*?>)?\(').allMatches(src)) {
      final callSrc = balancedSlice(src, m.end - 1);
      if (callSrc == null) continue;
      final nameMatch =
          RegExp('[\'"]([A-Za-z][A-Za-z0-9_]*)[\'"]').firstMatch(callSrc);
      if (nameMatch == null) continue;
      final method = nameMatch.group(1)!;
      final braceStart = callSrc.indexOf('{', nameMatch.end);
      final keys = <String>{};
      if (braceStart >= 0) {
        final mapSrc = balancedSlice(callSrc, braceStart, open: '{', close: '}');
        if (mapSrc != null) {
          for (final k in RegExp('[\'"]([A-Za-z_][A-Za-z0-9_]*)[\'"]\\s*:')
              .allMatches(mapSrc)) {
            keys.add(k.group(1)!);
          }
        }
      }
      final line = '\n'.allMatches(src.substring(0, m.start)).length + 1;
      calls.add(DartCall(method, keys, '$rel:$line'));
    }
  }
  return calls;
}

// start にある開き括弧から対応する閉じ括弧までの部分文字列を返す
String? balancedSlice(String src, int start,
    {String open = '(', String close = ')'}) {
  var depth = 0;
  var inString = false;
  String? quote;
  for (var i = start; i < src.length; i++) {
    final c = src[i];
    if (inString) {
      if (c == quote && src[i - 1] != r'\') inString = false;
      continue;
    }
    if (c == "'" || c == '"') {
      inString = true;
      quote = c;
    } else if (c == open) {
      depth++;
    } else if (c == close) {
      depth--;
      if (depth == 0) return src.substring(start, i + 1);
    }
  }
  return null;
}

// ---------------------------------------------------------------------------
// ネイティブ側の抽出
// ---------------------------------------------------------------------------

Map<String, NativeCase> collectNativeCases(File file,
    {required List<RegExp> argPatterns}) {
  if (!file.existsSync()) {
    errors.add('${file.path} が存在しません');
    return {};
  }
  final src = file.readAsStringSync();
  final cases = <String, NativeCase>{};
  final caseRe = RegExp(r'case\s+"([A-Za-z][A-Za-z0-9_]*)"\s*:');
  final matches = caseRe.allMatches(src).toList();
  for (var i = 0; i < matches.length; i++) {
    final method = matches[i].group(1)!;
    final blockEnd = (i + 1 < matches.length)
        ? matches[i + 1].start
        : src.indexOf(RegExp(r'\bdefault\s*:'), matches[i].end);
    final block =
        src.substring(matches[i].end, blockEnd < 0 ? src.length : blockEnd);
    final keys = <String>{};
    for (final re in argPatterns) {
      for (final m in re.allMatches(block)) {
        keys.add(m.group(1)!);
      }
    }
    // 同名 case の重複はJavaではコンパイルエラーになるので考慮しない
    cases[method] = NativeCase(method, keys);
  }
  return cases;
}

Map<String, NativeCase> mergeNativeCases(Map<String, NativeCase> handwritten,
    Map<String, NativeCase> autogen, String platform) {
  final merged = Map<String, NativeCase>.of(handwritten);
  for (final entry in autogen.entries) {
    if (merged.containsKey(entry.key)) {
      warnings.add('${entry.key}: $platform の手書き switch と AutogenMethodHandlers '
          'の両方に case があります (手書き側が優先され、生成側は到達しません)');
    } else {
      merged[entry.key] = entry.value;
    }
  }
  return merged;
}

// ---------------------------------------------------------------------------
// 照合
// ---------------------------------------------------------------------------

void checkPlatform(
    List<DartCall> dartCalls, Map<String, NativeCase> native, String label) {
  if (native.isEmpty) return;
  for (final call in dartCalls) {
    final nc = native[call.method];
    if (nc == null) {
      errors.add(
          '${call.method}: $label に case がありません (呼び出し元: ${call.location})');
      continue;
    }
    final ignored = ignoredKeys[call.method] ?? const <String>{};
    for (final key in call.keys) {
      if (ignored.contains(key)) continue;
      if (nc.keys.contains(key)) continue;
      // 同じ意味のキーを別名で読んでいる → 実行時に null になる取り違え
      final twin =
          nc.keys.where((k) => canonical(k) == canonical(key)).toList();
      if (twin.isNotEmpty) {
        errors.add(
            "${call.method}: Dart は '$key' を送るが $label は '${twin.join("', '")}' "
            'を読んでいます (値が null になります) (呼び出し元: ${call.location})');
      } else {
        warnings.add(
            "${call.method}: Dart が送る '$key' を $label は読んでいません "
            '(呼び出し元: ${call.location})');
      }
    }
    // ネイティブだけが読むキー: 別の Dart 呼び出し元/旧バージョン互換の
    // フォールバック読みがあるため、同カノニカルキーが送られていれば許容
    final sentCanonical = call.keys.map(canonical).toSet();
    for (final key in nc.keys) {
      if (ignored.contains(key)) continue;
      if (!sentCanonical.contains(canonical(key)) &&
          !anyDartCallSends(dartCalls, call.method, key)) {
        warnings.add(
            "${call.method}: $label は '$key' を読みますがどの Dart 呼び出しも送っていません");
      }
    }
  }
}

bool anyDartCallSends(List<DartCall> dartCalls, String method, String key) {
  final c = canonical(key);
  return dartCalls
      .where((d) => d.method == method)
      .any((d) => d.keys.map(canonical).contains(c));
}

// ---------------------------------------------------------------------------
// バージョン一貫性
// ---------------------------------------------------------------------------

void checkVersions(String root) {
  final pubspec = File('$root/pubspec.yaml').readAsStringSync();
  final podspec = File('$root/ios/pokepay_sdk.podspec').readAsStringSync();
  final gradle = File('$root/android/build.gradle').readAsStringSync();

  final pubVersion =
      RegExp(r'^version:\s*(\S+)', multiLine: true).firstMatch(pubspec)?.group(1);
  final podVersion =
      RegExp(r"s\.version\s*=\s*'([^']+)'").firstMatch(podspec)?.group(1);
  final podDep = RegExp(r"s\.dependency\s+'Pokepay',\s*'([^']+)'")
      .firstMatch(podspec)
      ?.group(1);
  final gradleDep =
      RegExp(r'pokepaylib:([0-9][\w.\-]*)').firstMatch(gradle)?.group(1);

  stdout.writeln('versions: pubspec=$pubVersion podspec=$podVersion '
      'Pokepay(pod)=$podDep pokepaylib(maven)=$gradleDep');

  if (pubVersion == null || podVersion == null) {
    errors.add('バージョン表記を検出できませんでした '
        '(pubspec=$pubVersion, podspec=$podVersion)');
    return;
  }
  if (pubVersion != podVersion) {
    errors.add('SDKバージョン不一致: pubspec.yaml=$pubVersion, '
        'podspec s.version=$podVersion');
  }
  if (podDep != null && gradleDep != null && podDep != gradleDep) {
    warnings.add('ネイティブSDK依存バージョンが不一致: '
        'iOS Pokepay=$podDep, Android pokepaylib=$gradleDep');
  }
}
