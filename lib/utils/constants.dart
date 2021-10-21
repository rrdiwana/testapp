import 'package:flutter/material.dart';

/// Different immutable Strings fields to be defined here
final String appName = 'SCOREMAN';
final String cricketTabName = 'CRICKET';
final String footballTabName = 'FOOTBALL';
final String hockeyTabName = 'HOCKEY';
final String basketBallTabName = 'BASKET BALL';

// Diffrent immutable lists
final List<Widget> tabs = <Widget>[
  Tab(icon: cricketTabIcon),
  Tab(icon: footballTabIcon),
  Tab(icon: hockeyTabIcon),
  Tab(icon: basketballTabIcon),
];

final Map<int, String> tabNames = {
  0: cricketTabName,
  1: footballTabName,
  2: hockeyTabName,
  3: basketBallTabName,
};

/// Different immutable icons/images feilds to be defined here
final Icon cricketTabIcon = Icon(Icons.sports_cricket_rounded);
final Icon footballTabIcon = Icon(Icons.sports_soccer_rounded);
final Icon hockeyTabIcon = Icon(Icons.sports_hockey_rounded);
final Icon basketballTabIcon = Icon(Icons.sports_basketball_rounded);

final IconData lightBulb = IconData(0xf01e, fontFamily: 'MaterialIcons');
final IconData darkBulb = IconData(0xf70b, fontFamily: 'MaterialIcons');
