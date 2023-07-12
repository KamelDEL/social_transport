import 'package:flutter/material.dart';
// import 'package:social_transport/pages/login.dart';
// import 'package:social_transport/pages/register.dart';
import 'auth/log_or_reg.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const LogOrReg(),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
    );
  }
}