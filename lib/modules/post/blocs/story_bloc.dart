import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zingoapp/modules/post/blocs/story_event.dart';
import 'package:zingoapp/modules/post/blocs/story_state.dart';
import 'package:zingoapp/modules/post/repos/story_repo.dart';

class StoryBloc extends Bloc<StoryEvent, StoryState> {
  final StoryRepo storyRepo;
  StoryBloc({required this.storyRepo}) : super(LoadingStory()) {
    on<GetStoryRequested>((event, emit) async {
      emit(LoadingStory());
      try {
        var list = await storyRepo.getStoryUserList();
        emit(LoadedStory(list));
      } catch (e) {
        emit(LoadErrorStory(e.toString()));
      }
    });
  }
}
