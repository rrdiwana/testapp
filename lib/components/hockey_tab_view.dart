import 'package:flutter/material.dart';

class HockeyTabView extends StatefulWidget {
  @override
  State<HockeyTabView> createState() => _HockeyTabViewState();
}

class _HockeyTabViewState extends State<HockeyTabView> {
  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.sports_hockey_rounded,
      size: 150,
      color: Colors.black,
    );
  }
}
