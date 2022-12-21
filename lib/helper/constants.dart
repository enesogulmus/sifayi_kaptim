import 'package:flutter/material.dart';

class Diseases {
  static int diabetes = 0;
  static int hypertension = 0;
  static int obesity = 0;
  static int cancer = 0;
  static int cholesterol = 0;
  static int calcification = 0;
  static int herniatedDisc = 0;
  static int ulcer = 0;
  static int heartDisease = 0;
  static int lungDisease = 0;
  static const double diabetesTotal = 9;
  static const double hypertensionTotal = 17;
  static const double cancerTotal = 18;
  static const double cholesterolTotal = 13;
  static const double calcificationTotal = 21;
  static const double herniatedDiscTotal = 16;
  static const double ulcerTotal = 13;
  static const double heartDiseaseTotal = 27;
  static const double lungDiseaseTotal = 16;
}

class CustomDecorations {
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
  static Radius radius = const Radius.circular(10);
}

class CustomColors {
  static Color accentColor = const Color.fromRGBO(121, 201, 188, 1);
  static Color primaryColor = const Color.fromRGBO(255, 255, 255, 1);
  static Color scaffoldBackGroundColor = const Color.fromRGBO(243, 248, 247, 1);
  static Color primaryTextColor = const Color.fromRGBO(109, 110, 113, 1);
  static Color passiveTextColor = const Color.fromRGBO(214, 219, 222, 1);
  static Color generalColor = const Color.fromRGBO(208, 208, 208, 1);
}
