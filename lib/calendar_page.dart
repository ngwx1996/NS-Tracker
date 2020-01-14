import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:ns_tracker/constants.dart';
import 'save_read_data.dart';
import 'package:intl/intl.dart';

//TODO add public holidays

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  int selectedShift;
  DateTime shiftStartDate;
  DateTime ordDate;
  DateTime popDate;

  @override
  void initState() {
    getPreference().then(loadSettings);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (selectedShift == null) {
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
        title: Text('Calendar'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            child: CalendarCarousel<EventInterface>(
              onDayPressed: (DateTime date, List<EventInterface> events) {},
              weekendTextStyle: TextStyle(
                color: Colors.red,
              ),
              thisMonthDayBorderColor: Colors.grey,
              weekdayTextStyle: TextStyle(
                color: Colors.white,
              ),
              daysTextStyle: TextStyle(color: Colors.white),
              todayButtonColor: Colors.cyan,
              todayBorderColor: Colors.cyan,
              customDayBuilder: (
                bool isSelectable,
                int index,
                bool isSelectedDay,
                bool isToday,
                bool isPrevMonthDay,
                TextStyle textStyle,
                bool isNextMonthDay,
                bool isThisMonthDay,
                DateTime day,
              ) {
                // Shift Dates Icon
                if (day == ordDate) {
                  return Center(
                    child: Icon(MaterialCommunityIcons.cake_variant),
                  );
                } else if (day == popDate) {
                  return Center(
                    child: Icon(MaterialCommunityIcons.medal),
                  );
                } else if ((selectedShift == 3) &&
                    (day.difference(shiftStartDate).inDays % selectedShift) ==
                        0 &&
                    (day.difference(ordDate).inDays < 0) &&
                    (day.difference(shiftStartDate).inDays >= 0)) {
                  return Center(
                    child: Icon(MaterialIcons.work),
                  );
                } else if (selectedShift == 8 &&
                    (day.difference(shiftStartDate).inDays % selectedShift) <
                        2 &&
                    (day.difference(ordDate).inDays < 0) &&
                    (day.difference(shiftStartDate).inDays >= 0)) {
                  return Center(
                    child: Icon(Ionicons.md_sunny),
                  );
                } else if (selectedShift == 8 &&
                    ((day.difference(shiftStartDate).inDays % selectedShift) ==
                            4 ||
                        (day.difference(shiftStartDate).inDays %
                                selectedShift) ==
                            5) &&
                    (day.difference(ordDate).inDays < 0) &&
                    (day.difference(shiftStartDate).inDays >= 0)) {
                  return Center(
                    child: Icon(Ionicons.md_moon),
                  );
                } else {
                  return null;
                }
              },
              weekFormat: false,
              markedDatesMap: null,
              height: 400.0,
              selectedDateTime: null,
              daysHaveCircularBorder: null,
              maxSelectedDate: DateTime(ordDate.year, 12, 31),
            ),
          ),
        ],
      ),
    );
  }

  void loadSettings(List retrieved) {
    setState(() {
      DateFormat dateFormat = DateFormat("yyyy-MM-dd");
      this.selectedShift = retrieved[2];
      String formatordDate = retrieved[4];
      this.ordDate = dateFormat.parse(formatordDate);
      String formatpopDate = retrieved[5];
      this.popDate = dateFormat.parse(formatpopDate);
      String formatShiftStartDate = retrieved[6];
      this.shiftStartDate = dateFormat.parse(formatShiftStartDate);
    });
  }
}
