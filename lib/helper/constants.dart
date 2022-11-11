import 'package:flutter/material.dart';

class Diseases{
  static int diabetes=0;
  static int hypertension=0;
  static int obesity=0;
  static int cancer=0;
  static int cholesterol=0;
  static int calcification=0;
  static int herniatedDisc=0;
  static int ulcer=0;
  static int heartDisease=0;
  static int lungDisease=0;
}


class CustomDecorations{
  static List<BoxShadow> buttonShadowList = const [
    BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.05),
      offset: Offset(0, 3),
      blurRadius: 8,
      spreadRadius: -1,
    ),
    BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.24),
      offset: Offset(0, 0),
      blurRadius: 1,
      spreadRadius: 0,
    ),
  ];
  static BorderRadiusGeometry borderRadiusGeometry = BorderRadius.circular(10);
  static Radius radius =  const Radius.circular(10);
}

class CustomColors{
  static Color accentColor = const Color.fromRGBO(218, 41, 28, 1);
  static Color primaryColor = const Color.fromRGBO(38, 38, 38, 1);
  static Color scaffoldBackGroundColor = const Color.fromRGBO(19, 19, 19, 1);
  static Color primaryTextColor = const Color.fromRGBO(255, 255, 255, 1);
  static Color passiveTextColor = const Color.fromRGBO(94, 102, 118, 1);
  static Color generalColor = const Color.fromRGBO(208, 208, 208, 1);
}