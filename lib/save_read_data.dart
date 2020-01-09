import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

Future<void> savePreference(int age, int payday, int serviceTerm, DateTime ord,
    DateTime pop, int selectedShift, DateTime shiftStart) async {
  DateFormat dateFormat = DateFormat("yyyy-MM-dd");
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt('age', age);
  prefs.setInt('payday', payday);
  prefs.setInt('serviceTerm', serviceTerm);
  prefs.setString('ordDate', dateFormat.format(ord));
  prefs.setString('popDate', dateFormat.format(pop));
  prefs.setInt('selectedShift', selectedShift);
  prefs.setString('shiftStartDate', dateFormat.format(shiftStart));
  return;
}

Future<List> getPreference() async {
  DateFormat dateFormat = DateFormat("yyyy-MM-dd");
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int age = prefs.getInt('age') ?? 21;
  int payday = prefs.getInt('payday') ?? 10;
  int selectedShift = prefs.getInt('selectedShift') ?? 0;
  int serviceTerm = prefs.getInt('serviceTerm') ?? 22;
  String ordDate =
      prefs.getString('ordDate') ?? dateFormat.format(DateTime.now());
  String popDate =
      prefs.getString('popDate') ?? dateFormat.format(DateTime.now());
  String shiftStartDate =
      prefs.getString('shiftStartDate') ?? dateFormat.format(DateTime.now());
  return [
    age,
    payday,
    selectedShift,
    serviceTerm,
    ordDate,
    popDate,
    shiftStartDate
  ];
}
