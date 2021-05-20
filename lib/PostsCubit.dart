import 'package:basic_bloc_app/data_service.dart';

import 'Post.dart';
import 'package:bloc/bloc.dart';

class PostsCubit extends Cubit<List<Post>> {
  final _dataService = DataService();

  PostsCubit() : super([]);

  void getPosts() async => emit(await _dataService.getPosts());
}
