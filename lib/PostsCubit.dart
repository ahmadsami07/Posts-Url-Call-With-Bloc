import 'package:basic_bloc_app/data_service.dart';

import 'Post.dart';
import 'package:bloc/bloc.dart';

class PostsCubit extends Cubit<List<Post>> {
  final _dataService = DataService();

  PostsCubit() : super([]);

  void getPosts() async => emit(await _dataService.getPosts());
}

abstract class PostsEvent {}

abstract class PostsState {}

class LoadPostsEvent extends PostsEvent {}

class PullToRefreshEvent extends PostsEvent {}

class LoadingPostsState extends PostsState {}

class LoadedPostsState extends PostsState {
  List<Post> Posts;
  LoadedPostsState({this.Posts});
}

class FailedToLoadPostsState extends PostsState {
  Error error;
  FailedToLoadPostsState({this.error});
}

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final _dataService = DataService();
  PostsBloc() : super(LoadingPostsState());

  @override
  Stream<PostsState> mapEventToState(PostsEvent event) async* {
    // TODO: implement mapEventToState
    if (event is LoadPostsEvent || event is PullToRefreshEvent) {
      yield LoadingPostsState();

      try {
        final posts = await _dataService.getPosts();
        yield LoadedPostsState(Posts: posts);
      } catch (e) {
        yield FailedToLoadPostsState(error: e);
      }
    }
  }
}
