import 'dart:async';

import 'package:alarm_app/icons/omu_alarm_icons_icons.dart';
import 'package:alarm_app/themeData.dart';
import 'package:flutter/material.dart';

import '../clock_face.dart';

ClockFace cFace = ClockFace();
StreamController resetUpdateCon = StreamController<String>();
StreamController updatePlayIconCon = StreamController<String>();

class ClockFaceReset extends StatefulWidget {
  @override
  ClockFaceResetState createState() => ClockFaceResetState();
}

class ClockFaceResetState extends State<ClockFaceReset> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        alignment: Alignment.center,
        color: defaultTheme.backgroundColor,
        child: Ink(
          color: defaultTheme.backgroundColor,
          child: IconButton(
            color: Colors.white,
            icon: Icon(OmuAlarmIcons.reset),
            onPressed: () {
              cButt.reset();
              resetUpdateCon.add(timText.setTimerText());
              updatePlayIconCon.add(timText.setTimerText());
            },
          ),
        ),
      ),
    );
  }
}
