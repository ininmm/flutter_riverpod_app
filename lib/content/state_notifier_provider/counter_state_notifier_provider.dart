part of 'state_notifier_provider_sample.dart';

final countStateNotifierProvider = StateNotifierProvider((ref) => Counter(0));

class Counter extends StateNotifier<int> {
  Counter(state) : super(state);

  void add(int count) {
    state += count;
  }
}
