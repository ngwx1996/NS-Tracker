import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:ns_tracker/constants.dart';
import 'package:ns_tracker/setting_button.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'package:flip_card/flip_card.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('NS Tracker'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // First Column (ORD)
          Expanded(
            child: ReusableCard(
              onPress: () {},
              clickColor: kInactiveCardColor,
              cardChild: FlipCard(
                front: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'DAYS TO ORD',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          '365',
                          style: kNumberTextStyle,
                        ),
                        Text(
                          'LEFT',
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: new LinearPercentIndicator(
                        width: MediaQuery.of(context).size.width - 50,
                        animation: true,
                        lineHeight: 20.0,
                        animationDuration: 2000,
                        percent: 0.5,
                        center: Text("50.0%"),
                        linearStrokeCap: LinearStrokeCap.roundAll,
                        progressColor: Colors.greenAccent,
                      ),
                    ),
                  ],
                ),
                back: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'DAYS TO POP',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          '83',
                          style: kNumberTextStyle,
                        ),
                        Text(
                          'LEFT',
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: new LinearPercentIndicator(
                        width: MediaQuery.of(context).size.width - 50,
                        animation: true,
                        lineHeight: 20.0,
                        animationDuration: 2000,
                        percent: 0.7,
                        center: Text("70.0%"),
                        linearStrokeCap: LinearStrokeCap.roundAll,
                        progressColor: Colors.greenAccent,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Second Column (Payday & IPPT)
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {},
                    clickColor: kInactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '29',
                          style: kNumberTextStyle,
                        ),
                        Text(
                          'DAYS TO PAYDAY',
                          style: kLabelTextStyle,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      Navigator.pushNamed(context, '/ippt');
                    },
                    clickColor: kInactiveCardColor,
                    cardChild: IconContent(
                      icon: MaterialCommunityIcons.run_fast,
                      label: 'IPPT',
                    ),
                  ),
                )
              ],
            ),
          ),
          // Third Column (Leaves & Offs & Calendar)
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {},
                    clickColor: kInactiveCardColor,
                    cardChild: Row(
                      children: <Widget>[
                        Expanded(
                          child: ReusableCard(
                            onPress: () {},
                            clickColor: kInactiveCardColor,
                            cardChild: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  '14',
                                  style: kNumberTextStyle,
                                ),
                                Text(
                                  'LEAVE',
                                  style: kLabelTextStyle,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          child: VerticalDivider(
                            color: Colors.white30,
                            thickness: 0.5,
                            width: 0.1,
                            indent: 10,
                            endIndent: 10,
                          ),
                        ),
                        Expanded(
                          child: ReusableCard(
                            onPress: () {},
                            clickColor: kInactiveCardColor,
                            cardChild: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  '10',
                                  style: kNumberTextStyle,
                                ),
                                Text(
                                  'OFF',
                                  style: kLabelTextStyle,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      Navigator.pushNamed(context, '/calendar');
                    },
                    clickColor: kInactiveCardColor,
                    cardChild: IconContent(
                      icon: MaterialCommunityIcons.calendar_month,
                      label: 'Calendar',
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Fourth Column (Commands & To-Do-List)
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      Navigator.pushNamed(context, '/rankcmd');
                    },
                    clickColor: kInactiveCardColor,
                    cardChild: IconContent(
                      icon: MaterialCommunityIcons.face_profile,
                      label: 'Ranks / Commands',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {},
                    clickColor: kInactiveCardColor,
                    cardChild: IconContent(
                      icon: MaterialCommunityIcons.format_list_bulleted,
                      label: 'To-Do List',
                    ),
                  ),
                )
              ],
            ),
          ),
          // Settings Button
//          Container(
//            child: Row(
//              children: <Widget>[
//                Expanded(
//                  child: Container(),
//                ),
//                Container(
//                  child: SettingButton(),
//                  width: 100,
//                ),
//              ],
//            ),
//          ),
        ],
      ),
    );
  }
}
