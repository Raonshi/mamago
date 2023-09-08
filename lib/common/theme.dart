import 'package:flutter/material.dart';

// ThemeData lightTheme = ThemeData.light(useMaterial3: true);
ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: Colors.green.shade300,
    onPrimary: Colors.black,
    secondary: Colors.blue.shade300,
    onSecondary: Colors.black,
    error: Colors.red.shade300,
    onError: Colors.black,
    background: Colors.grey.shade200,
    onBackground: Colors.black,
    surface: Colors.white,
    onSurface: Colors.black,
  ),
);

// ThemeData darkTheme = ThemeData.dark(useMaterial3: true);
ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme(
    brightness: Brightness.dark,
    primary: Colors.green.shade800,
    onPrimary: Colors.white,
    secondary: Colors.blue.shade800,
    onSecondary: Colors.white,
    error: Colors.red.shade800,
    onError: Colors.white,
    background: Colors.grey.shade800,
    onBackground: Colors.white,
    surface: Colors.grey.shade900,
    onSurface: Colors.white,
  ),
);
