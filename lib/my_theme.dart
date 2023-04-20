import 'package:flutter/material.dart';

class MyTheme {
  static Color lightPrimary = Color(0xFFB7935F);
  static Color colorBlack = Color(0xFF242424);
  static Color colorWhite = Color(0xFFFFFFFF);

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
      subtitle1: TextStyle(
          fontSize: 25, fontWeight: FontWeight.w300, color: colorBlack),
      subtitle2: TextStyle(
          fontSize: 20, fontWeight: FontWeight.normal, color: colorBlack),
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
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme:
          AppBarTheme(backgroundColor: Colors.transparent, elevation: 0),
      textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: colorWhite)));
}
