import 'package:alarm_app/screens/mainScreen_Widgets/clock_face.dart';

ClockFace cFace = ClockFace();

class TimerText {
  String setTimerText() {
    return '${(hour.toString().padLeft(2, '0'))}:' +
        '${(min.toString().padLeft(2, '0'))}:' +
        '${(sec.toString().padLeft(2, '0'))}';
  }
}
