import 'package:flutter_redux_colors_numbers/reducers/reducers.dart';
import 'package:flutter_redux_colors_numbers/states/app_state.dart';

AppState appReducer(AppState state, action) {
  print(action);

  return AppState(
    colorState: colorReducer(state.colorState, action),
    counterState: counterReducer(state.counterState, action),
    postsState: postsReducer(state.postsState, action),
  );
}
