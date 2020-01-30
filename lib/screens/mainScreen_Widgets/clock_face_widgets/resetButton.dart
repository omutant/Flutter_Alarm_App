//Comments last updated: 29-01-2020
import 'dart:async';

import 'package:alarm_app/icons/typicons_omu_alarm_icons.dart';
import 'package:alarm_app/themeData.dart';
import 'package:flutter/material.dart';

import '../clock_face.dart';

// Updates Icons and MainText when reset is pressed
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
            icon: Icon(TypiconsOmuAlarm.cw_outline),
            onPressed: () {
              cButt.reset();
              resetUpdateCon.add(timTick.setTimerText());
              updatePlayIconCon.add(timTick.setTimerText());
            },
          ),
        ),
      ),
    );
  }
}
