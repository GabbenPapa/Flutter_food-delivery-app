import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  colorScheme: ColorScheme.dark(
    onSurface: const Color.fromARGB(255, 20, 20, 20),
    secondary: const Color.fromARGB(255, 122, 122, 122),
    primary: const Color.fromARGB(255, 30, 30, 30),
    tertiary: const Color.fromARGB(255, 47, 47, 47),
    inversePrimary: Colors.grey.shade300,
    inverseSurface: Colors.white,
  ),
);
