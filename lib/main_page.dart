import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:ns_tracker/constants.dart';
import 'package:ns_tracker/save_read_data.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'package:flip_card/flip_card.dart';
import 'package:intl/intl.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  DateTime currentDate = DateTime.now();
  int payday;
  int daysToORD;
  int daysToPOP;
  double percentToORD;
  double percentToPOP;
  int daysToPayday;
  int leave;
  int off;

  @override
  void initState() {
    getPreference().then(loadSettings);
    getLeaveOff().then(loadLeaveOff);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (payday == null) {
      return Center(
        child: Icon(
          Icons.check_circle_outline,
          color: Colors.green,
          size: 60,
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('NS Tracker'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              MaterialCommunityIcons.settings,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
              Navigator.pushNamed(context, '/settings');
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
                          daysToORD <= 0 ? "ORD LO" : daysToORD.toString(),
                          style: kNumberTextStyle,
                        ),
                        Text(
                          daysToORD == 0 ? '' : 'LEFT',
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
                        percent: percentToORD,
                        center: Text(percentToORD.toStringAsPrecision(4)),
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
                          daysToPOP <= 0 ? "POP LO" : daysToPOP.toString(),
                          style: kNumberTextStyle,
                        ),
                        Text(
                          daysToPOP == 0 ? '' : 'LEFT',
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
                        percent: percentToPOP,
                        center: Text(percentToPOP.toStringAsPrecision(4)),
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
                          currentDate.day == payday
                              ? 0.toString()
                              : daysToPayday.toString(),
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                leave.toString(),
                                style: kNumberTextStyle,
                              ),
                              Text(
                                'LEAVE',
                                style: kLabelTextStyle,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          leave--;
                                          saveLeave(leave);
                                        });
                                      },
                                      child: Icon(
                                        Feather.minus,
                                        size: 25,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          leave++;
                                          saveLeave(leave);
                                        });
                                      },
                                      child: Icon(
                                        Feather.plus,
                                        size: 25,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                off.toString(),
                                style: kNumberTextStyle,
                              ),
                              Text(
                                'OFF',
                                style: kLabelTextStyle,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          off--;
                                          saveLeave(off);
                                        });
                                      },
                                      child: Icon(
                                        Feather.minus,
                                        size: 25,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          off++;
                                          saveLeave(off);
                                        });
                                      },
                                      child: Icon(
                                        Feather.plus,
                                        size: 25,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
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
                    onPress: () {
                      Navigator.pushNamed(context, '/todo');
                    },
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
          // Gap
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  void loadSettings(List retrieved) {
    setState(() {
      DateFormat dateFormat = DateFormat("yyyy-MM-dd");

      this.payday = retrieved[1];
      int serviceTerm = retrieved[3];
      DateTime ordDate = dateFormat.parse(retrieved[4]);
      DateTime popDate = dateFormat.parse(retrieved[5]);
      this.daysToORD = ordDate
          .difference(
              DateTime(currentDate.year, currentDate.month, currentDate.day))
          .inDays;
      this.daysToPOP = popDate
          .difference(
              DateTime(currentDate.year, currentDate.month, currentDate.day))
          .inDays;
      DateTime enlistDate =
          DateTime(ordDate.year, ordDate.month - serviceTerm, ordDate.day);
      this.percentToORD =
          1 - daysToORD / ordDate.difference(enlistDate).inDays ?? 0;
      if (this.percentToORD > 1) {
        percentToORD = 1;
      }
      this.percentToPOP =
          1 - daysToPOP / popDate.difference(enlistDate).inDays ?? 0;
      if (this.percentToPOP > 1) {
        percentToPOP = 1;
      }
      DateTime nextPayday;
      if (currentDate.day < payday) {
        nextPayday = DateTime(currentDate.year, currentDate.month, payday);
      } else {
        nextPayday = DateTime(currentDate.year, currentDate.month + 1, payday);
      }
      this.daysToPayday = nextPayday
              .difference(DateTime(
                  currentDate.year, currentDate.month, currentDate.day))
              .inDays ??
          0;
    });
  }

  void loadLeaveOff(List retrieved) {
    setState(() {
      this.leave = retrieved[0];
      this.off = retrieved[1];
    });
  }
}
