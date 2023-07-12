// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:social_transport/pages/login.dart';

import 'package:social_transport/pages/register.dart';

class LogOrReg extends StatefulWidget {
  const LogOrReg({super.key});

  @override
  State<LogOrReg> createState() => _LogOrRegState();
}

class _LogOrRegState extends State<LogOrReg> {
  bool showLogInPage = true;

  void togglePages() {
    setState(() {
      showLogInPage = !showLogInPage;
    });
  }
  @override
  Widget build(BuildContext context) {
    if (showLogInPage)
      return Login( onTap: togglePages);
    return Register( onTap: togglePages);
  }
}