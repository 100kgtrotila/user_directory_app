import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get light => ThemeData(
    colorSchemeSeed: Colors.deepPurple,
    useMaterial3: true,
    cardTheme: const CardThemeData(elevation: 4, margin: EdgeInsets.zero),
  );
}
