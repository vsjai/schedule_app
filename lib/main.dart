import 'package:flutter/material.dart';
import 'package:schedule_app/app/app.locator.dart';
import 'package:schedule_app/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

void main() async {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: StackedService.navigatorKey,
      title: 'Schedule App',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
