import 'dart:async';

import 'package:alarm_app/icons/typicons_omu_alarm_icons.dart';

import 'package:alarm_app/themeData.dart';
import 'package:flutter/material.dart';

import '../clock_face.dart';
import 'clockFaceText.dart';
import 'resetButton.dart';

ClockFace cFace = ClockFace();
StreamController playUpdateCon = StreamController<String>();


class ClockFacePP extends StatefulWidget {
  @override
  ClockFacePPState createState() => ClockFacePPState();
}

class ClockFacePPState extends State<ClockFacePP> {
  StreamSubscription<String> updatePlayIconSub;

  void updateIcon() {
    setState(() {
      mainText = timText.setTimerText();
    });
  }

  void dispose() {
    super.dispose();
    updatePlayIconSub.cancel();
  }

  @override
  void initState() {
    super.initState();
    updatePlayIconSub = subStreamString(updatePlayIconCon, mainText);
  }

    StreamSubscription subStreamString(
      StreamController<String> controller, var value) {
    controller.stream.listen((value) {
      updateIcon();
      playUpdateCon.add(timText.setTimerText());
    });
    return null;
  }

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
                  icon: Icon(TypiconsOmuAlarm.play_outline),
                  onPressed: () {
                    setState(() {
                      cButt.play();
                    });
                  },
                )
              : IconButton(
                  color: Colors.white,
                  icon: Icon(TypiconsOmuAlarm.pause_outline),
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
