import 'package:flutter/material.dart';
import 'package:flutter_redux_colors_numbers/actions/actions.dart';
import 'package:flutter_redux_colors_numbers/states/states.dart';

Map changeColorState = {
  Colors.red.shade100: (ColorState colorState) =>
      colorState.copyWith(color: Colors.green.shade100),
  Colors.green.shade100: (ColorState colorState) =>
      colorState.copyWith(color: Colors.blue.shade100),
  Colors.blue.shade100: (ColorState colorState) =>
      colorState.copyWith(color: Colors.red.shade100),
};

ColorState colorReducer(ColorState colorState, dynamic action) {
  if (action is ChangeColorAction) {
    return changeColorState[colorState.color](colorState);
  }
  return colorState;
}
