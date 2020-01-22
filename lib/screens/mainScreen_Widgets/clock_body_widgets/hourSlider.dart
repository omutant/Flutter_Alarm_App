import 'dart:async';

import 'package:flutter/material.dart';

import '../clock_face.dart';

StreamController<String> hourCon = StreamController<String>();

ClockFace cFace = ClockFace();


class HTimer extends StatefulWidget {
  @override
  HTimerState createState() => HTimerState();
}

class HTimerState extends State<HTimer> {
  @override
  void initState() {
    super.initState();
  }

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
            hourCon.add(timText.setTimerText());
            cFace.cButt.pause();
          });
        },
      onChangeEnd: (double value) {
        cButt.setSaveTime();
      },
    );
  }
}
