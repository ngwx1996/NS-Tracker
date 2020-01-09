import 'package:flutter/material.dart';
import 'package:ns_tracker/constants.dart';
import 'package:ns_tracker/settings_container.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'reusable_card.dart';
import 'save_read_data.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  int age;
  int payday;
  int selectedShift = 0;
  int serviceTerm = 22;
  DateTime ordDate;
  String formatordDate;
  DateTime popDate;
  String formatpopDate;
  DateTime shiftStartDate;
  String formatShiftStartDate;

  @override
  void initState() {
    getPreference().then(loadSettings);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (age == null) {
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
        title: Text('Settings'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Flexible(
            child: SettingsBox(
              cardText: 'Age',
              cardChild: NumberPicker.integer(
                initialValue: age,
                minValue: 18,
                maxValue: 60,
                onChanged: (newVal) => setState(() => age = newVal),
                itemExtent: 35,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ),
          Flexible(
            child: SettingsBox(
              cardText: 'Payday',
              cardChild: NumberPicker.integer(
                initialValue: payday,
                minValue: 8,
                maxValue: 12,
                onChanged: (newVal) => setState(() => payday = newVal),
                itemExtent: 35,
                step: 2,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ),
          Flexible(
            child: SettingsBox(
              cardText: 'Enlist Date',
              cardChild: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        serviceTerm = 22;
                      });
                    },
                    child: Text(
                      '22 Months',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: serviceTerm == 22
                            ? Colors.tealAccent
                            : Colors.white,
                      ),
                    ),
                  ),
                  VerticalDivider(
                    color: Colors.white30,
                    thickness: 0.5,
                    width: 0.1,
                    indent: 10,
                    endIndent: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        serviceTerm = 24;
                      });
                    },
                    child: Text(
                      '24 Months',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: serviceTerm == 24
                            ? Colors.tealAccent
                            : Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            child: SettingsBox(
              cardText: 'ORD Date',
              cardChild: FlatButton(
                onPressed: () {
                  DatePicker.showDatePicker(context,
                      showTitleActions: true,
                      minTime: DateTime(2017, 1, 1),
                      maxTime: DateTime(2049, 12, 31),
                      theme: popupTheme(),
                      onChanged: (date) {}, onConfirm: (date) {
                    setState(() {
                      ordDate = date;
                      formatordDate = DateFormat('yyy-MM-dd').format(ordDate);
                    });
                  }, currentTime: ordDate);
                },
                child: Text(
                  formatordDate,
                  style: kNumberSettingTextStyle,
                ),
              ),
            ),
          ),
          Flexible(
            child: SettingsBox(
              cardText: 'POP Date',
              cardChild: FlatButton(
                onPressed: () {
                  DatePicker.showDatePicker(context,
                      showTitleActions: true,
                      minTime: DateTime(2017, 1, 1),
                      maxTime: DateTime(2049, 12, 31),
                      theme: popupTheme(),
                      onChanged: (date) {}, onConfirm: (date) {
                    setState(() {
                      popDate = date;
                      formatpopDate = DateFormat('yyy-MM-dd').format(popDate);
                    });
                  }, currentTime: popDate);
                },
                child: Text(
                  formatpopDate,
                  style: kNumberSettingTextStyle,
                ),
              ),
            ),
          ),
          Flexible(
            child: SettingsBox(
              cardText: 'Shift System',
              cardChild: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedShift = 0;
                      });
                    },
                    child: Text(
                      'N/A',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: selectedShift == 0
                            ? Colors.tealAccent
                            : Colors.white,
                      ),
                    ),
                  ),
                  VerticalDivider(
                    color: Colors.white30,
                    thickness: 0.5,
                    width: 0.1,
                    indent: 10,
                    endIndent: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedShift = 3;
                      });
                    },
                    child: Text(
                      '1 Day 2 Off',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: selectedShift == 3
                            ? Colors.tealAccent
                            : Colors.white,
                      ),
                    ),
                  ),
                  VerticalDivider(
                    color: Colors.white30,
                    thickness: 0.5,
                    width: 0.1,
                    indent: 10,
                    endIndent: 10,
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedShift = 4;
                        });
                      },
                      child: Text(
                        '2 Day 2 Off',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: selectedShift == 4
                              ? Colors.tealAccent
                              : Colors.white,
                        ),
                      )),
                ],
              ),
            ),
          ),
          Flexible(
            child: SettingsBox(
              cardText: 'Shift Start Date',
              cardChild: FlatButton(
                onPressed: () {
                  DatePicker.showDatePicker(context,
                      showTitleActions: true,
                      minTime: DateTime(2017, 1, 1),
                      maxTime: DateTime(2049, 12, 31),
                      theme: popupTheme(),
                      onChanged: (date) {}, onConfirm: (date) {
                    print('confirm $date');
                    setState(() {
                      shiftStartDate = date;
                      formatShiftStartDate =
                          DateFormat('yyy-MM-dd').format(shiftStartDate);
                    });
                  }, currentTime: shiftStartDate);
                },
                child: Text(
                  formatShiftStartDate,
                  style: kNumberSettingTextStyle,
                ),
              ),
            ),
          ),
          Container(
            height: 60,
            child: ReusableCard(
              onPress: () {
                savePreference(age, payday, serviceTerm, ordDate, popDate,
                    selectedShift, shiftStartDate);
                Navigator.pushNamed(context, '/');
              },
              clickColor: Colors.red,
              cardChild: Center(
                child: Text(
                  'SAVE',
                  style: kLabelSettingTextStyle,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  DatePickerTheme popupTheme() {
    return DatePickerTheme(
      backgroundColor: Color(0xFF222222),
      itemStyle: TextStyle(color: Colors.white, fontSize: 18),
      cancelStyle: TextStyle(color: Colors.redAccent, fontSize: 16),
    );
  }

  void loadSettings(List retrieved) {
    setState(() {
      DateFormat dateFormat = DateFormat("yyyy-MM-dd");
      this.age = retrieved[0];
      this.payday = retrieved[1];
      this.selectedShift = retrieved[2];
      this.serviceTerm = retrieved[3];
      this.formatordDate = retrieved[4];
      this.ordDate = dateFormat.parse(formatordDate);
      this.formatpopDate = retrieved[5];
      this.popDate = dateFormat.parse(formatpopDate);
      this.formatShiftStartDate = retrieved[6];
      this.shiftStartDate = dateFormat.parse(formatShiftStartDate);
    });
  }
}
