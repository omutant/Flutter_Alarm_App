//Comments last updated: 29-01-2020
import 'dart:async';

import 'package:alarm_app/screens/mainScreen_Widgets/clock_face.dart';
import 'package:alarm_app/screens/mainScreen_Widgets/clock_face_widgets/clockFaceText.dart';
import 'package:alarm_app/screens/mainScreen_Widgets/drawer_widgets/favorites_Shelf.dart';

// setSaveTime variables
bool hasSetSaveTimeBeenCalled = false;
int savSec, savMin, savHour = 0;

// Used to update the clock face + body whenever a favorite gets called
StreamController<String> favUpdateBodyCon = StreamController<String>();
StreamController<String> favUpdateFaceCon = StreamController<String>();

class ClockButtons {
  // ClockFace Buttons
  void play() {
    timTick.isClockRunning = true;
  }

  void pause() {
    timTick.isClockRunning = false;
  }

  void reset() {
    if (hasSetSaveTimeBeenCalled) {
      sec = savSec;
      min = savMin;
      hour = savHour;
      pause();
      mainText = timTick.setTimerText();
    }
  }

  void saveTimer(String input) {
    if (!favoritesData.contains(input)) {
      favoritesData.add(input);
    } else {
      print("Error: Alarm already exists");
    }
  }

  // Saves set time for reset functionality
  void setSaveTime() {
    hasSetSaveTimeBeenCalled = true;
    savSec = sec;
    savMin = min;
    savHour = hour;
    timTick.setTimerText();
  }

  // Favorite controls
  void deleteFavorite(int index) {
    favoritesData.removeAt(index);
  }

  void setMainToFavorite(String input) {
    List<String> _times = input.split(':');

    int _iHour = int.parse(_times[0]);
    int _iMin = int.parse(_times[1]);
    int _iSec = int.parse(_times[2]);

    hour = _iHour;
    min = _iMin;
    sec = _iSec;
    favUpdateBodyCon.add(timTick.setTimerText());
    favUpdateFaceCon.add(timTick.setTimerText());
  }
}
