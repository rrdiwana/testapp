import 'package:flutter/material.dart';

class MyTheme extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  final ThemeData _lightTheme =
      ThemeData(primarySwatch: Colors.blue, brightness: Brightness.light);
  final ThemeData _darkTheme = ThemeData(brightness: Brightness.dark);
  ThemeMode getThemeMode() => _themeMode;
  ThemeData getlightTheme() => _lightTheme;
  ThemeData getDarkTheme() => _darkTheme;

  void changeTheme(bool dark) {
    _themeMode = dark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
