import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:ns_tracker/icon_content.dart';
import 'constants.dart';

class SettingButton extends StatelessWidget {
  SettingButton({@required this.onTap});

  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.white70,
        child: Align(
          alignment: Alignment.centerRight,
          child: Icon(
            MaterialCommunityIcons.settings,
            size: 40,
          ),
        ),
        //margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.only(right: 30, bottom: 5),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}
