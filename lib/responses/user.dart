
import 'package:meta/meta.dart';

import '../responses.dart';

part 'user.g.dart';


class User extends Response {
  
  final String id;
  final String name;
  final bool isMerchant;

  User({
    required this.id,
    required this.name,
    required this.isMerchant,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
