part of 'future_provider_sample.dart';

final countFutureProvider = FutureProvider<int>((ref) => Future.delayed(
      Duration(seconds: 3),
      () {
        return Random().nextInt(50);
      },
    ));
