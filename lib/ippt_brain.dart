import 'package:flutter/material.dart';
import 'constants.dart';

class IPPTBrain {
  final int pushup;
  final int situp;
  final int run;
  final int age;
  final int gender;
  var staticPointArray = [
    1,
    2,
    3,
    4,
    5,
    6,
    6,
    7,
    7,
    8,
    9,
    10,
    11,
    12,
    13,
    13,
    14,
    14,
    15,
    16,
    17,
    18,
    18,
    19,
    19,
    20,
    20,
    20,
    20,
    21,
    21,
    21,
    21,
    21,
    22,
    22,
    22,
    22,
    23,
    23,
    23,
    23,
    24,
    24,
    24,
    25
  ];
  var staticRepArray = [
    15,
    14,
    14,
    13,
    13,
    13,
    12,
    12,
    12,
    11,
    11,
    11,
    10,
    10,
    10,
    9,
    9,
    9,
    8,
    8,
    8,
    7,
    7,
    7,
    6,
    6,
    6,
    5,
    5,
    5,
    4,
    4,
    4,
    3,
    3,
    3,
    2,
    2,
    2
  ];
  var runPointArray = [
    0,
    1,
    2,
    4,
    6,
    8,
    10,
    12,
    14,
    16,
    18,
    19,
    20,
    21,
    22,
    23,
    24,
    25,
    26,
    27,
    28,
    29,
    30,
    31,
    32,
    33,
    34,
    35,
    35,
    36,
    36,
    37,
    37,
    38,
    38,
    39,
    39,
    40,
    40,
    41,
    42,
    43,
    44,
    46,
    48,
    49,
    50
  ];
  var runTimeArray = [
    1610,
    1620,
    1620,
    1620,
    1630,
    1630,
    1630,
    1640,
    1640,
    1640,
    1650,
    1650,
    1650,
    1700,
    1700,
    1700,
    1710,
    1710,
    1710,
    1720,
    1720,
    1720,
    1730,
    1730,
    1730,
    1740,
    1740,
    1740,
    1750,
    1750,
    1750,
    1800,
    1800,
    1800,
    1810,
    1810,
    1810,
    1820,
    1820,
    1820
  ];
  IPPTBrain({
    this.pushup,
    this.situp,
    this.run,
    this.age,
    this.gender,
  });

  int staticPoints(count) {
    var idx = ((age - 22) < 0) ? 0 : (age - 22);
    var minReps = staticRepArray[idx];

    var pointsIdx = ((count - minReps) >= staticPointArray.length)
        ? staticPointArray.length - 1
        : (count - minReps);
    return count < minReps ? 0 : staticPointArray[pointsIdx];
  }

  int convertToSeconds(time) {
    var minutes = (time.toString()).substring(0, 2);
    var seconds = (time.toString()).substring(2);
    return int.tryParse(minutes) * 60 + int.tryParse(seconds);
  }

  int getRunningScoreIndex(age, timing) {
    var idx = (age - 22 < 0) ? 0 : (age - 22);
    var minSeconds = convertToSeconds(runTimeArray[idx]);
    var difference = ((minSeconds - timing) < 0) ? 0 : minSeconds - timing;
    var newIdx = difference * 0.1;
    if (newIdx >= runPointArray.length) {
      newIdx = runPointArray.length - 1;
    }
    return newIdx.floor();
  }

  int runningPoints() {
    var newIdx = getRunningScoreIndex(age, run);
    return (runPointArray[newIdx]).isFinite ? runPointArray[newIdx] : 0;
  }
}
