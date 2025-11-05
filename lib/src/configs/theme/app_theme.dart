import 'package:flutter/material.dart';
import 'package:clean_architecture_in_flutter/src/core/resources/app_fonts.dart';

class MaterialTheme {
  MaterialTheme._();
  static ThemeData get themData => ThemeData(
    fontFamily: FontConstants.fontFamily,
    useMaterial3: true,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black87,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
