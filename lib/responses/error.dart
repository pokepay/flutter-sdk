
import 'package:meta/meta.dart';

import '../responses.dart';

part 'error.g.dart';


class Error extends Response {
  
  final String type;
  
  final String message;
  Error({
    required this.type,
    required this.message,
  });
  factory Error.fromJson(Map<String, dynamic> json) => _$ErrorFromJson(json);
  Map<String, dynamic> toJson() => _$ErrorToJson(this);
}


class OAuthError extends Response {
  
  final String error;
  OAuthError({
    required this.error,
  });
  factory OAuthError.fromJson(Map<String, dynamic> json) =>
      _$OAuthErrorFromJson(json);
  Map<String, dynamic> toJson() => _$OAuthErrorToJson(this);
}


class APIRequestError extends Response {
  
  final int statusCode;
  
  final Error error;
  APIRequestError({
    required this.statusCode,
    required this.error,
  });
  factory APIRequestError.fromJson(Map<String, dynamic> json) =>
      _$APIRequestErrorFromJson(json);
  Map<String, dynamic> toJson() => _$APIRequestErrorToJson(this);
}


class ProcessingError extends Response {
  
  final String message;
  ProcessingError({
    required this.message,
  });
  factory ProcessingError.fromJson(Map<String, dynamic> json) =>
      _$ProcessingErrorFromJson(json);
  Map<String, dynamic> toJson() => _$ProcessingErrorToJson(this);
}


class OAuthRequestError extends Response {
  
  final int statusCode;
  
  final OAuthError error;
  OAuthRequestError({
    required this.statusCode,
    required this.error,
  });
  factory OAuthRequestError.fromJson(Map<String, dynamic> json) =>
      _$OAuthRequestErrorFromJson(json);
  Map<String, dynamic> toJson() => _$OAuthRequestErrorToJson(this);
}
