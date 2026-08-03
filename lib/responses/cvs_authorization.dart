import 'package:json_annotation/json_annotation.dart';
import 'package:pokepay_sdk/responses.dart';

part 'cvs_authorization.g.dart';

@JsonSerializable()
class CvsAuthorization {
  final String id;
  final String serviceOptionType;
  final double amount;
  final String name1;
  final String name2;
  final String tel;
  final String payLimit;
  final Account account;
  // コンビニ払込票の URL・受付番号と、完了/取消時刻。
  // done_at / canceled_at はネイティブ SDK (Java String / Swift String?) が
  // サーバの RFC3339 文字列をそのまま素通しするため、payLimit と同じく String で受ける。
  final String? haraikomiUrl;
  final String? receiptNo;
  final String? doneAt;
  final String? canceledAt;

  CvsAuthorization({
    required this.id,
    required this.serviceOptionType,
    required this.amount,
    required this.name1,
    required this.name2,
    required this.tel,
    required this.payLimit,
    required this.account,
    this.haraikomiUrl,
    this.receiptNo,
    this.doneAt,
    this.canceledAt,
  });

  factory CvsAuthorization.fromJson(Map<String, dynamic> json) =>
      _$CvsAuthorizationFromJson(json);

  Map<String, dynamic> toJson() => _$CvsAuthorizationToJson(this);

  @override
  String toString() => this.toJson().toString();
}
