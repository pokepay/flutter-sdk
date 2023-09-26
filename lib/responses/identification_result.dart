import 'package:json_annotation/json_annotation.dart';
import 'identification_match.dart';

part 'identification_result.g.dart';

@JsonSerializable()
class IdentificationResult {
  final bool isValid;
  final String? identifiedAt;
  final IdentificationMatch match;

  IdentificationResult({
    required this.isValid,
    this.identifiedAt,
    required this.match,
  });

  factory IdentificationResult.fromJson(Map<String, dynamic> json) =>
      _$IdentificationResultFromJson(json);

  Map<String, dynamic> toJson() => _$IdentificationResultToJson(this);

  @override
  String toString() => this.toJson().toString();
}
