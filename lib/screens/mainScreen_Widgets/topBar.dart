import 'package:alarm_app/themeData.dart';
import 'package:flutter/material.dart';

Widget topBar(BuildContext context) {
  return AppBar(
    backgroundColor: defaultTheme.backgroundColor,
    centerTitle: true,
    title: Text('Omu alarm', style: defaultTheme.textTheme.headline),
  );
}
