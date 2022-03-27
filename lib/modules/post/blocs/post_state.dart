import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:zingoapp/modules/post/models/post.dart';

@immutable
abstract class PostState extends Equatable {}

// When the user presses the signin or signup button the state is changed to loading first and then to Authenticated.
class LoadingPost extends PostState {
  @override
  List<Object?> get props => [];
}

// When the user is authenticated the state is changed to Authenticated.
class LoadedPost extends PostState {
  final List<Post>? list;
  LoadedPost(this.list);
  @override
  List<Object?> get props => [list];
}

// If any error occurs the state is changed to AuthError.
class LoadErrorPost extends PostState {
  final String error;

  LoadErrorPost(this.error);
  @override
  List<Object?> get props => [error];
}
