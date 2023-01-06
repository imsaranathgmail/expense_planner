import 'package:flutter/material.dart';

class AppColor {
  //Drawer and scaffold
  static const gradientColor01 = Color(0xFF7F2650);
  static const gradientColor02 = Color(0xFF3B3A4C);
  static const appBarIconThemeColor = Colors.amber;
  static final drawerBGColor = Colors.amber.shade50;
  static const drawerHeadderColor = Colors.black;
  static const drawerTextColor = Colors.black;
  static const buttonColor = Color(0xFF267F55);

  //Dashboard
  static const textColor = Colors.white;
}

class AppFontSize {
  //drawer and scaffold
  static const double f25 = 35.0;

  //Dashboard
  static const double f15 = 15.0;
  static const double f10 = 10.0;
}

class AppSizes {
  static double appBarHeight = AppBar().preferredSize.height * 1.8;
}

class AppGloable {
  static String selectedDate =
      '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}';
}

const List<String> yearList = [
  'Year',
  '2022',
  '2023',
  '2024',
  '2026',
  '2027',
  '2028',
  '2029',
  '2030',
];
const List<String> monthList = [
  'Month',
  'Jan',
  'Feb',
  'Mar',
  'Apr',
  'May',
  'Jun',
  'Jul',
  'Aug',
  'Sep',
  'Oct',
  'Nov',
  'Dec'
];
