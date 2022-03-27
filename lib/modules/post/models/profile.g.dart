// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      cityId: json['city_id'] as int?,
      coverImages: (json['cover_images'] as List<dynamic>?)
          ?.map((e) => StoryImage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'city_id': instance.cityId,
      'cover_images': instance.coverImages?.map((e) => e.toJson()).toList(),
    };
