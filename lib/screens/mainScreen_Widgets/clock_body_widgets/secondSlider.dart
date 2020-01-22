import 'dart:async';

import 'package:flutter/material.dart';

import '../../mainScreen.dart';
import '../clock_face.dart';

StreamController<String> secCon = StreamController<String>();

ClockFace cFace = new ClockFace();
MainScreen ma = MainScreen();

class STimer extends StatefulWidget {
  @override
  STimerState createState() => STimerState();
}

class STimerState extends State<STimer> {
  @override
  void initState() {
    super.initState();
  }

  void dispose() {
    secCon.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Slider(
        min: 0,
        max: 60,
        value: sec.toDouble(),
        onChanged: (double value) {
          setState(() {
            sec = value.toInt();
            secCon.add(timText.setTimerText());
          });
        });
  }
}
