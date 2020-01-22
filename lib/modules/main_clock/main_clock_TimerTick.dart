import 'dart:async';

import 'package:alarm_app/screens/mainScreen_Widgets/clock_face.dart';

StreamController timerCon = StreamController<String>();

class TimerTicker {
  bool isAlarmPlaying = false;

  void tick() {
    if (isAlarmPlaying) {
      timerTick();
    }
  }

  int timerTick() {
    timerCon.add(timText.setTimerText());

    if (isAlarmPlaying) {
      if (hour == 0 && min == 0 && sec == 1) {
        sec--;
        isAlarmPlaying = false;
      }

      if (hour >= 0) {
        if (min == 0 && sec != 0) {
          return sec--;
        }
        if (min >= 1) {
          if (sec >= 1) {
            return sec--;
          }
          sec = 59;
          return min--;
        }
        if (hour == 0) {
          return 0;
        }
        sec = 59;
        min = 59;
        return hour--;
      }
      return 0;
    }
    return 0;
  }
}
