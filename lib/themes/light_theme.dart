import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Colors.grey[100]!,
    primary: Colors.grey[300]!,
    secondary: Colors.pink[800]!,
  ),
  drawerTheme: const DrawerThemeData(
    backgroundColor: Colors.white
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey[100]!,
    iconTheme: const IconThemeData(
      color: Colors.black
    )  
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.grey[100]!,
  ),
);
