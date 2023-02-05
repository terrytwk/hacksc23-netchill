// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      email: json['email'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      profilePic: json['profilePic'] as String,
      position: json['position'] as String,
      organization: json['organization'] as String,
      bio: json['bio'] as String,
      phone: json['phone'] as String,
      interests: (json['interests'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'email': instance.email,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'profilePic': instance.profilePic,
      'position': instance.position,
      'organization': instance.organization,
      'bio': instance.bio,
      'phone': instance.phone,
      'interests': instance.interests,
    };
