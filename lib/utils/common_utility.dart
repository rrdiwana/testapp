import 'package:flutter/material.dart';

// Use this Utility function for whenever you want to show any snackbar
// [message] - this is optional, snackbar will have this message
void showSnackbar(context, [String message = 'To be configured']) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    duration: Duration(milliseconds: 400),
  ));
}

// Delete this after implementing the menu button funcitonality
void select(value) {
  switch (value) {
    case 'Home':
      break;
    case 'Order':
      break;
  }
  print(value);
}
