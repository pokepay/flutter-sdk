# Pokepay Flutter SDK
## API Document reference
Please refer to [this document](https://docs.pokepay.jp/guidelines/app-sdk/java.html#_client_api)
## Requirements
* iOS 15.0 or later (required by the native `Pokepay` pod as of 2.3.0)
* Android `minSdkVersion` 26 or later

### iOS setup

In your app's `ios/Podfile`, set the platform and raise the deployment target of
every pod. Both are required: `APIKit` (a transitive dependency of `Pokepay`)
declares iOS 9.0 and the `Flutter` pod declares 11.0, and Xcode 26 and later
refuse to build anything below 15.0.

```ruby
platform :ios, '15.0'

post_install do |installer|
  installer.pods_project.targets.each do |target|
    flutter_additional_ios_build_settings(target)
    # Must come after flutter_additional_ios_build_settings, which resets it.
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '15.0'
    end
  end
end
```

Also set `IPHONEOS_DEPLOYMENT_TARGET` to 15.0 for the `Runner` target itself
(Xcode: Runner → General → Minimum Deployments).

## Install
1. In the pubspec.yaml of the project, add the following:
 ```yaml  
 dependencies:
    pokepay_sdk: ^YOUR_VERSION
 ```
2. Then run this
```sh
flutter pub get
```
3. Then you can use Pokepay SDK in your project.
## Usage
1. How to use OAthClient with [FlutterWebAuth](https://pub.dev/packages/flutter_web_auth)
```flutter
PokepayOAuthClient oauthClient = PokepayOAuthClient(clientId: YOUR_CLIENT_ID,clientSecret: YOUR_CLIENT_SCRET, env: APIEnv.DEVELOPMENT);
String authUrl = oauthClient.getAuthorizationUrl();
String result = await FlutterWebAuth.authenticate(url: authUrl, callbackUrlScheme: 'pocketchange'));
AccessToken accessToken = await oauthClient.getAccessToken(Uri.parse(result).queryParameters['code']));
```
2. How to use the client
```flutter
PokepayAPI(env: APIEnv.YOUR_ENV,accessToken: YOUR_ACCESS_TOKEN,);
```
3. Call API, for example, create account
```flutter
PokepayAPI api = PokepayAPI(env: APIEnv.YOUR_ENV,accessToken: YOUR_ACCESS_TOKEN,);
Account createdAccount = await api.createAccount(name:your_wallet_name, privateMoneyId: your_private_money_id);
``` 

## Development

### Generated code

`lib/generated/` 以下と `android/.../AutogenMethodHandlers.java` /
`ios/Classes/AutogenMethodHandlers.swift` はコードジェネレーターによる
自動生成ファイルです。手で編集しないでください。

再生成後は build_runner で `.g.dart` を更新します:

```sh
flutter pub run build_runner build --delete-conflicting-outputs
```

### Consistency lint

Dart が送るメソッド名・引数キーとネイティブプラグイン側の読み取りの
食い違い (実行時に null になる) を検出します。CI でも実行されます。

```sh
dart tool/check_native_links.dart          # エラーのみ fail
dart tool/check_native_links.dart --strict # warning も fail
```
