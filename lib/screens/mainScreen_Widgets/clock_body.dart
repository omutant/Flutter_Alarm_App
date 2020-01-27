import 'dart:async';

import 'package:alarm_app/modules/main_clock/main_clock_ClockButtons.dart';
import 'package:alarm_app/screens/mainScreen_Widgets/clock_body_widgets/hourSlider.dart';
import 'package:alarm_app/screens/mainScreen_Widgets/clock_body_widgets/minuteSlider.dart';
import 'package:alarm_app/screens/mainScreen_Widgets/clock_face.dart';
import 'package:alarm_app/screens/mainScreen_Widgets/clock_face_widgets/clockFaceText.dart';
import 'clock_face_widgets/pausePlayButton.dart';
import 'package:flutter/material.dart';

import 'clock_body_widgets/secondSlider.dart';

StreamSubscription<String> bodSub, playUpdateSub, favUpdateBodySub;
ClockFace cFace = ClockFace();

class ClockBody extends StatefulWidget {
  @override
  ClockBodyState createState() => ClockBodyState();
}

class ClockBodyState extends State<ClockBody> {
  void dispose() {
    favUpdateBodySub.cancel();
    playUpdateSub.cancel();
    bodSub.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    favUpdateBodySub = subStreamString(favUpdateBodyCon, mainText);
    playUpdateSub = subStreamString(playUpdateCon, mainText);
    bodSub = subStreamString(bodCon, mainText);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TimerSlider(HTimer()),
          SizedBox(
            width: 25,
          ),
          TimerSlider(MTimer()),
          SizedBox(
            width: 25,
          ),
          TimerSlider(STimer()),
        ],
      ),
    );
  }

  StreamSubscription subStreamString(
      StreamController<String> controller, var value) {
    controller.stream.listen((value) {
      setState(() {});
    });
    return null;
  }
}

class TimerSlider extends StatelessWidget {
  TimerSlider(this.child);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 50,
      child: RotatedBox(quarterTurns: 1, child: child),
    );
  }
}
