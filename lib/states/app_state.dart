import 'package:equatable/equatable.dart';

import 'package:flutter_redux_colors_numbers/states/states.dart';

class AppState extends Equatable {
  final ColorState colorState;
  final CounterState counterState;
  AppState({
    required this.colorState,
    required this.counterState,
  });

  @override
  List<Object> get props => [colorState, counterState];

  @override
  String toString() =>
      'AppState(colorState: $colorState, counterState: $counterState)';
}
