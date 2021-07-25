import 'package:flutter/material.dart';
// import 'package:rgb_project_onivart/constatnts.dart';

Color nightModeColor = Color(0XFF32373D);
Color scaffold_color = Color(0XFFF5FAFF);
Color textColor = Color(0XFF27405C);
Color navbarColor = Color(0XFFE6EEF8);
class Themes {
  final lightTheme = ThemeData.light().copyWith(
    primaryColor: scaffold_color,
    // iconTheme: IconThemeData(color: iconColor),
    scaffoldBackgroundColor: scaffold_color,
    appBarTheme: AppBarTheme(
      color: Colors.transparent,
    ),
    colorScheme: ColorScheme.light(
      secondary: navbarColor,
    ),
    textTheme: TextTheme(
      // Heading Text
      headline1: _lightScreenHeadingTextStyle,
      headline2: _lightScreenHeading2TextStyle,
      bodyText1: _lightScreenBodyTextStyle,
    ),
    buttonColor: nightModeColor,
  );
  final dartTheme = ThemeData.dark().copyWith(
    primaryColor: nightModeColor,
    scaffoldBackgroundColor: nightModeColor,
    appBarTheme: AppBarTheme(
      color: Colors.transparent,
    ),
    colorScheme: ColorScheme.dark(
      // secondary: Color(0XFF1C2127),
     secondary: Color(0XFF2B2F33), 
    ),
    textTheme: TextTheme(
      // Heading Text
      headline1: _darkScreenHeadingTextStyle,
      headline2: _darkScreenHeading2TextStyle,
      bodyText1: _darkScreenBodyTextStyle,
    ),
  );

  static final TextStyle _lightScreenHeadingTextStyle =
      TextStyle(color: textColor, fontSize: 24, fontFamily: "openSans");
  static final TextStyle _lightScreenHeading2TextStyle =
      TextStyle(color: textColor, fontSize: 20, fontFamily: "openSans",fontWeight: FontWeight.w300);
  static final TextStyle _lightScreenBodyTextStyle =
      TextStyle(color: textColor, fontSize: 14, fontFamily: "openSans",fontWeight: FontWeight.w300);

  static final TextStyle _darkScreenHeadingTextStyle =
      TextStyle(color: Colors.white, fontSize: 24, fontFamily: "openSans");
  static final TextStyle _darkScreenHeading2TextStyle =
      TextStyle(color: Colors.white, fontSize: 20, fontFamily: "openSans",fontWeight: FontWeight.w300);
  static final TextStyle _darkScreenBodyTextStyle =
      TextStyle(color: Colors.white, fontSize: 14, fontFamily: "openSans",fontWeight: FontWeight.w300);
}
