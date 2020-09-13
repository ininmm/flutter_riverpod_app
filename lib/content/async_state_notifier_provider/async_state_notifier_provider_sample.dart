import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

part 'counter_async_state_notifier_provider.dart';

class AsyncStateNotifierProviderSample extends HookWidget {
  const AsyncStateNotifierProviderSample({Key key, this.title})
      : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final AsyncValue<int> count = useProvider(asyncStateNotifierProvider.state);
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
          count.when(
            data: (value) => Text(
              value.toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
            loading: () => Text(
              'loading',
              style: Theme.of(context).textTheme.headline4,
            ),
            error: (error, stateTrace) => Text(
              stateTrace.toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read(asyncStateNotifierProvider).increase(2);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
