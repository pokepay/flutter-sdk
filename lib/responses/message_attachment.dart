import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../custom_datetime_converter.dart';
import '../responses.dart';

part 'message_attachment.g.dart';

@JsonSerializable()
@CustomDateTimeConverter()
class MessageAttachment extends Response {
  final double moneyAmount;
  final double pointAmount;
  final PrivateMoney privateMoney;
  final bool isReceived;
  final DateTime expiresAt;

  MessageAttachment({
    this.moneyAmount,
    this.pointAmount,
    this.privateMoney,
    @required this.isReceived,
    this.expiresAt,
  });

  factory MessageAttachment.fromJson(Map<String, dynamic> json) =>
      _$MessageAttachmentFromJson(json);
  Map<String, dynamic> toJson() => _$MessageAttachmentToJson(this);
}
