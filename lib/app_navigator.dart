import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'NavCubit.dart';
import 'Post.dart';
import 'PostsDetails.dart';
import 'PostsView.dart';

class AppNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavCubit, Post>(builder: (context, post) {
      return Navigator(
        pages: [
          MaterialPage(child: PostsView()),
          if (post != null) MaterialPage(child: PostDetailsView(post: post))
        ],
        onPopPage: (route, result) {
          BlocProvider.of<NavCubit>(context).popToPosts();
          return route.didPop(result);
        },
      );
    });
  }
}
