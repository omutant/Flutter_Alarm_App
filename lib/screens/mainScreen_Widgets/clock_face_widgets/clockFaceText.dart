import 'dart:async';

import 'package:alarm_app/modules/main_clock/main_clock_ClockButtons.dart';
import 'package:alarm_app/modules/main_clock/main_clock_TimerTick.dart';

import 'package:alarm_app/screens/mainScreen_Widgets/clock_body_widgets/hourSlider.dart';
import 'package:alarm_app/screens/mainScreen_Widgets/clock_body_widgets/minuteSlider.dart';
import 'package:alarm_app/screens/mainScreen_Widgets/clock_body_widgets/secondSlider.dart';
import 'package:flutter/material.dart';

import '../../../themeData.dart';
import '../clock_face.dart';
import 'resetButton.dart';

ClockFace cFace = ClockFace();

String mainText = "00:00:00";

class ClockFaceText extends StatefulWidget {
  @override
  ClockFaceTextState createState() => ClockFaceTextState();
}

class ClockFaceTextState extends State<ClockFaceText> {
  StreamSubscription<String> secSub,
      minSub,
      hourSub,
      timerSub,
      resetUpdateSub,
      loadFavSub;

  void updateText() {
    setState(() {
      mainText = timText.setTimerText();
    });
  }

  void dispose() {
    super.dispose();
    loadFavSub.cancel();
    resetUpdateSub.cancel();
    timerSub.cancel();
    secSub.cancel();
    minSub.cancel();
    hourSub.cancel();
  }

  @override
  void initState() {
    super.initState();
    loadFavSub = subStreamString(favUpdateFaceCon, mainText);
    resetUpdateSub = subStreamString(resetUpdateCon, mainText);
    timerSub = subStreamString(timerCon, mainText);
    secSub = subStreamString(secCon, mainText);
    minSub = subStreamString(minCon, mainText);
    hourSub = subStreamString(hourCon, mainText);
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      mainText,
      overflow: TextOverflow.clip,
      style: defaultTheme.textTheme.headline,
    );
  }

  StreamSubscription subStreamString(
      StreamController<String> controller, var value) {
    controller.stream.listen((value) {
      updateText();
    });
    return null;
  }
}
