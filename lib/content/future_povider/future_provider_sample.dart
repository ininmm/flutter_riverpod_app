import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

part 'counter_future_provider.dart';

class FutureProviderSample extends HookWidget {
  const FutureProviderSample({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final asyncValue = useProvider(countFutureProvider);
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
          asyncValue.when(
            data: (value) => Text(
              value.toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
            loading: () => Text(
              'Loading',
              style: Theme.of(context).textTheme.headline4,
            ),
            error: (error, stackTrace) => Text(
              stackTrace.toString(),
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.refresh(countFutureProvider);
        },
        tooltip: 'Increment',
        child: Icon(Icons.refresh),
      ),
    );
  }
}
