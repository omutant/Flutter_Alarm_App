//Comments last updated: 29-01-2020
import 'package:alarm_app/screens/mainScreen_Widgets/clock_body.dart';
import 'package:alarm_app/screens/mainScreen_Widgets/clock_face.dart';
import 'package:alarm_app/screens/mainScreen_Widgets/topBar.dart';
import 'package:alarm_app/themeData.dart';
import 'package:flutter/material.dart';

import 'mainScreen_Widgets/drawer.dart';

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
      drawer: Drawer(
        child: OptionsDrawer(),
      ),
      body: Column(
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Container(
            height: 160,
            child: ClockFace(),
          ),
          ClockBody(),
        ],
      ),
    );
  }
}
