import 'package:json_annotation/json_annotation.dart';

import '../responses.dart';

part 'images.g.dart';

@JsonSerializable()
class Images extends Response {
  final String card;
  @JsonKey(name: "300x300")
  final String res300;
  @JsonKey(name: "600x600")
  final String res600;

  Images({
    this.card,
    this.res300,
    this.res600,
  });

  factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);
  Map<String, dynamic> toJson() => _$ImagesToJson(this);
}
