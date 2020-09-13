import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

part 'counter_state_notifier_provider.dart';

class StateNotifierProviderSample extends HookWidget {
  const StateNotifierProviderSample({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final count = useProvider(countStateNotifierProvider.state);
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
            count.toString(),
            style: Theme.of(context).textTheme.headline4,
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read(countStateNotifierProvider).add(2);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
