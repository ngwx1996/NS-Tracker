import 'package:flutter/material.dart';
import 'package:ns_tracker/constants.dart';

class SettingsBox extends StatelessWidget {
  SettingsBox({this.cardChild, this.cardText});

  final Widget cardChild;
  final String cardText;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              width: 100,
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: cardText,
                  style: kLabelSettingTextStyle,
                ),
              ),
              decoration: BoxDecoration(
                  color: Color(0xFF1E1E1E),
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
          Flexible(
            flex: 4,
            child: Container(
              width: 1000,
              alignment: Alignment.center,
              child: cardChild,
            ),
          ),
        ],
      ),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Color(0xFF222222),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black38.withAlpha(90),
              blurRadius: 5.0,
            ),
          ]),
    );
  }
}
