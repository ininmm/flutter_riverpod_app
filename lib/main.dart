import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod_app/Routes.dart';
import 'package:flutter_riverpod_app/content/async_state_notifier_provider/async_state_notifier_provider_sample.dart';
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
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: Routes.Root,
      routes: {
        Routes.Root: (context) => MainScreen(title: 'Flutter Riverpod App'),
        Routes.State_Provider: (context) =>
            StateProviderSample(title: 'StateProvider Sample'),
        Routes.State_Notifier_Provider: (context) =>
            StateNotifierProviderSample(
              title: 'StateNotifierProvider Sample',
            ),
        Routes.Future_Provider: (context) => FutureProviderSample(
              title: 'FutureProvider Sample',
            ),
        Routes.Async_State_Notifier_Provider: (context) =>
            AsyncStateNotifierProviderSample(
              title: 'Async StateNotifierProvider',
            ),
      },
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key key, this.title}) : super(key: key);

  final String title;

  static const List<MapEntry<String, String>> routeList = [
    MapEntry('StateProvider', Routes.State_Provider),
    MapEntry('StateNotifierProvider', Routes.State_Notifier_Provider),
    MapEntry('FutureProvider', Routes.Future_Provider),
    MapEntry(
        'AsyncStateNotifierProvider', Routes.Async_State_Notifier_Provider),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(8),
        itemCount: routeList.length,
        separatorBuilder: (BuildContext context, int index) => Divider(
          color: Colors.transparent,
        ),
        itemBuilder: (BuildContext context, int index) {
          return createButton(
              context, routeList[index].key, routeList[index].value);
        },
      ),
      backgroundColor: Color(0xfff6f6f6),
    );
  }

  CupertinoButton createButton(
    BuildContext context,
    String text,
    String route,
  ) =>
      CupertinoButton(
        child: Text(
          text,
          style:
              Theme.of(context).textTheme.headline6.apply(color: Colors.white),
        ),
        onPressed: () => Navigator.pushNamed(context, route),
        color: Colors.blue,
      );
}
