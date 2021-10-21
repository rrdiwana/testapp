import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/components/tab_views/basketball_tab_view.dart';
import 'package:testapp/components/tab_views/football_tab_view.dart';
import 'package:testapp/components/tab_views/hockey_tab_view.dart';
import 'package:testapp/main.dart';
import 'package:testapp/utils/common_utility.dart';
import 'package:testapp/utils/constants.dart';
import 'package:testapp/components/tab_views/cricket_tab_view.dart';
import 'package:testapp/widgets/drawer.dart';

// ignore: must_be_immutable
class ScoreMan extends StatefulWidget {
  @override
  State<ScoreMan> createState() => _ScoreManHomePage();
}

class _ScoreManHomePage extends State<ScoreMan>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  late TabController _tabController;
  String title = cricketTabName;
  static bool dark = false;

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
    final object = Provider.of<ThemeChange>(context);
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        drawer: MyDrawer(),
        body: CustomScrollView(
          primary: true,
          slivers: <Widget>[
            SliverAppBar(
              centerTitle: true,
              title: Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      setState(() => dark = !dark);
                      object.clickEvent(dark);
                      showSnackbar(context, dark ? "Dark Mode" : "Light Mode");
                    },
                    icon: Icon(dark ? lightBulb : darkBulb))
              ],
              floating: true,
              pinned: true,
              bottom: TabBar(
                controller: _tabController,
                indicator: BoxDecoration(
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
                  BasketballTabView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
