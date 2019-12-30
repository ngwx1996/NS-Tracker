import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;

//TODO add public holidays

var _startDate = DateTime(2019, 12, 1);
var _ordDate = DateTime(2020, 1, 14);
var _currentDate;

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.0),
        child: CalendarCarousel<EventInterface>(
          onDayPressed: (DateTime date, List<EventInterface> events) {
            this.setState(() => _currentDate = date);
          },
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
            /// you can provide your own build function to make custom day containers
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
            /// If you return null, [CalendarCarousel] will build container for current [day] with default function.
            /// This way you can build custom containers for specific days only, leaving rest as default.
            ///
            // Shift Dates Icon
            if ((day.difference(_startDate).inDays % 3) == 0 &&
                (day.difference(_ordDate).inDays < 0) &&
                (day.difference(_startDate).inDays >= 0)) {
              return Center(
                child: Icon(MaterialIcons.work),
              );
            } else if (day == _ordDate) {
              return Center(
                child: Icon(MaterialCommunityIcons.cake_variant),
              );
            } else {
              return null;
            }
          },
          weekFormat: false,
          markedDatesMap: null,
          height: 420.0,
          selectedDateTime: _currentDate,
          daysHaveCircularBorder: null,

          /// null for not rendering any border, true for circular border, false for rectangular border
        ),
      ),
    );
  }
}
