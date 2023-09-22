import 'package:json_annotation/json_annotation.dart';

part 'identification_match.g.dart';

@JsonSerializable()
class IdentificationMatch {
  final bool name;
  final bool gender;
  final bool address;
  final bool dateOfBirth;

  IdentificationMatch({
    required this.name,
    required this.gender,
    required this.address,
    required this.dateOfBirth,
  });

  factory IdentificationMatch.fromJson(Map<String, dynamic> json) =>
      _$IdentificationMatchFromJson(json);

  Map<String, dynamic> toJson() => _$IdentificationMatchToJson(this);

  @override
  String toString() => this.toJson().toString();
}
