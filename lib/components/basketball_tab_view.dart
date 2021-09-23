import 'package:flutter/material.dart';

class BasketballTabView extends StatefulWidget {
  @override
  State<BasketballTabView> createState() => _BasketballTabViewState();
}

class _BasketballTabViewState extends State<BasketballTabView> {
  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.sports_basketball_rounded,
      size: 150,
      color: Colors.black,
    );
  }
}
