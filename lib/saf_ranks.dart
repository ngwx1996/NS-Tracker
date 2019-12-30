import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'icon_content.dart';
import 'package:flutter_icons/flutter_icons.dart';

class SAFRanks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
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
                  onPress: () {},
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
      ],
    );
  }
}
