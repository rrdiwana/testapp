import 'package:flutter/material.dart';
import 'package:testapp/components/basketball_tab_view.dart';
import 'package:testapp/components/cricket_tab_view.dart';
import 'package:testapp/components/football_tab_view.dart';
import 'package:testapp/components/hockey_tab_view.dart';
import 'package:testapp/utils/common_utility.dart';
import 'package:testapp/utils/constants.dart';

class ScoreMan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScoreManHomePage(),
    );
  }
}

// ignore: must_be_immutable
class ScoreManHomePage extends StatefulWidget {
  @override
  State<ScoreManHomePage> createState() => _ScoreManHomePageSate();
}

class _ScoreManHomePageSate extends State<ScoreManHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String title = cricketTabName;

  @override
  void initState() {
    _tabController = TabController(length: tabs.length, vsync: this);
    super.initState();
    _tabController.addListener(() {
      setState(() {
        title = tabNames[_tabController.index].toString();
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: CustomScrollView(
          primary: true,
          slivers: <Widget>[
            SliverAppBar(
              // backgroundColor: Color(0xff00363a),
              backgroundColor: Colors.black,
              centerTitle: true,
              title: Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: IconButton(
                  onPressed: () {
                    showSnackbar(context);
                  },
                  icon: Icon(Icons.menu_rounded)),
              actions: <Widget>[
                IconButton(
                  onPressed: () {
                    showSnackbar(context, 'Profile, to be configured');
                  },
                  icon: Icon(Icons.account_circle_rounded),
                ),
                PopupMenuButton(
                  onSelected: select,
                  itemBuilder: (BuildContext context) {
                    return {
                      'Settings',
                      'Info',
                    }.map((String choice) {
                      return PopupMenuItem(
                        value: choice,
                        child: Text(choice),
                      );
                    }).toList();
                  },
                ),
              ],
              floating: true,
              pinned: true,
              // snap: true,
              bottom: TabBar(
                controller: _tabController,
                // isScrollable: false,
                indicator: BoxDecoration(
                  // borderRadius: BorderRadius.circular(10),
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                tabs: tabs,
              ),
            ),
            // ...rest of body...
            SliverFillRemaining(
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  CricketTabView(),
                  FootballTabView(),
                  HockeyTabView(),
                  BasketballTabView()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
