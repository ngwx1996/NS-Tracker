import 'package:flutter/material.dart';

const kBottomContainerHeight = 80.0;
const kActiveCardColor = Color(0xFF1D1E33);
const kInactiveCardColor = Color(0xFF1D1E33);
//const kInactiveCardColor = Colors.white;
const kBottomCardColor = Color(0xFFEB1555);

const kLargeButtonTextStyle = TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.bold,
);

const kLabelTextStyle = TextStyle(
  fontSize: 18.0,
  color: Colors.white70,
  //color: Color(0xFF8D8E98),
);

const kNumberTextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.w900,
  color: Colors.white,
);

const rankNamesSAF = [
  'PFC',
  'LCP',
  'CPL',
  'CFC',
  '3SG',
  '2SG',
  '1SG',
  'SSG',
  'MSG',
  '3WO',
  '2WO',
  '1WO',
  'MWO',
  'SWO',
  'CWO',
  '2LT',
  'LTA',
  'CPT',
  'MAJ',
  'LTC',
  'SLTC',
  'COL',
  'BG | RADM(1)',
  'MG | RADM(2)',
  'LG | VADM',
  'ME1',
  'ME2',
  'ME3',
  'ME4',
  'ME5',
  'ME6',
  'ME7',
  'ME8',
];

const rankNamesSPF = [
  'SCCPL | CPL',
  'SGT1',
  'SGT2 | SGT3',
  'SSSGT',
  'SI',
  'NSPI | NSI',
  'INSP',
  'ASP',
  'DSP',
  'SUPT',
  "DAC",
  'AC',
  'SAC',
  'DCP',
  'CP',
];

const rankNamesSCDF = [
  'REC | PTE',
  'LCP',
  'CPL',
  'SGT',
  'WO1',
  'WO2',
  '2LT | LTA',
  'CPT',
  'MAJ',
  'LTC',
  'COL',
  'AC',
  'SAC',
  'DC',
  'COMR',
];

Map<String, List<String>> whichForceName = {
  'SAF': rankNamesSAF,
  'SPF': rankNamesSPF,
  'SCDF': rankNamesSCDF,
};
