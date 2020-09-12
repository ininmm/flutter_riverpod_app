import 'dart:math';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

final Future<String> delayCount =
    Future.delayed(Duration(seconds: 2), () => 'hey');

final StateProvider<Future<String>> heyProvider =
    StateProvider((ProviderReference ref) async {
  return await delayCount;
});

final StateProvider<int> countProvider = StateProvider((ref) => 0);

final listFutureProvider = FutureProvider((ref) => Future.delayed(
      Duration(seconds: 3),
      () {
        List<String> list = [];
        for (int i = 0; i < 50; i++) {
          list.add(Random().nextInt(50).toString());
        }
        return list;
      },
    ));

final singleFutureProvider = FutureProvider((ref) => Future.delayed(
      Duration(seconds: 3),
      () {
        return Random().nextInt(50).toString();
      },
    ));

final StateNotifierProvider<Counter> hahaProvider =
    StateNotifierProvider((ref) {
  return Counter('123');
});

Future<Counter> create() async {
  var s = await Future.value('result');
  return delayCount.then((value) => Counter(value));
}

class Counter extends StateNotifier<String> {
  Counter(String state) : super(state);

  void setText(String text) async {
    state = await Future.delayed(Duration(seconds: 2), () => 'text');
  }
}
