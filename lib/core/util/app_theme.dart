
import 'package:clean_architecture/core/util/color_resources.dart';
import 'package:flutter/material.dart';


final appTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    backgroundColor: ColorResources.PRIMARY_COLOR,
    centerTitle: true
  ),
  brightness: Brightness.light,
  primaryColor: ColorResources.PRIMARY_COLOR,
  colorScheme: const ColorScheme.light(
    primary: ColorResources.PRIMARY_COLOR
  ),
  progressIndicatorTheme: const ProgressIndicatorThemeData(color: ColorResources.PRIMARY_COLOR),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: ColorResources.PRIMARY_COLOR,
    foregroundColor: ColorResources.SECONDARY_COLOR
  ),
  inputDecorationTheme: InputDecorationTheme(
    floatingLabelStyle: const TextStyle(color: ColorResources.PRIMARY_COLOR),
    iconColor: ColorResources.SECONDARY_COLOR,
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: ColorResources.SECONDARY_COLOR),
      borderRadius: BorderRadius.circular(8)
    ),
    border: OutlineInputBorder(
        borderSide: const BorderSide(color: ColorResources.SECONDARY_COLOR),
        borderRadius: BorderRadius.circular(8)
    ),
  )
);