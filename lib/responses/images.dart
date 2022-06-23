import 'package:json_annotation/json_annotation.dart';

import '../responses.dart';

part 'images.g.dart';

@JsonSerializable()
class Images {
  final String card;

  final String res300;

  final String res600;

  Images({
    required this.card,
    required this.res300,
    required this.res600,
  });

  factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);
  Map<String, dynamic> toJson() => _$ImagesToJson(this);
}