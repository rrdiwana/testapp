import 'package:flutter/material.dart';
import 'package:testapp/components/cards/hockey_card.dart';

class HockeyTabView extends StatefulWidget {
  @override
  State<HockeyTabView> createState() => _HockeyTabViewState();
}

class _HockeyTabViewState extends State<HockeyTabView> {
  @override
  Widget build(BuildContext context) {
    return HockeyCard();
  }
}
