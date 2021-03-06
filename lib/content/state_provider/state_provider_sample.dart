import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'counter_state_provider.dart';

class StateProviderSample extends HookWidget {
  const StateProviderSample({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final stateProvider = useProvider(countStateProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'You have pushed the button this many times:',
          ),
          Text(
            stateProvider.state.toString(),
            style: Theme.of(context).textTheme.headline4,
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          stateProvider.state++;
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
