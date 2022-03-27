import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:zingoapp/modules/post/models/user.dart';

@immutable
abstract class StoryState extends Equatable {}

class LoadingStory extends StoryState {
  @override
  List<Object?> get props => [];
}

// When the user is authenticated the state is changed to Authenticated.
class LoadedStory extends StoryState {
  final List<User>? list;
  LoadedStory(this.list);
  @override
  List<Object?> get props => [list];
}

// If any error occurs the state is changed to AuthError.
class LoadErrorStory extends StoryState {
  final String error;

  LoadErrorStory(this.error);
  @override
  List<Object?> get props => [error];
}
