//Comments last updated: 29-01-2020
import 'dart:async';

import 'package:flutter/material.dart';

import '../clock_face.dart';

// Controller used to update Second Slider when mainText gets updated.
StreamController<String> secCon = StreamController<String>();

// References the primary instantiation of the ClockFace
ClockFace cFace = ClockFace();

// Second Slider Widget
class STimer extends StatefulWidget {
  @override
  STimerState createState() => STimerState();
}

class STimerState extends State<STimer> {
  void dispose() {
    secCon.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Slider(
      min: 0,
      max: 59,
      value: sec.toDouble(),
      onChanged: (double value) {
        setState(() {
          sec = value.toInt();
          secCon.add(timTick.setTimerText());
          cFace.cButt.pause();
        });
      },
      onChangeEnd: (double value) => cButt.setSaveTime(),
    );
  }
}
