import 'package:json_annotation/json_annotation.dart';

part 'topup_method.g.dart';

@JsonSerializable()
class TopupMethod {
  // "type" can be "credit-card", "sevenbank-atm", "paytree-bank", or "cvs"
  final String type;
  final String name;
  final List<double>? amounts;
  final List<double>? range;

  TopupMethod({
    required this.type,
    required this.name,
    this.amounts,
    this.range,
  });

  factory TopupMethod.fromJson(Map<String, dynamic> json) =>
      _$TopupMethodFromJson(json);

  Map<String, dynamic> toJson() => _$TopupMethodToJson(this);

  @override
  String toString() => this.toJson().toString();
}
