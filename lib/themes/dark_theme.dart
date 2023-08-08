import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Colors.grey[900]!,
    primary: Colors.grey[800]!,
    secondary: Colors.pink[500]!,
  ),
  drawerTheme: DrawerThemeData(backgroundColor: Colors.grey[900]!),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey[900]!
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.grey[900]!,
  ),
);