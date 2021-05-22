import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'Post.dart';

class NavCubit extends Cubit<Post> {
  NavCubit() : super(null);

  void showPostDetails(Post post) => emit(post);

  void popToPosts() => emit(null);
}
