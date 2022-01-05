import 'package:flutter_redux_colors_numbers/actions/actions.dart';
import 'package:flutter_redux_colors_numbers/states/states.dart';

Map changePost = {
  FetchPostAction: (PostState postState, [dynamic action]) =>
      postState.copyWith(status: PostsStatus.loading),
  FetchPostSucceededAction: (
    PostState postState,
    FetchPostSucceededAction action,
  ) =>
      postState.copyWith(status: PostsStatus.loaded, post: action.post),
  FetchPostFailedAction: (
    PostState postState,
    FetchPostFailedAction action,
  ) =>
      postState.copyWith(status: PostsStatus.error, error: action.error),
};

PostState postReducer(PostState postState, dynamic action) {
  if (changePost[action.runtimeType] != null) {
    return changePost[action.runtimeType](postState, action);
  }

  return postState;
}
