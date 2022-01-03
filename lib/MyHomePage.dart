import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:flutter_redux_colors_numbers/actions/actions.dart';
import 'package:flutter_redux_colors_numbers/states/states.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ColorViewModel>(
      converter: (store) => _ColorViewModel(
        state: store.state.colorState,
        onColorChanged: () {
          print('onColorChanged!');
          store.dispatch(ChangeColorAction());
        },
      ),
      builder: (BuildContext context, _ColorViewModel colorVM) {
        return StoreConnector<AppState, _CounterViewModel>(
          converter: (store) => _CounterViewModel(
            state: store.state.counterState,
            onCounterIncremented: () {
              print('onCounterIncremented!!');
              store.dispatch(IncrementAction(color: colorVM.state.color));
            },
            onCounterDecremented: () {
              print('onCounterDecremented!!');
              store.dispatch(DecrementAction(color: colorVM.state.color));
            },
          ),
          builder: (BuildContext context, _CounterViewModel counterVM) {
            return Scaffold(
              backgroundColor: colorVM.state.color,
              appBar: AppBar(
                backgroundColor: Colors.blueAccent,
                actions: [
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Posts',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
              body: SizedBox(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      counterVM.state.counter.toString(),
                      // '${counterVM.state.counter}',
                      style:
                          TextStyle(fontSize: 50, fontWeight: FontWeight.w400),
                    ),
                    ElevatedButton(
                      onPressed: colorVM.onColorChanged,
                      child: Text(
                        'Change Color',
                        style: TextStyle(fontSize: 20),
                      ),
                    )
                  ],
                ),
              ),
              floatingActionButton: Padding(
                padding: EdgeInsets.only(
                  right: 15,
                  bottom: 15,
                ),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FloatingActionButton(
                        heroTag: 'btn1',
                        onPressed: counterVM.onCounterIncremented,
                        child: Icon(Icons.add),
                      ),
                      SizedBox(width: 5),
                      FloatingActionButton(
                        heroTag: 'btn2',
                        onPressed: counterVM.onCounterDecremented,
                        child: Icon(Icons.remove),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class _ColorViewModel {
  final ColorState state;
  final void Function() onColorChanged;

  _ColorViewModel({
    required this.state,
    required this.onColorChanged,
  });
}

class _CounterViewModel {
  final CounterState state;
  final void Function() onCounterIncremented;
  final void Function() onCounterDecremented;

  _CounterViewModel({
    required this.state,
    required this.onCounterIncremented,
    required this.onCounterDecremented,
  });
}
