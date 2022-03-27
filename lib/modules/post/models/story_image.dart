import 'package:json_annotation/json_annotation.dart';

part 'story_image.g.dart';

@JsonSerializable(explicitToJson: true)
class StoryImage {
  @JsonKey(name: 'url')
  final String? url;
  @JsonKey(name: 'cloud_name')
  final String? cloudName;

  StoryImage({
    this.url,
    this.cloudName,
  });

  factory StoryImage.fromJson(Map<String, dynamic> json) =>
      _$StoryImageFromJson(json);

  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$EventToJson`.
  Map<String, dynamic> toJson() => _$StoryImageToJson(this);
}
