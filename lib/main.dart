import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_redux_colors_numbers/middlewares/fetch_posts_middleware.dart';
import 'package:redux/redux.dart';

import 'package:flutter_redux_colors_numbers/MyHomePage.dart';
import 'package:flutter_redux_colors_numbers/reducers/app_reducer.dart';
import 'package:flutter_redux_colors_numbers/states/states.dart';

void main() {
  final store = Store<AppState>(appReducer,
      initialState: AppState(
        colorState: ColorState(color: Colors.red.shade100),
        counterState: CounterState(counter: 0),
        postsState: PostsState.initial(),
      ),
      middleware: [fetchPostsMiddleware]);
  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;
  MyApp({
    Key? key,
    required this.store,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Flutter Redux',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
}
