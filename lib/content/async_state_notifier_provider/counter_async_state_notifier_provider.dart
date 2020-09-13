part of 'async_state_notifier_provider_sample.dart';

final asyncStateNotifierProvider =
    StateNotifierProvider((ref) => AsyncCounter());

class AsyncCounter extends StateNotifier<AsyncValue<int>> {
  AsyncCounter() : super(const AsyncValue.loading()) {
    increase(0);
  }

  int count = 0;

  Future<void> increase(int value) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      return await Future.delayed(Duration(seconds: 3), () => count += value);
    });
  }

  Future<void> add(int value) async {
    state = const AsyncValue.loading();
    try {
      final increase =
          await Future.delayed(Duration(seconds: 3), () => count += value);
      state = AsyncValue.data(increase);
    } catch (error, stack) {
      state = AsyncValue.error(error, stack);
    }
  }
}
