import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'constants.dart';

class RankDisplay extends StatelessWidget {
  RankDisplay(
      {@required this.whichForce,
      @required this.index,
      @required this.insigniaColor});

  final String whichForce;
  final int index;
  final Color insigniaColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: ReusableCard(
            onPress: () {},
            clickColor: kInactiveCardColor,
            cardChild: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image(
                    height: 100,
                    color: insigniaColor,
                    image: AssetImage(
                        "assets/$whichForce/$whichForce${(index * 2 + index + 1).toString()}.png"),
                  ),
                  SizedBox(height: 20),
                  Text(
                    whichForceName[whichForce][index * 2 + index],
                    style: kLabelTextStyle,
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: ReusableCard(
            onPress: () {},
            clickColor: kInactiveCardColor,
            cardChild: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image(
                    height: 100,
                    color: insigniaColor,
                    image: AssetImage(
                        "assets/$whichForce/$whichForce${(index * 2 + index + 2).toString()}.png"),
                  ),
                  SizedBox(height: 20),
                  Text(
                    whichForceName[whichForce][index * 2 + index + 1],
                    style: kLabelTextStyle,
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: ReusableCard(
            onPress: () {},
            clickColor: kInactiveCardColor,
            cardChild: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image(
                    height: 100,
                    color: insigniaColor,
                    image: AssetImage(
                        "assets/$whichForce/$whichForce${(index * 2 + index + 3).toString()}.png"),
                  ),
                  SizedBox(height: 20),
                  Text(
                    whichForceName[whichForce][index * 2 + index + 2],
                    style: kLabelTextStyle,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
