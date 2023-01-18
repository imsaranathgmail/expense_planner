// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  static const double fD18 = 18.0;
  static const double fD15 = 15.0;
  //Dashboard
  static const double f15 = 15.0;
  static const double f10 = 10.0;
}

class AppSizes {
  static double appBarHeight = AppBar().preferredSize.height * 1.8;
}

class AppGloable {
  static String selectedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
}
