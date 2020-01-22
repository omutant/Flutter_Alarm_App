import 'package:alarm_app/icons/omu_alarm_icons_icons.dart';

import 'package:alarm_app/themeData.dart';
import 'package:flutter/material.dart';

import '../clock_face.dart';

ClockFace cFace = ClockFace();

class ClockFacePP extends StatefulWidget {
  @override
  ClockFacePPState createState() => ClockFacePPState();
}

class ClockFacePPState extends State<ClockFacePP> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: defaultTheme.backgroundColor,
        child: Ink(
          color: defaultTheme.backgroundColor,
          child: !timTick.isAlarmPlaying
              ? IconButton(
                  color: Colors.white,
                  icon: Icon(OmuAlarmIcons.play),
                  onPressed: () {
                    setState(() {
                      cButt.play();
                    });
                  },
                )
              : IconButton(
                  color: Colors.white,
                  icon: Icon(OmuAlarmIcons.pause),
                  onPressed: () {
                    setState(() {
                      cButt.pause();
                    });
                  },
                ),
        ),
      ),
    );
  }
}
