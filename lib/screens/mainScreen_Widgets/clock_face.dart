//Comments last updated: 29-01-2020
import 'dart:async';

import 'package:alarm_app/icons/typicons_omu_alarm_icons.dart';
import 'package:alarm_app/modules/main_clock/main_clock_ClockButtons.dart';
import 'package:alarm_app/modules/main_clock/main_clock_TimerTick.dart';
import 'package:alarm_app/screens/mainScreen_Widgets/clock_face_widgets/clockFaceText.dart';
import 'package:alarm_app/screens/mainScreen_Widgets/clock_face_widgets/resetButton.dart';

import 'package:flutter/material.dart';

import 'clock_face_widgets/pausePlayButton.dart';

const oneSec = const Duration(seconds: 1);

TimerTicker timTick = new TimerTicker();
ClockButtons cButt = new ClockButtons();

int sec = 0;
int min = 0;
int hour = 0;

StreamController<String> bodCon = StreamController<String>();

class ClockFace extends StatefulWidget {
  final timTick = TimerTicker();
  final cButt = ClockButtons();

  @override
  ClockFaceState createState() => ClockFaceState();
}

class ClockFaceState extends State<ClockFace> {
  @override
  void initState() {
    super.initState();

    Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        // Acception to the "No logic in the graphics code" rule
        if (timTick.isClockRunning) {
          bodCon.add(timTick.setTimerText());
          timTick.tick();
        }
      });
    });
  }

  void dispose() {
    super.dispose();
    bodCon.close();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            ClockFacePP(),
            SizedBox(
              height: 10,
            ),
            ClockFaceText(),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ClockFaceReset(),
                IconButton(
                  color: Colors.white,
                  icon: Icon(TypiconsOmuAlarm.plus_outline),
                  onPressed: () => cButt.saveTimer(mainText),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
