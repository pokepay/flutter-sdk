import 'package:json_annotation/json_annotation.dart';
import 'package:pokepay_flutter_sdk/responses/private_money.dart';

import '../custom_datetime_converter.dart';

part 'message_attachment.g.dart';

@JsonSerializable()
class MessageAttachment {
  final double? moneyAmount;
  final double? pointAmount;
  final PrivateMoney? privateMoney;
  final bool? isReceived;
  final DateTime? expiresAt;

  MessageAttachment({
    this.moneyAmount,
    this.pointAmount,
    this.privateMoney,
    this.isReceived,
    this.expiresAt,
  });

  factory MessageAttachment.fromJson(Map<String, dynamic> json) => _$MessageAttachmentFromJson(json);

  Map<String, dynamic> toJson() => _$MessageAttachmentToJson(this);
}
