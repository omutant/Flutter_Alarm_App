//Comments last updated: 29-01-2020
import 'package:alarm_app/icons/typicons_omu_alarm_icons.dart';
import 'package:alarm_app/themeData.dart';
import 'package:flutter/material.dart';

import '../clock_face.dart';

List<String> favoritesData = [
  "00:15:30",
];

class FavoritesShelf extends StatefulWidget {
  @override
  FavoritesShelfState createState() => FavoritesShelfState();
}

class FavoritesShelfState extends State<FavoritesShelf> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: ListView(
        padding: EdgeInsets.all(10.0),
        // List of elements based on String List
        children: favoritesData
            .map((data) => ListTile(
                  trailing: IconButton(
                    color: Colors.white,
                    icon: Icon(TypiconsOmuAlarm.minus_outline),
                    onPressed: () => setState(() =>
                        cButt.deleteFavorite(favoritesData.indexOf(data))),
                  ),
                  title: Text(
                    data,
                    style: defaultTheme.textTheme.body1,
                  ),
                  onTap: () => setState(() => cButt.setMainToFavorite(data)),
                ))
            .toList(),
      ),
    );
  }
}
