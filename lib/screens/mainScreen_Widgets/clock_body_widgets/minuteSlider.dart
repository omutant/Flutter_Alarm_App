import 'dart:async';

import 'package:flutter/material.dart';

import '../clock_face.dart';

StreamController<String> minCon = StreamController<String>();

ClockFace cFace = ClockFace();

class MTimer extends StatefulWidget {
  @override
  MTimerState createState() => MTimerState();
}

class MTimerState extends State<MTimer> {
  @override
  void initState() {
    super.initState();
  }

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
          minCon.add(timText.setTimerText());
          cFace.cButt.pause();
        });
      },
      onChangeEnd: (double value) {
        cButt.setSaveTime();
      },
    );
  }
}
