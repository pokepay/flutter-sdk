import 'package:json_annotation/json_annotation.dart';

part 'user_with_auth_factors.g.dart';

@JsonSerializable()
class UserWithAuthFactors {
  final String id;
  final String name;
  final bool? isMerchant;
  final String? tel;
  final String? email;
  final bool isPasswordRegistered;

  UserWithAuthFactors({
    required this.id,
    required this.name,
    this.isMerchant,
    this.tel,
    this.email,
    required this.isPasswordRegistered,
  });

  factory UserWithAuthFactors.fromJson(Map<String, dynamic> json) =>
      _$UserWithAuthFactorsFromJson(json);

  Map<String, dynamic> toJson() => _$UserWithAuthFactorsToJson(this);

  @override
  String toString() => this.toJson().toString();
}
