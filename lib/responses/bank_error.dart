import 'package:json_annotation/json_annotation.dart';

part 'bank_error.g.dart';

@JsonSerializable()
class BankError {
  @JsonKey(nullable: false)
  final String type;
  @JsonKey(nullable: false)
  final String message;
  final Object errors;

  BankError({
    this.type,
    this.message,
    this.errors,
  });

  factory BankError.fromJson(Map<String, dynamic> json) => _$BankErrorFromJson(json);
  Map<String, dynamic> toJson() => _$BankErrorToJson(this);
}