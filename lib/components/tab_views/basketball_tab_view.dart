import 'package:flutter/material.dart';
import 'package:testapp/components/cards/basketball_card.dart';

class BasketballTabView extends StatefulWidget {
  @override
  State<BasketballTabView> createState() => _BasketballTabViewState();
}

class _BasketballTabViewState extends State<BasketballTabView> {
  @override
  Widget build(BuildContext context) {
    return BasketballCard();
  }
}
