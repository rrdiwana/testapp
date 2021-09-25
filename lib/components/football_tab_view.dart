import 'package:flutter/material.dart';

class FootballTabView extends StatefulWidget {
  @override
  State<FootballTabView> createState() => _FootballTabViewState();
}

class _FootballTabViewState extends State<FootballTabView> {
  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.sports_soccer_rounded,
      size: 150,
      color: Colors.black,
    );
  }
}
