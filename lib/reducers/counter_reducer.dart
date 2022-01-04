import 'package:flutter/material.dart';
import 'package:flutter_redux_colors_numbers/actions/actions.dart';
import 'package:flutter_redux_colors_numbers/states/counter_state.dart';

Map calculateByOperator = {
  '+': (counter, number) => counter + number,
  '-': (counter, number) => counter - number,
};

Map changeCounterState = {
  Colors.red.shade100: (CounterState counterState, String operatorType) =>
      counterState.copyWith(
          counter: calculateByOperator[operatorType](counterState.counter, 1)),
  Colors.green.shade100: (CounterState counterState, String operatorType) =>
      counterState.copyWith(
          counter: calculateByOperator[operatorType](counterState.counter, 2)),
  Colors.blue.shade100: (CounterState counterState, String operatorType) =>
      counterState.copyWith(
          counter: calculateByOperator[operatorType](counterState.counter, 3)),
};

CounterState counterReducer(CounterState counterState, dynamic action) {
  if (action is IncrementAction) {
    return changeCounterState[action.color](counterState, '+');
  } else if (action is DecrementAction) {
    return changeCounterState[action.color](counterState, '-');
  }

  return counterState;
}
