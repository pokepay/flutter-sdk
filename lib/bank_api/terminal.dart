import 'package:meta/meta.dart';
import 'package:pokepay_flutter_sdk/pokepay_flutter_sdk_platform_interface.dart';

import '../pokepay_sdk.dart';
import '../responses.dart';

extension TerminalAPI on PokepayAPI {
  Future<ServerKey> addTerminalPublicKey({
    required String key,
  }) async {
    return await PokepayFlutterSdkPlatform.instance.invokeMethod<ServerKey>(
      (j) => ServerKey.fromJson(j),
      'addTerminalPublicKey',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'key': key,
      },
    );
  }

  Future<Terminal> getTerminal() async {
    return await PokepayFlutterSdkPlatform.instance.invokeMethod<Terminal>(
      (j) => Terminal.fromJson(j),
      "getTerminal",
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
      },
    );
  }

  Future<Terminal> updateTerminal({
    required String accountId,
    required String name,
    String? pushToken,
  }) async {
    return await PokepayFlutterSdkPlatform.instance.invokeMethod<Terminal>(
      (j) => Terminal.fromJson(j),
      'updateTerminal',
      {
        'env': this.env.index,
        'accessToken': this.accessToken,
        'accountId': accountId,
        'name': name,
        'pushToken': pushToken,
      },
    );
  }
}
