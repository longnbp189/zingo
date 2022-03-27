// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String?,
      userName: json['username'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      avatar: json['avatar'] == null
          ? null
          : Avatar.fromJson(json['avatar'] as Map<String, dynamic>),
      profile: json['profile'] == null
          ? null
          : Profile.fromJson(json['profile'] as Map<String, dynamic>),
      accessToken: json['access_token'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.userName,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'avatar': instance.avatar?.toJson(),
      'profile': instance.profile?.toJson(),
      'access_token': instance.accessToken,
    };
