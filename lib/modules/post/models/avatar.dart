import 'package:json_annotation/json_annotation.dart';

part 'avatar.g.dart';

@JsonSerializable(explicitToJson: true)
class Avatar {
  @JsonKey(name: 'url')
  final String? url;
  @JsonKey(name: 'cloud_name')
  final String? cloudName;

  Avatar({
    this.url,
    this.cloudName,
  });

  factory Avatar.fromJson(Map<String, dynamic> json) => _$AvatarFromJson(json);

  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$EventToJson`.
  Map<String, dynamic> toJson() => _$AvatarToJson(this);
}
