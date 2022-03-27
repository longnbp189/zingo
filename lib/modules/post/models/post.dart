import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:zingoapp/modules/post/models/photo.dart';
import 'package:zingoapp/modules/post/models/picture.dart';
import 'package:zingoapp/modules/post/models/user.dart';

part 'post.g.dart';

@JsonSerializable(explicitToJson: true)
class Post {
  @JsonKey(name: 'id', includeIfNull: false)
  final String? id;
  @JsonKey(name: 'status', includeIfNull: false)
  final int? status;
  @JsonKey(name: 'created_at', includeIfNull: false)
  final DateTime? createdAt;
  @JsonKey(name: 'updated_at', includeIfNull: false)
  final DateTime? updatedAt;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'description', includeIfNull: false)
  final String? description;
  @JsonKey(name: 'comment_counts', includeIfNull: false)
  final int? commentCounts;
  @JsonKey(name: 'like_counts', includeIfNull: false)
  final int? likeCounts;
  @JsonKey(name: 'liked', includeIfNull: false)
  final bool? liked;
  @JsonKey(name: 'user', includeIfNull: false)
  final User? user;
  @JsonKey(name: 'images', includeIfNull: false)
  final List<Picture>? images;
  @JsonKey(name: 'photos', includeIfNull: false)
  final List<Photo>? photos;

  Post(
      {this.id,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.title,
      this.description,
      this.commentCounts,
      this.likeCounts,
      this.liked,
      this.user,
      this.images,
      this.photos});

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);
}

String parseDate(String? datetime) {
  DateTime dt = DateTime.parse(datetime!);
  String formattedDate = DateFormat('dd/MM/yyyy').format(dt);

  return formattedDate;
}
