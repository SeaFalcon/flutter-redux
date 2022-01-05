import 'package:equatable/equatable.dart';

import 'package:flutter_redux_colors_numbers/models/failure_model.dart';
import 'package:flutter_redux_colors_numbers/states/states.dart';

class HttpCoreState extends Equatable {
  final Failure error;
  final PostsStatus status;
  HttpCoreState({
    required this.error,
    required this.status,
  });

  HttpCoreState copyWith({
    Failure? error,
    PostsStatus? status,
  }) {
    return HttpCoreState(
      error: error ?? this.error,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [error, status];
}
