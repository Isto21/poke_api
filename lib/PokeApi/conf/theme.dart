import 'package:flutter/material.dart';

class ThemeApp {
  ThemeData theme() {
    return ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green,
        primaryTextTheme: const TextTheme(
            bodyLarge: TextStyle(
              fontSize: 40,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            bodyMedium: TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.bold),
                bodySmall: TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.bold)));
  }
}
