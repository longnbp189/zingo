import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zingoapp/modules/post/blocs/post_event.dart';
import 'package:zingoapp/modules/post/blocs/post_state.dart';
import 'package:zingoapp/modules/post/repos/post_repo.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepo postRepo;
  PostBloc({required this.postRepo}) : super(LoadingPost()) {
    on<GetPostRequested>((event, emit) async {
      emit(LoadingPost());
      try {
        var list = await postRepo.getPostList();
        emit(LoadedPost(list));
      } catch (e) {
        emit(LoadErrorPost(e.toString()));
      }
    });
  }
}
