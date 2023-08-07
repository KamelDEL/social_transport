import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Colors.black,
    primary: Colors.grey[900]!,
    secondary: Colors.pink[400]!,
  ),
  drawerTheme: DrawerThemeData(backgroundColor: Colors.grey[900]!),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey[900]!
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.grey[900]!,
  ),
);