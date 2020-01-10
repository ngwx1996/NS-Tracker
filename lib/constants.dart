import 'package:flutter/material.dart';

const kBottomContainerHeight = 80.0;
const kInactiveCardColor = Color(0xFF1E1E1E);
const kBottomCardColor = Color(0xFFEB1555);

const kLargeButtonTextStyle = TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.bold,
);

const kLabelTextStyle = TextStyle(
  fontSize: 18.0,
  color: Colors.white54,
);

const kNumberTextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.w900,
  color: Colors.white,
);

const kNumberSettingTextStyle = TextStyle(
  fontSize: 22.0,
  fontWeight: FontWeight.normal,
  color: Colors.white,
);

const kLabelSettingTextStyle = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
  color: Colors.white,
  //color: Color(0xFF8D8E98),
);

const kCommandTextStyle = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.normal,
  color: Colors.white,
  //color: Color(0xFF8D8E98),
);

const kCommandTitleTextStyle = TextStyle(
  fontSize: 22.0,
  fontWeight: FontWeight.bold,
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

const malayCommands = [
  'STATIONARY DRILL COMMANDS',
  'SKUAD',
  'BARIS',
  'SEDIA',
  'SENANG DIRI',
  'KELUAR BARIS',
  'BESURAI',
  'SEMULA',
  'DIAM',
  'KE KANAN LU RUS',
  'PANDANG KE HADAPAN PANDANG',
  'PANDANG KE KANAN/KIRI PANDANG',
  'DARI KANAN BILANG',
  'MASUK BARIS',
  'MARCHING DRILL COMMANDS',
  'KE KANAN/KIRI/BELAKANG PU SING',
  'BEGERAK KE KIRI/KANAN BERTIGA TIGA',
  'AKAN MEHADAP KE HADAPAN/BELAKANG',
  'DARI KIRI/KANAN',
  'CEPAT JALAN',
  'BERHENTI',
  'HENTAK KAKI CEPAT HENTAK',
  'MAJU',
  'CEPAT LA RI',
  'HORMAT',
];

const englishCommand = [
  '',
  'Squad',
  'Baris',
  'Come to attention',
  'At ease',
  'Fall out',
  'Dismiss',
  'Again',
  'Quiet',
  'Take dressing from the right',
  'Face the front',
  'Face the right/left',
  'Number off from the right',
  'Get on parade',
  '',
  'Turn to the right/left/back',
  'March to the left/right in threes',
  'Face the front/back',
  'Take dressing from left/right',
  'Walk',
  'Stop',
  'March on the spot',
  'March forward',
  'Run',
  'Salute',
];
