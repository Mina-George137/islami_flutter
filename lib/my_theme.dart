import 'package:flutter/material.dart';

class MyTheme {
  static Color lightPrimary = Color(0xFFB7935F);
  static Color colorBlack = Color(0xFF242424);
  static Color colorWhite = Color(0xFFFFFFFF);
  static Color darkPrimary = Color(0xFFFACC1D);
  static Color bottomNavDarkColor = Color(0xFF141A2E);

  static ThemeData lightTheme = ThemeData(
    primaryColor: lightPrimary,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: colorBlack)),
    textTheme: TextTheme(
      headline1: TextStyle(
          fontSize: 30, fontWeight: FontWeight.bold, color: colorBlack),
      headline2: TextStyle(
          fontSize: 25, fontWeight: FontWeight.w400, color: colorBlack),
      headline3: TextStyle(
          fontSize: 25, fontWeight: FontWeight.w400, color: lightPrimary),
      subtitle1: TextStyle(
          fontSize: 25, fontWeight: FontWeight.w300, color: colorBlack),
      subtitle2: TextStyle(
          fontSize: 20, fontWeight: FontWeight.normal, color: colorBlack),
      headline4: TextStyle(
          fontSize: 25, fontWeight: FontWeight.bold, color: colorWhite),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: lightPrimary,
      selectedItemColor: colorBlack,
      unselectedItemColor: colorWhite,
      showSelectedLabels: true,
      showUnselectedLabels: true,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: darkPrimary,
    primaryColorDark: bottomNavDarkColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: colorWhite)),
    textTheme: TextTheme(
      headline1: TextStyle(
          fontSize: 30, fontWeight: FontWeight.bold, color: colorWhite),
      headline2: TextStyle(
          fontSize: 25, fontWeight: FontWeight.w400, color: colorWhite),
      headline3: TextStyle(
          fontSize: 25, fontWeight: FontWeight.w400, color: darkPrimary),
      subtitle1: TextStyle(
          fontSize: 25, fontWeight: FontWeight.w300, color: colorWhite),
      subtitle2: TextStyle(
          fontSize: 20, fontWeight: FontWeight.normal, color: darkPrimary),
      headline4: TextStyle(
          fontSize: 25, fontWeight: FontWeight.bold, color: colorBlack),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF141A2E),
      selectedItemColor: darkPrimary,
      unselectedItemColor: colorWhite,
      showSelectedLabels: true,
      showUnselectedLabels: true,
    ),
  );
}
