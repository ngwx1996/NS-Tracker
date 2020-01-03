import 'package:flutter/material.dart';
import 'package:ns_tracker/reusable_card.dart';
import 'constants.dart';
import 'ippt_brain1.dart';

class IPPT extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('IPPT Calculator'),
      ),
      body: _IPPTState(),
    );
  }
}

class _IPPTState extends StatefulWidget {
  @override
  __IPPTStateState createState() => __IPPTStateState();
}

class __IPPTStateState extends State<_IPPTState> {
  int pushups = 30;
  int situps = 30;
  int run = 1100;
  IPPTBrain calculate = IPPTBrain(
    pushup: 30,
    situp: 30,
    run: 1100,
    age: 22,
    gender: 0,
  );
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: ReusableCard(
            onPress: () {},
            clickColor: kInactiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
//                Text(toNextPoint(pushups, situps, run, pushups, 'push-up')
//                        .toString() +
//                    ' reps to next point'),
                Text(
                  pushups.toString(),
                  style: kNumberTextStyle,
                ),
                Text(
                  'PUSH UPS',
                  style: kLabelTextStyle,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Slider(
                        activeColor: Colors.greenAccent,
                        value: pushups.toDouble(),
                        min: 1,
                        max: 60,
                        onChanged: (double newValue) {
                          setState(() {
                            pushups = newValue.round();
                          });
                        },
                      ),
                    ),
                    Text(
                      calculateStatic(
                              pushups, situps, run, pushups, 'push-up') +
                          "    ",
                      style: kLabelTextStyle,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: ReusableCard(
            onPress: () {},
            clickColor: kInactiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
//                Text(toNextPoint(pushups, situps, run, situps, 'sit-up')
//                        .toString() +
//                    'reps to next point'),
                Text(
                  situps.toString(),
                  style: kNumberTextStyle,
                ),
                Text(
                  'SIT UPS',
                  style: kLabelTextStyle,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Slider(
                        activeColor: Colors.greenAccent,
                        value: situps.toDouble(),
                        min: 1,
                        max: 60,
                        onChanged: (double newValue) {
                          setState(() {
                            situps = newValue.round();
                          });
                        },
                      ),
                    ),
                    Text(
                      calculateStatic(pushups, situps, run, situps, 'sit-up') +
                          "    ",
                      style: kLabelTextStyle,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: ReusableCard(
            onPress: () {},
            clickColor: kInactiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
//                Text('secs to next point'),
                Text(
                  (run ~/ 60).toString() + ':' + leadZero(run),
                  style: kNumberTextStyle,
                ),
                Text(
                  '2.4 KM RUN',
                  style: kLabelTextStyle,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Slider(
                        activeColor: Colors.greenAccent,
                        value: run.toDouble(),
                        divisions: 59,
                        min: 510,
                        max: 1100,
                        onChanged: (double newValue) {
                          setState(() {
                            run = newValue.round();
                          });
                        },
                      ),
                    ),
                    Text(
                      calculateStatic(pushups, situps, run, run, 'run') +
                          "    ",
                      style: kLabelTextStyle,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: ReusableCard(
            onPress: () {},
            clickColor: kInactiveCardColor,
            cardChild: Column(
//              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'PUSH UP SCORE: ' +
                      calculateStatic(pushups, situps, run, pushups, 'push-up'),
                  style: kLabelTextStyle,
                ),
                Text(
                  'SIT UP SCORE: ' +
                      calculateStatic(pushups, situps, run, situps, 'sit-up'),
                  style: kLabelTextStyle,
                ),
                Text(
                  '2.4 KM RUN SCORE: ' +
                      calculateStatic(pushups, situps, run, run, 'run'),
                  style: kLabelTextStyle,
                ),
                Text(
                  'TOTAL SCORE: ' +
                      calculateScore(pushups, situps, run).toString(),
                  style: kLabelTextStyle,
                ),
                Text(
                  'AWARD: ' +
                      calculate.getAward(calculateScore(pushups, situps, run)),
                  style: kLabelTextStyle,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

int calculateScore(int pushups, int situps, int runs) {
  IPPTBrain calculate = IPPTBrain(
    pushup: pushups,
    situp: situps,
    run: runs,
    age: 22,
    gender: 0,
  );
  return calculate.getOverallScore();
}

String calculateStatic(int pushups, int situps, int runs, repsOrTiming, type) {
  IPPTBrain calculate = IPPTBrain(
    pushup: pushups,
    situp: situps,
    run: runs,
    age: 22,
    gender: 0,
  );
  return calculate.getScore(repsOrTiming, type);
}

//int toNextPoint(int pushups, int situps, int runs, repsOrTiming, type) {
//  IPPTBrain calculate = IPPTBrain(
//    pushup: pushups,
//    situp: situps,
//    run: runs,
//    age: 22,
//    gender: 0,
//  );
//  return calculate.toNextPoint(repsOrTiming, type);
//}

// adds a leading zero for single digit numbers
String leadZero(int time) {
  String seconds = (time % 60).toString();
  return seconds.padLeft(2, '0');
}
