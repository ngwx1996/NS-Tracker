import 'package:flutter/material.dart';
import 'package:ns_tracker/reusable_card.dart';
import 'constants.dart';
import 'ippt_brain1.dart';
import 'save_read_data.dart';

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
  int currentAge;
  IPPTBrain calculate;
//  IPPTBrain calculate = IPPTBrain(
//    pushup: 30,
//    situp: 30,
//    run: 1100,
//    age: 22,
//    gender: 0,
//  );

  @override
  void initState() {
    getAge().then(loadSettings);
    calculate = IPPTBrain(
      pushup: 30,
      situp: 30,
      run: 1100,
      age: currentAge,
      gender: 0,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (currentAge == null) {
      return Center(
        child: Icon(
          Icons.check_circle_outline,
          color: Colors.green,
          size: 60,
        ),
      );
    }
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
                Text(toNextPoint(pushups, situps, run, pushups, 'push-up',
                            currentAge)
                        .toString() +
                    ' reps to next point'),
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
                      calculateStatic(pushups, situps, run, pushups, 'push-up',
                              currentAge) +
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
                Text(toNextPoint(
                            pushups, situps, run, situps, 'sit-up', currentAge)
                        .toString() +
                    ' reps to next point'),
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
                      calculateStatic(pushups, situps, run, situps, 'sit-up',
                              currentAge) +
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
                      calculateStatic(
                              pushups, situps, run, run, 'run', currentAge) +
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
//                Text(
//                  'PUSH UP SCORE: ' +
//                      calculateStatic(pushups, situps, run, pushups, 'push-up'),
//                  style: kLabelTextStyle,
//                ),
//                Text(
//                  'SIT UP SCORE: ' +
//                      calculateStatic(pushups, situps, run, situps, 'sit-up'),
//                  style: kLabelTextStyle,
//                ),
//                Text(
//                  '2.4 KM RUN SCORE: ' +
//                      calculateStatic(pushups, situps, run, run, 'run'),
//                  style: kLabelTextStyle,
//                ),
                Text(
                  'TOTAL SCORE: ' +
                      calculateScore(pushups, situps, run, currentAge)
                          .toString(),
                  style: kLabelTextStyle,
                ),
                Text(
                  'AWARD: ' +
                      calculate.getAward(
                          calculateScore(pushups, situps, run, currentAge)),
                  style: kLabelTextStyle,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void loadSettings(int retrievedAge) {
    setState(() {
      this.currentAge = retrievedAge;
    });
  }
}

int calculateScore(int pushups, int situps, int runs, int currentAge) {
  IPPTBrain calculate = IPPTBrain(
    pushup: pushups,
    situp: situps,
    run: runs,
    age: currentAge,
    gender: 0,
  );
  return calculate.getOverallScore();
}

String calculateStatic(
    int pushups, int situps, int runs, repsOrTiming, type, int currentAge) {
  IPPTBrain calculate = IPPTBrain(
    pushup: pushups,
    situp: situps,
    run: runs,
    age: currentAge,
    gender: 0,
  );
  return calculate.getScore(repsOrTiming, type);
}

int toNextPoint(
    int pushups, int situps, int runs, repsOrTiming, type, int currentAge) {
  IPPTBrain calculate = IPPTBrain(
    pushup: pushups,
    situp: situps,
    run: runs,
    age: currentAge,
    gender: 0,
  );
  return calculate.toNextPoint(repsOrTiming, type);
}

// adds a leading zero for single digit numbers
String leadZero(int time) {
  String seconds = (time % 60).toString();
  return seconds.padLeft(2, '0');
}
