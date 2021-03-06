import 'package:flutter_redux_colors_numbers/actions/actions.dart';
import 'package:flutter_redux_colors_numbers/models/post_model.dart';
import 'package:flutter_redux_colors_numbers/repositories/post_repository.dart';
import 'package:flutter_redux_colors_numbers/states/states.dart';
import 'package:redux/redux.dart';

// Map fetchActions = {
//   FetchPostsAction
// }

void fetchPostsMiddleware(
  Store<AppState> store,
  dynamic action,
  NextDispatcher next,
) {
  if (action is FetchPostsAction) {
    final api = PostRepository();

    api.fetchPosts().then((List<Post> posts) {
      store.dispatch(FetchPostsSucceededAction(posts: posts));
    }).catchError((error) {
      print('error: $error');
      store.dispatch(FetchPostsFailedAction(error: error));
    });
  }

  // if (action is FetchPostAction) {
  //   final api = PostRepository();

  //   api.fetchPost(action.postId).then((Post post) {
  //     store.dispatch(FetchPostSucceededAction(post: post));
  //   }).catchError((error) {
  //     print('error: $error');
  //     store.dispatch(FetchPostFailedAction(error: error));
  //   });
  // }

  next(action);
}
