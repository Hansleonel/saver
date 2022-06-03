import 'package:flutter/material.dart';
import 'package:saver/constants.dart';
import 'package:saver/theme/button_theme.dart';
import 'package:saver/theme/checkbox_theme.dart';
import 'package:saver/theme/elements_theme.dart';
import 'package:saver/theme/input_decoration_theme.dart';

ThemeData lightTheme(BuildContext context) {
  return ThemeData(
    brightness: Brightness.light,
    fontFamily: "Plus Jakarta",
    primarySwatch: primaryMaterialColor,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.white,
    iconTheme: const IconThemeData(color: blackColor),
    textTheme: const TextTheme(bodyText2: TextStyle(color: blackColor40)),
    elevatedButtonTheme: elevatedButtonThemeData,
    outlinedButtonTheme: outlinedButtonTheme(),
    textButtonTheme: textButtonThemeData,
    inputDecorationTheme: lightInputDecorationTheme,
    checkboxTheme:
        checkboxThemeData.copyWith(side: const BorderSide(color: blackColor40)),
    appBarTheme: appBarLightTheme,
    scrollbarTheme: scrollbarThemeData,
    dataTableTheme: dataTableLightThemeData,
  );
}
