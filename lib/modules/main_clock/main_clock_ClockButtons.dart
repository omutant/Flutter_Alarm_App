import 'package:alarm_app/screens/mainScreen_Widgets/clock_face.dart';
import 'package:alarm_app/screens/mainScreen_Widgets/clock_face_widgets/clockFaceText.dart';

ClockFace cFace = ClockFace();

int savSec, savMin, savHour = 0;
bool hasSetSaveTimeBeenCalled = false;

class ClockButtons {
  void play() {
    timTick.isAlarmPlaying = true;
  }

  void pause() {
    timTick.isAlarmPlaying = false;
  }

  void setSaveTime() {
    hasSetSaveTimeBeenCalled = true;
    savSec = sec;
    savMin = min;
    savHour = hour;
    timText.setTimerText();
  }

  void reset() {
    if (hasSetSaveTimeBeenCalled) {
      sec = savSec;
      min = savMin;
      hour = savHour;
      pause();
      mainText = timText.setTimerText();
    }
  }

  void saveTimer() {
    // get seconds, minutes, hours current values
    // save values to an intance of "TimerSave" which holds 3 values (sec, min, hours).
  }
}
