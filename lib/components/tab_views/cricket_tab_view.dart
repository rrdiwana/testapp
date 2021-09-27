import 'package:flutter/material.dart';
import 'package:testapp/components/cards/cricket_card.dart';

class CricketTabView extends StatefulWidget {
  @override
  State<CricketTabView> createState() => _CricketTabViewState();
}

class _CricketTabViewState extends State<CricketTabView> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return CricketCard();
  }

  @override
  bool get wantKeepAlive => true;
}
