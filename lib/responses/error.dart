import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../responses.dart';

part 'error.g.dart';

@JsonSerializable()
class Error extends Response {
  @JsonKey(nullable: false)
  final String type;
  @JsonKey(nullable: false)
  final String message;
  Error({
    @required this.type,
    @required this.message,
  });
  factory Error.fromJson(Map<String, dynamic> json) => _$ErrorFromJson(json);
  Map<String, dynamic> toJson() => _$ErrorToJson(this);
}

@JsonSerializable()
class OAuthError extends Response {
  @JsonKey(nullable: false)
  final String error;
  OAuthError({
    @required this.error,
  });
  factory OAuthError.fromJson(Map<String, dynamic> json) =>
      _$OAuthErrorFromJson(json);
  Map<String, dynamic> toJson() => _$OAuthErrorToJson(this);
}

@JsonSerializable()
class APIRequestError extends Response {
  @JsonKey(nullable: false)
  final int statusCode;
  @JsonKey(nullable: false)
  final Error error;
  APIRequestError({
    @required this.statusCode,
    @required this.error,
  });
  factory APIRequestError.fromJson(Map<String, dynamic> json) =>
      _$APIRequestErrorFromJson(json);
  Map<String, dynamic> toJson() => _$APIRequestErrorToJson(this);
}

@JsonSerializable()
class ProcessingError extends Response {
  @JsonKey(nullable: false)
  final String message;
  ProcessingError({
    @required this.message,
  });
  factory ProcessingError.fromJson(Map<String, dynamic> json) =>
      _$ProcessingErrorFromJson(json);
  Map<String, dynamic> toJson() => _$ProcessingErrorToJson(this);
}

@JsonSerializable()
class OAuthRequestError extends Response {
  @JsonKey(nullable: false)
  final int statusCode;
  @JsonKey(nullable: false)
  final OAuthError error;
  OAuthRequestError({
    @required this.statusCode,
    @required this.error,
  });
  factory OAuthRequestError.fromJson(Map<String, dynamic> json) =>
      _$OAuthRequestErrorFromJson(json);
  Map<String, dynamic> toJson() => _$OAuthRequestErrorToJson(this);
}
