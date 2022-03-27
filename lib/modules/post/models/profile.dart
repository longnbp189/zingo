import 'package:json_annotation/json_annotation.dart';
import 'package:zingoapp/modules/post/models/story_image.dart';

part 'profile.g.dart';

@JsonSerializable(explicitToJson: true)
class Profile {
  @JsonKey(name: 'city_id')
  final int? cityId;
  @JsonKey(name: 'cover_images')
  final List<StoryImage>? coverImages;

  Profile({
    this.cityId,
    this.coverImages,
  });

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$EventToJson`.
  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
