import 'dart:async';

import 'package:alarm_app/screens/mainScreen_Widgets/clock_face.dart';
import 'package:alarm_app/screens/mainScreen_Widgets/clock_face_widgets/clockFaceText.dart';
import 'package:alarm_app/screens/mainScreen_Widgets/drawer_widgets/favorites.dart';

ClockFace cFace = ClockFace();

int savSec, savMin, savHour = 0;
bool hasSetSaveTimeBeenCalled = false;

StreamController<String> favUpdateBodyCon = StreamController<String>();
StreamController<String> favUpdateFaceCon = StreamController<String>();

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

  void saveTimer(String input) {
    if(!favoritesData.contains(input)){
      favoritesData.add(input);
    }
    else{
      print("Error: Alarm already exists");
    }
    // get seconds, minutes, hours current values
    // save values to an intance of "TimerSave" which holds 3 values (sec, min, hours).
  }

  void deleteFavorite(int index){
    favoritesData.removeAt(index);
  }

  void setMainToFavorite(String input){
    List<String> _times = input.split(':');

    int _iHour = int.parse(_times[0]);
    int _iMin = int.parse(_times[1]);
    int _iSec = int.parse(_times[2]);

    hour = _iHour;
    min = _iMin;
    sec = _iSec;
    favUpdateBodyCon.add(timText.setTimerText());
    favUpdateFaceCon.add(timText.setTimerText());
    
  }
}
