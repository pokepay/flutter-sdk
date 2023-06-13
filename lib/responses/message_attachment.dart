import 'package:json_annotation/json_annotation.dart';
import 'private_money.dart';

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

  factory MessageAttachment.fromJson(Map<String, dynamic> json) =>
      _$MessageAttachmentFromJson(json);

  Map<String, dynamic> toJson() => _$MessageAttachmentToJson(this);

  @override
  String toString() => this.toJson().toString();
}
