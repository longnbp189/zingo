import 'package:equatable/equatable.dart';

abstract class PostEvent extends Equatable {
  @override
  List<Object> get props => [];
}

// When the user signing in with google this event is called and the [AuthRepository] is called to sign in the user
class CreatePostRequested extends PostEvent {}

// When the user signing out this event is called and the [AuthRepository] is called to sign out the user
class DeletePostRequested extends PostEvent {}

class UpdatePostRequested extends PostEvent {}

class GetPostRequested extends PostEvent {}
