// memo: used to generate first data from android-sdk

var fs = require("fs");

const dir = '/Users/ann/dev/pokepay/android-sdk/pokepaylib/src/main/java/jp/pokepay/pokepaylib/Responses';

function camelToSnake(camel) {
  return camel.replace(/[\w]([A-Z])/g, (m) => m[0]+'_'+m[1]).toLowerCase();
}

function snakeToCamel(snake) {
  return snake.replace(/(_\w)/g, (m) => m[1].toUpperCase());
}

fs.readdir(dir, (err, files) => {
  files.forEach((file) => {
    const fileName = camelToSnake(file).replace(/\.java$/, '');
    let output = '';
    fs.readFile(dir + '/' + file, { encoding: 'utf-8' }, (err, data) => {
      let sw = false;
      output += (`import 'package:json_annotation/json_annotation.dart';

part '${fileName}.g.dart';

`);
      let props = [];
      let className = '';
      data.split('\n').forEach((line) => {
        if (line.match(/^public class (.+?) (?:.+)\{$/)) {
          className = RegExp.$1;
          sw = true;
          output += `@JsonSerializable()
class ${className} {
`;
          return;
        } else if (line.match(/^\}$/)) {
          sw = false;
          output += `
  ${className}({
`;
          props.forEach(p => { output += `    this.${p},
`});
          output += `  });

  factory ${className}.fromJson(Map<String, dynamic> json) => _$${className}FromJson(json);
  Map<String, dynamic> toJson() => _$${className}ToJson(this);
}`;
          return;
        }
        if (sw) {
          line = line.replace(/^( *?)public\ +(?:[^ ]+?)\ +(.+?);$/, (
            (m, j, k) => {
              const prop = snakeToCamel(k);
              props.push(prop);
              const line = m.replace(k, prop);
              return line.replace(/^( *)public/, '  public');
            }
          ));
          line = line.replace(/    @NonNull/, '  @JsonKey(nullable: false)');
          line = line.replace(/public/g, 'final');
          line = line.replace(/boolean/g, 'bool   ');
          line = line.replace(/Double/g, 'double');
          line = line.replace(/Date/g, 'DateTime');
          output += line + '\n';
          return;
        }
      });
      fs.writeFile('./' + fileName + '.dart', output, { encoding: 'utf-8'}, (err) => {
        console.log(err);
        console.log(`output ${fileName}.dart`);
      });
    });
  })
});
