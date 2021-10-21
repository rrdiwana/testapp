import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'scoreman.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChange>(
      create: (context) => ThemeChange(),
      child: Consumer<ThemeChange>(
        builder: (context, themeMode, __) {
          return MaterialApp(
            themeMode: themeMode.getMode(),
            theme: ThemeData(
                primarySwatch: Colors.blue, brightness: Brightness.light),
            darkTheme: ThemeData(brightness: Brightness.dark),
            home: ScoreMan(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}

class ThemeChange extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  ThemeMode getMode() => _themeMode;
  void clickEvent(dark) {
    _themeMode = dark ? ThemeMode.dark : ThemeMode.light;
    print(dark);
    notifyListeners();
  }
}
