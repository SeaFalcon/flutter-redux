import 'package:flutter_redux_colors_numbers/actions/actions.dart';
import 'package:flutter_redux_colors_numbers/states/states.dart';

Map changePosts = {
  FetchPostsAction: (PostsState postsState) =>
      postsState.copyWith(status: PostsStatus.loading),
  FetchPostsSucceededAction:
      (PostsState postsState, FetchPostsSucceededAction action) =>
          postsState.copyWith(status: PostsStatus.loaded, posts: action.posts),
  FetchPostsFailedAction:
      (PostsState postsState, FetchPostsFailedAction action) =>
          postsState.copyWith(status: PostsStatus.error, error: action.error),
};

PostsState postsReducer(PostsState postsState, dynamic action) {
  print(action);

  return changePosts[action](postsState, action) | postsState;
}
