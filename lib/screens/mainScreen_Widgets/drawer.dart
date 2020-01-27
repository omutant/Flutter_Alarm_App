import 'package:alarm_app/screens/mainScreen_Widgets/drawer_widgets/favorites.dart';
import 'package:flutter/material.dart';

class OptionsDrawer extends StatefulWidget {
  @override
  OptionsDrawerState createState() => OptionsDrawerState();
}

class OptionsDrawerState extends State<OptionsDrawer> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        FavoritesShelf(),
      ],
    );
  }
}
