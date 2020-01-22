import 'package:alarm_app/screens/mainScreen_Widgets/clock_face.dart';

ClockFace cFace = ClockFace();

class ClockButtons {
  void play() {
    timTick.isAlarmPlaying = true;
    print("Pressed play : " + timTick.isAlarmPlaying.toString());
  }

  void pause() {
    timTick.isAlarmPlaying = false;
    print("Pressed pause : ");
  }

  void reset() {
    print("Reset timer");
  }
}
