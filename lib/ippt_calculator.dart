import 'package:flutter/material.dart';
import 'package:ns_tracker/reusable_card.dart';
import 'constants.dart';
import 'ippt_brain.dart';

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
                Text(
                  pushups.toString(),
                  style: kNumberTextStyle,
                ),
                Text(
                  'PUSH UPS',
                  style: kLabelTextStyle,
                ),
                Slider(
                  value: pushups.toDouble(),
                  min: 0,
                  max: 60,
                  onChanged: (double newValue) {
                    setState(() {
                      pushups = newValue.round();
                    });
                  },
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
                Text(
                  situps.toString(),
                  style: kNumberTextStyle,
                ),
                Text(
                  'SIT UPS',
                  style: kLabelTextStyle,
                ),
                Slider(
                  value: situps.toDouble(),
                  min: 0,
                  max: 60,
                  onChanged: (double newValue) {
                    setState(() {
                      situps = newValue.round();
                    });
                  },
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
                Text(
                  (run ~/ 60).toString() + ':' + leadZero(run),
                  style: kNumberTextStyle,
                ),
                Text(
                  '2.4 KM RUN',
                  style: kLabelTextStyle,
                ),
                Slider(
                  value: run.toDouble(),
                  min: 510,
                  max: 1100,
                  onChanged: (double newValue) {
                    setState(() {
                      run = newValue.round();
                    });
                  },
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
                Text(
                  'SCORE',
                  style: kLabelTextStyle,
                ),
                Text(
                  calculateScore(pushups, situps, run).toString(),
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
  return ((calculate.staticPoints(pushups)).isNegative ||
          (calculate.staticPoints(situps)).isNegative)
      ? 0
      : (calculate.staticPoints(pushups) + calculate.staticPoints(situps)) +
          calculate.runningPoints();
}

String leadZero(int time) {
  String seconds = (time % 60).toString();
  return seconds.padLeft(2, '0');
}
