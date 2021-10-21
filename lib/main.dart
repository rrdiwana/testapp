import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/widgets/theme.dart';
import 'scoreman.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyTheme>(
      create: (context) => MyTheme(),
      child: Consumer<MyTheme>(
        builder: (context, theme, __) {
          return MaterialApp(
            themeMode: theme.getThemeMode(),
            theme: theme.getlightTheme(),
            darkTheme: theme.getDarkTheme(),
            home: ScoreMan(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
