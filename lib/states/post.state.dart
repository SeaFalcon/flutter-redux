import 'package:flutter_redux_colors_numbers/models/failure_model.dart';
import 'package:flutter_redux_colors_numbers/models/post_model.dart';
import 'package:flutter_redux_colors_numbers/states/http_core_state.dart';
import 'package:flutter_redux_colors_numbers/states/states.dart';

class PostState extends HttpCoreState {
  final Post post;
  PostState({
    required this.post,
    required PostsStatus status,
    required Failure error,
  }) : super(status: status, error: error);

  factory PostState.initial() {
    return PostState(
      post: Post.emptyPost(),
      status: PostsStatus.initial,
      error: Failure(),
    );
  }

  @override
  List<Object> get props => [post, status, error];

  @override
  PostState copyWith({
    Post? post,
    Failure? error,
    PostsStatus? status,
  }) {
    return PostState(
      post: post ?? this.post,
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }

  @override
  String toString() => 'PostState(post: $post, error: $error, status: $status)';
}
