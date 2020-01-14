import 'package:flutter/material.dart';
import 'package:ns_tracker/ippt_calculator.dart';
import 'package:ns_tracker/ranks_commands_page.dart';
import 'main_page.dart';
import 'ippt_calculator.dart';
import 'package:ns_tracker/calendar_page.dart';
import 'package:flutter/services.dart';
import 'package:ns_tracker/settings.dart';
import 'todo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF1F1F1F),
        scaffoldBackgroundColor: Color(0xFF121212),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MainPage(),
        '/ippt': (context) => IPPT(),
        '/calendar': (context) => Calendar(),
        '/rankcmd': (context) => RanksCommands(),
        '/settings': (context) => Settings(),
        '/todo': (context) => Todo(),
      },
    );
  }
}
