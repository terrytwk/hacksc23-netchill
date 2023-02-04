import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class User {
  const User({
    this.firstName,
    this.lastName,
    this.profilePic,
    this.position,
    this.organization,
  });

  final String? firstName;
  final String? lastName;
  final String? profilePic;
  final String? position;
  final String? organization;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
