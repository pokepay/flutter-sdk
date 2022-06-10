import '../responses.dart';


class AccessToken extends Response {
  
   String? accessToken;
   String? refreshToken;
   String? tokenType;
   int? expiresIn;
   DateTime? createdAt;
   int? validPeriod;
   int? validDay;


  AccessToken({
     this.accessToken,
     this.refreshToken,
     this.tokenType,
     this.expiresIn,
     this.createdAt,
     this.validPeriod,
     this.validDay,
  });

   AccessToken.fromJson(Map<String, dynamic> json){
    accessToken= json['access_token'] as String;
    refreshToken= json['refresh_token'] as String;
    tokenType= json['token_type'] as String;
    expiresIn= json['expires_in'] as int;

    createdAt = json['createdAt'] != null
        ? DateTime.fromMillisecondsSinceEpoch(json['createdAt'])
        : null;
    validPeriod = expiresIn!~/86400;
    if(json['createdAt']!=null) {
      validDay = DateTime
          .now()
          .difference(createdAt!)
          .inDays;
    }
  }

   bool get isExpired {
     if (createdAt == null) {
       return true;
     }
     return validPeriod! <= DateTime.now().difference(createdAt!).inDays;
   }

  Map<String, dynamic> toJson() {
     return <String, dynamic>{
       'access_token': accessToken,
       'refresh_token': refreshToken,
       'token_type': tokenType,
       'expires_in': expiresIn,
       'createdAt' : createdAt.toString(),
       'validPeriod' : validPeriod,
       'validDay' : validDay
     };
  }
}

