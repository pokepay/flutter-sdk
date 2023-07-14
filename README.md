# Pokepay Flutter SDK
## API Document reference
Please refer to [this document](https://docs.pokepay.jp/guidelines/app-sdk/java.html#_client_api)
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
