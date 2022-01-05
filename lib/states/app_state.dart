import 'package:equatable/equatable.dart';

import 'package:flutter_redux_colors_numbers/states/states.dart';

class AppState extends Equatable {
  final ColorState colorState;
  final CounterState counterState;
  final PostsState postsState;
  final PostState postState;
  AppState({
    required this.colorState,
    required this.counterState,
    required this.postsState,
    required this.postState,
  });

  @override
  List<Object> get props => [colorState, counterState, postsState, postState];

  @override
  String toString() {
    return 'AppState(colorState: $colorState, counterState: $counterState, postsState: $postsState, postState: $postState)';
  }
}
