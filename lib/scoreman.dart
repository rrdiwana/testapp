import 'package:flutter/material.dart';
import 'package:testapp/utils/common_utility.dart';
import 'package:testapp/utils/constants.dart';

class ScoreMan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const ScoreManHomePage(
        title: 'SCOREMAN',
      ),
    );
  }
}

class ScoreManHomePage extends StatefulWidget {
  const ScoreManHomePage({required this.title});
  final String title;

  @override
  State<ScoreManHomePage> createState() => _ScoreManHomePageSate();
}

class _ScoreManHomePageSate extends State<ScoreManHomePage> with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
      print("Selected Index: " + _tabController.index.toString());
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
        backgroundColor: Colors.transparent,
        body: CustomScrollView(
          primary: true,
          slivers: <Widget>[
            SliverAppBar(
              // backgroundColor: Color(0xff00363a),
              backgroundColor: Colors.transparent,
              centerTitle: true,
              title: Text(
                widget.title,
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
                  Icon(
                    Icons.sports_cricket_rounded,
                    size: 350,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.sports_soccer_rounded,
                    size: 350,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.sports_hockey_rounded,
                    size: 350,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.sports_basketball_rounded,
                    size: 350,
                    color: Colors.white,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
