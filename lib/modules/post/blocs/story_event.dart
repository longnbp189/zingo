import 'package:equatable/equatable.dart';

abstract class StoryEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetStoryRequested extends StoryEvent {}
