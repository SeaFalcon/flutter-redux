import 'package:flutter_redux_colors_numbers/models/failure_model.dart';
import 'package:flutter_redux_colors_numbers/models/post_model.dart';

class FetchPostsAction {}

class FetchPostsSucceededAction {
  final List<Post> posts;

  FetchPostsSucceededAction({required this.posts});
}

class FetchPostsFailedAction {
  final Failure error;

  FetchPostsFailedAction({required this.error});
}
