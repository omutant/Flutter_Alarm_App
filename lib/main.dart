import 'package:alarm_app/screens/mainScreen.dart';
import 'package:alarm_app/themeData.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: defaultTheme,
      title: 'Omu Alarm app',
      home: MainScreen(),
    );
  }
}
