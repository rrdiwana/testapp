import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testapp/utils/common_utility.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              decoration: BoxDecoration(color: headerColor(context)),
              child: Column(
                children: <Widget>[
                  Icon(
                    Icons.sports_basketball_rounded,
                    size: 100,
                    color: Colors.white,
                  ),
                  Text('SCOREMAN',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white))
                ],
              )),
          ListTile(
            title: const Text('Profile'),
            onTap: () {
              showSnackbar(context);
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Settings'),
            onTap: () {
              showSnackbar(context);
              Navigator.pop(context);
            },
          ),
          ListTile(
              title: const Text('Exit'),
              onTap: () {
                if (Platform.isAndroid) {
                  Future.delayed(const Duration(milliseconds: 1000), () {
                    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                  });
                }
                showSnackbar(context, "App Closing");
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
}
