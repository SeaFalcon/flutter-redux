import 'package:flutter_redux_colors_numbers/models/failure_model.dart';
import 'package:flutter_redux_colors_numbers/models/post_model.dart';
import 'package:flutter_redux_colors_numbers/repositories/post_repository.dart';
import 'package:flutter_redux_colors_numbers/states/states.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

class FetchPostsAction {}

class FetchPostsSucceededAction {
  final List<Post> posts;

  FetchPostsSucceededAction({required this.posts});
}

class FetchPostsFailedAction {
  final Failure error;

  FetchPostsFailedAction({required this.error});
}

//

ThunkAction<AppState> fetchPostAndDispatch(int postId) {
  return (Store<AppState> store) async {
    print(store.runtimeType);
    print('postId: $postId');

    store.dispatch(FetchPostAction());

    try {
      final Post post = await PostRepository().fetchPost(postId);

      store.dispatch(FetchPostSucceededAction(post: post));
    } on Failure catch (err) {
      store.dispatch(FetchPostFailedAction(error: err));
    }
  };
}

class FetchPostAction {}

class FetchPostSucceededAction {
  final Post post;

  FetchPostSucceededAction({required this.post});
}

class FetchPostFailedAction {
  final Failure error;

  FetchPostFailedAction({required this.error});
}
