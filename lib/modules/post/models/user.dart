import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User {
  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'username')
  final String? userName;
  @JsonKey(name: 'first_name')
  final String? firstName;
  @JsonKey(name: 'last_name')
  final String? lastName;
  @JsonKey(name: 'avatar')
  final String? avatar;
  @JsonKey(name: 'access_token')
  final String? accessToken;

  User(
      {this.id,
      this.userName,
      this.firstName,
      this.lastName,
      this.avatar,
      this.accessToken});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$EventToJson`.
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
