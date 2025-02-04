import 'package:creartify/theme/colors.dart';
import 'package:creartify/theme/units.dart';
import 'package:flutter/material.dart';



class ThemeApp {
  static final AppColor _colors = AppColors();

  static ThemeData light = ThemeData(
    textTheme: textTheme,
    scaffoldBackgroundColor: _colors.primaryBackground,
    floatingActionButtonTheme: _floatingActionButtonTheme(),
    bottomAppBarTheme: _bottomAppBarTheme(),
  );

  static TextTheme textTheme = TextTheme(
    titleSmall: TextStyle(fontFamily: 'TTNorms', fontSize: 19, color: globalColors.inactiveDark),
    labelSmall: TextStyle(fontFamily: 'TTNorms', fontSize: 17, color: globalColors.inactiveLight),
    labelMedium: TextStyle(fontFamily: 'TTNorms', fontSize: 21, color: globalColors.textBlack, fontWeight: FontWeight.bold),
  );

  static FloatingActionButtonThemeData _floatingActionButtonTheme() {
    return  FloatingActionButtonThemeData(
      shape: CircleBorder(),
      focusElevation: 500,
      backgroundColor: _colors.activeDark,
      foregroundColor: _colors.primaryForeground,
    );
  }

  static BottomAppBarTheme _bottomAppBarTheme() {
    return BottomAppBarTheme(
      color: _colors.primaryForeground,
      elevation: 12.0,
      shape: CircularNotchedRectangle(),
      height: kBottomAppBarHeight,
    );
  }

  static LinearGradient gradientColors(Color firstColor, Color secondColor) {
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: <Color>[firstColor, secondColor],
    );
  }
}