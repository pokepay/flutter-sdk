import 'package:json_annotation/json_annotation.dart';
import 'package:pokepay_sdk/responses/cvs_authorization.dart';

part 'paginated_cvs_authorizations.g.dart';

@JsonSerializable()
class PaginatedCvsAuthorizations {
  final int perPage;
  final int count;
  final String? next;
  final String? prev;
  final List<CvsAuthorization> items;

  PaginatedCvsAuthorizations({
    required this.perPage,
    required this.count,
    this.next,
    this.prev,
    required this.items,
  });

  factory PaginatedCvsAuthorizations.fromJson(Map<String, dynamic> json) =>
      _$PaginatedCvsAuthorizationsFromJson(json);

  Map<String, dynamic> toJson() => _$PaginatedCvsAuthorizationsToJson(this);

  @override
  String toString() => this.toJson().toString();
}
