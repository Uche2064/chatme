import 'package:json_annotation/json_annotation.dart';

part 'users.g.dart';
@JsonSerializable()
class Users{
  String? uid;
  String? name;
  String? email;
  DateTime? createdAt;


  Users({
    this.uid,
    this.name = "",
    this.email = "",
    this.createdAt
  });


  factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);

  Map<String, dynamic> toJson() => _$UsersToJson(this);
}