import 'package:flutter/material.dart';

class CricketTabView extends StatefulWidget {
  @override
  State<CricketTabView> createState() => _CricketTabViewState();
}

class _CricketTabViewState extends State<CricketTabView> {
  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.sports_cricket_rounded,
      size: 150,
      color: Colors.black,
    );
  }
}
