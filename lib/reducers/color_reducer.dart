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
  print(colorState);
  print(action);

  if (action is ChangeColorAction) {
    return changeColorState[colorState.color](colorState);

    // if (colorState.color == Colors.red) {
    //   return colorState.copyWith(color: Colors.green);
    // } else if (colorState.color == Colors.green) {
    //   return colorState.copyWith(color: Colors.blue);
    // } else if (colorState.color == Colors.blue) {
    //   return colorState.copyWith(color: Colors.red);
    // }
  }
  return colorState;
}
