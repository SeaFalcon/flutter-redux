import 'package:equatable/equatable.dart';

import 'package:flutter_redux_colors_numbers/states/states.dart';

class AppState extends Equatable {
  final ColorState colorState;
  final CounterState counterState;
  final PostsState postsState;
  AppState({
    required this.colorState,
    required this.counterState,
    required this.postsState,
  });

  @override
  List<Object> get props => [colorState, counterState, postsState];

  @override
  String toString() =>
      'AppState(colorState: $colorState, counterState: $counterState, postsState: $postsState)';
}
