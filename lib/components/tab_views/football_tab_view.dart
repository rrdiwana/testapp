import 'package:flutter/material.dart';
import 'package:testapp/components/cards/football_card.dart';

class FootballTabView extends StatefulWidget {
  @override
  State<FootballTabView> createState() => _FootballTabViewState();
}

class _FootballTabViewState extends State<FootballTabView> {
  @override
  Widget build(BuildContext context) {
    return FootballCard();
  }
}
