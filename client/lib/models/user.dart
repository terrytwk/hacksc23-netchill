import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class User {
  const User({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.profilePic,
    required this.position,
    required this.organization,
    required this.bio,
    required this.phone,
    this.interests = const [],
  });

  final String email;
  final String firstName;
  final String lastName;
  final String profilePic;
  final String position;
  final String organization;
  final String bio;
  final String phone;
  final List<String> interests;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
