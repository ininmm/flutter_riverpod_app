import 'package:flutter/material.dart';
import 'package:flutter_riverpod_app/Routes.dart';
import 'package:flutter_riverpod_app/content/future_povider/future_provider_sample.dart';
import 'package:flutter_riverpod_app/content/state_notifier_provider/state_notifier_provider_sample.dart';
import 'package:flutter_riverpod_app/content/state_provider/state_provider_sample.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Riverpod Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: Routes.Future_Provider,
      routes: {
        Routes.State_Provider: (context) =>
            StateProviderSample(title: 'StateProvider Sample'),
        Routes.State_Notifier_Provider: (context) =>
            StateNotifierProviderSample(
              title: 'StateNotifierProvider Sample',
            ),
        Routes.Future_Provider: (context) => FutureProviderSample(
              title: 'FutureProvider Sample',
            ),
      },
    );
  }
}
