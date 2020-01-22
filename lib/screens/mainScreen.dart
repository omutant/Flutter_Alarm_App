import 'package:alarm_app/screens/mainScreen_Widgets/clock_body.dart';
import 'package:alarm_app/screens/mainScreen_Widgets/clock_face.dart';
import 'package:alarm_app/screens/mainScreen_Widgets/topBar.dart';
import 'package:alarm_app/themeData.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultTheme.backgroundColor,
      appBar: topBar(context),
      body: Column(
        children: <Widget>[
          SizedBox(height: 50,),
          Container(
            height: 160,
          child:ClockFace(),
          ),
          ClockBody(),
        ],
      ),
    );
  }
}
