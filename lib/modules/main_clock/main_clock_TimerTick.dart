//Comments last updated: 29-01-2020
import 'dart:async';

import 'package:alarm_app/screens/mainScreen_Widgets/clock_face.dart';
import 'package:flutter/services.dart';

// Controller used to update timerText
StreamController timerCon = StreamController<String>();

class TimerTicker {
  bool isClockRunning = false;
  // how long the alarm should keep playing in seconds.
  int alarmPlayTime = 30;
  // Communication channel used to connect Flutter to android's Kotlin codebase
  var platform = MethodChannel('AlarmChannel');
  // Timer logic
  void tick() {
    timerCon.add(setTimerText());
    if (isClockRunning) {
      if (hour == 0 && min == 0 && sec == 0) {
        isClockRunning = false;
        _playAlarm();
      }
      countDown();
    }
  }

  // counts time down 1 sec
  void countDown() {
    if (sec > 0) {
      sec--;
      return;
    }

    if (min > 0) {
      sec = 59;
      min--;
      return;
    }

    if (hour > 0) {
      min = 59;
      sec = 59;
      hour--;
      return;
    }
  }

  // updates mainText. Used as a callback to update the clock UI
  String setTimerText() {
    return '${(hour.toString().padLeft(2, '0'))}:' +
        '${(min.toString().padLeft(2, '0'))}:' +
        '${(sec.toString().padLeft(2, '0'))}';
  }

  // Functions calling Kotlin logic
  Future<void> _playAlarm() async {
    await platform.invokeMethod("playAlarm");
    _stopAlarm();
  }

  Future<void> _stopAlarm() async {
    return new Future.delayed(Duration(seconds: alarmPlayTime),
        () => {platform.invokeMethod("stopAlarm")});
  }
}
