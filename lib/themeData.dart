import 'dart:ui';

import 'package:flutter/material.dart';

Color bgColor = Color(0xFF515151);
Color hiColor = Color(0x31EBAAEB);
Color shadowColor = Color(0x50000000);
Color textColor = Color(0xFFCACACA);
Color glowColor = Color(0xFF698DFF);

const edgeColor = Color(0xFF000000);
const iconColor = Color(0xFFFFFFFF);

final ThemeData defaultTheme = _buildDefaultTheme();

ThemeData _buildDefaultTheme() {
  final ThemeData base = ThemeData.dark();
  
  return base.copyWith(
    backgroundColor: bgColor,
    highlightColor: hiColor,
    accentColor: shadowColor,
    textTheme: TextTheme(
      headline: TextStyle(fontSize: 29.0, color: textColor),
      body1: TextStyle(fontSize: 24.0,color: textColor)
    ),
  );
}
