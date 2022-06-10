

part 'bank_error.g.dart';


class BankError {
  
  final String type;
  
  final String message;
  final Object? errors;

  BankError({
    required this.type,
    required this.message,
    this.errors,
  });

  factory BankError.fromJson(Map<String, dynamic> json) => _$BankErrorFromJson(json);
  Map<String, dynamic> toJson() => _$BankErrorToJson(this);
}