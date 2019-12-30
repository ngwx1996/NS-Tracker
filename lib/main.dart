import 'package:flutter/material.dart';
import 'package:ns_tracker/ippt_calculator.dart';
import 'main_page.dart';
import 'constants.dart';
import 'ippt_calculator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MainPage(),
        '/ippt': (context) => IPPT(),
      },
    );
  }
}
