import 'package:flutter/material.dart';

// Use this Utility function for whenever you want to show any snackbar
// [message] - this is optional, snackbar will have this message
void showSnackbar(context, [String message = 'To be configured']) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    duration: Duration(milliseconds: 400),
  ));
}

//use this function to change header colors for Dark and Normal Mode.
Color headerColor(context) {
  final ThemeData theme = Theme.of(context);
  return theme.brightness == Brightness.dark ? Colors.black : Colors.blue;
}

//change icon and icon color based to themeMode
Icon iconColorChange(
    context, IconData icon1, Color color1, IconData icon2, Color color2) {
  final ThemeData theme = Theme.of(context);
  return theme.brightness == Brightness.dark
      ? Icon(icon1, color: color1)
      : Icon(icon2, color: color2);
}
