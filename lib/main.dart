import 'package:flutter/material.dart';
import 'package:ns_tracker/ippt_calculator.dart';
import 'package:ns_tracker/ranks_commands_page.dart';
import 'main_page.dart';
import 'ippt_calculator.dart';
import 'package:ns_tracker/calendar_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF02040A),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MainPage(),
        '/ippt': (context) => IPPT(),
        '/calendar': (context) => Calendar(),
        '/rankcmd': (context) => RanksCommands(),
      },
    );
  }
}
