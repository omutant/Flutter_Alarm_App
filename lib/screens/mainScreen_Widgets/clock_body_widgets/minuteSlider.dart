//Comments last updated: 29-01-2020
import 'dart:async';

import 'package:flutter/material.dart';

import '../clock_face.dart';

// Controller used to update Minute Slider when mainText gets updated.
StreamController<String> minCon = StreamController<String>();

// References the primary instantiation of the ClockFace
ClockFace cFace = ClockFace();

// Minute Slider Widget
class MTimer extends StatefulWidget {
  @override
  MTimerState createState() => MTimerState();
}

class MTimerState extends State<MTimer> {
  void dispose() {
    minCon.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Slider(
      min: 0,
      max: 59,
      value: min.toDouble(),
      onChanged: (double value) {
        setState(() {
          min = value.toInt();
          minCon.add(timTick.setTimerText());
          cFace.cButt.pause();
        });
      },
      onChangeEnd: (double value) => cButt.setSaveTime(),
    );
  }
}
