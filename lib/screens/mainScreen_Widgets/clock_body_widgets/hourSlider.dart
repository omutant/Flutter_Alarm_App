//Comments last updated: 29-01-2020
import 'dart:async';

import 'package:flutter/material.dart';

import '../clock_face.dart';

// Controller used to update Hour Slider when mainText gets updated.
StreamController<String> hourCon = StreamController<String>();

// References the primary instantiation of the ClockFace
ClockFace cFace = ClockFace();

// Hour Slider Widget
class HTimer extends StatefulWidget {
  @override
  HTimerState createState() => HTimerState();
}

class HTimerState extends State<HTimer> {
  void dispose() {
    hourCon.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Slider(
      min: 0,
      max: 59,
      value: hour.toDouble(),
      onChanged: (double value) {
        setState(() {
          hour = value.toInt();
          hourCon.add(timTick.setTimerText());
          cFace.cButt.pause();
        });
      },
      onChangeEnd: (double value) => cButt.setSaveTime(),
    );
  }
}
