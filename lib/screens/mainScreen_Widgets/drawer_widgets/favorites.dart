import 'package:alarm_app/icons/typicons_omu_alarm_icons.dart';
import 'package:alarm_app/themeData.dart';
import 'package:flutter/material.dart';

import '../clock_face.dart';

ClockFace cFace = ClockFace();

List<String> favoritesData = [
  "00:00:00",
];

class FavoritesShelf extends StatefulWidget {
  @override
  FavoritesShelfState createState() => FavoritesShelfState();
}

class FavoritesShelfState extends State<FavoritesShelf> {
  Widget favorite(BuildContext context) {
    return Container(
      height: 30.0,
      color: Colors.blue,
      child: Text("00:00:00"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text("Favorites"),
        Divider(
          height: 3,
          thickness: 3,
          color: Colors.blue,
        ),
        Container(
          height: 250,
          child: ListView(
            padding: EdgeInsets.all(10.0),
            children: favoritesData
                .map((data) => ListTile(
                      trailing: IconButton(
                        color: Colors.white,
                        icon: Icon(TypiconsOmuAlarm.minus_outline),
                        onPressed: () {
                          setState(() {
                            cFace.cButt
                                .deleteFavorite(favoritesData.indexOf(data));
                            print("Delete favorite pressed");
                          });
                        },
                      ),
                      title: Text(
                        data,
                        style: defaultTheme.textTheme.body1,
                      ),
                      onTap: () {
                        setState(() {
                          cFace.cButt.setMainToFavorite(data);
                          print(data.toString());
                        });
                      },
                    ))
                .toList(),
          ),
        ),
        Divider(
          height: 3,
          thickness: 3,
          color: Colors.blue,
        ),
        Text("Favorites"),
        Divider(
          height: 3,
          thickness: 3,
          color: Colors.blue,
        ),
        SizedBox(
          height: 50,
        ),
        Divider(
          height: 3,
          thickness: 3,
          color: Colors.blue,
        ),
      ],
    );

    /*
    Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        IconButton(
            color: Colors.white,
            icon: Icon(OmuAlarmIcons.play),
            onPressed: () {
              print("Add to favorites Pressed");
            },
          ),
          favorite(context),
          favorite(context),
          favorite(context),
          favorite(context),
          favorite(context),
          favorite(context),
      ],
      */
    /*
      margin: EdgeInsets.symmetric(vertical: 20.0),
      height: 150,
      width: 70,
      child: ListView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(0),
        children: <Widget>[
          IconButton(
            color: Colors.white,
            icon: Icon(OmuAlarmIcons.play),
            onPressed: () {
              print("Add to favorites Pressed");
            },
          ),
          favorite(context),
          favorite(context),
          favorite(context),
          favorite(context),
          favorite(context),
          favorite(context),
        ],
      ),
    );
    );
    */
  }
}
