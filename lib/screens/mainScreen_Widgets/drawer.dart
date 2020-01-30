//Comments last updated: 29-01-2020
import 'package:alarm_app/screens/mainScreen_Widgets/drawer_widgets/favorites_Shelf.dart';
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
        Column(children: <Widget>[
          shelf("Favorites",FavoritesShelf()),
          //FavoritesShelf(),
        ],)
      ],
    );
  }
}

Widget shelf(String shelfName, Widget content){
  return Column(
    children: <Widget>[
      Text('$shelfName'),
        Divider(
          height: 3,
          thickness: 3,
          color: Colors.blue,
        ),
        content,
        Divider(
          height: 3,
          thickness: 3,
          color: Colors.blue,
        ),
    ],
  );
}
