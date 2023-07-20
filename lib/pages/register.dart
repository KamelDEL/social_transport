import 'package:flutter/material.dart';

import '../components/button.dart';
import '../components/text_field.dart';
import 'home.dart';

class Register extends StatefulWidget {
  final Function()? onTap;
  const Register( {
    super.key,
    required this.onTap,
  });

  @override
  State<Register> createState() => _RegisterState();
}

// ignore: camel_case_types
class _RegisterState extends State<Register> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  void onTaping(){
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const Home(),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  const Icon(
                    Icons.lock,
                    size: 100,
                  ),
                  const SizedBox(height: 25),
                  const Text(
                    "Welcome back to the app!",
                  ),
                  const SizedBox(height: 25),
                  MyTextField(
                    controller: emailTextController,
                    obscureText: false,
                    hintText: "Email",
                  ),
                  const SizedBox(height: 25),
                  MyTextField(
                    controller: passwordTextController,
                    obscureText: true,
                    hintText: "password",
                  ),
                  const SizedBox(height: 25),
                  MyTextField(
                    controller: passwordTextController,
                    obscureText: true,
                    hintText: "password",
                  ),
                  const SizedBox(height: 25),
                  MyButton(onTap: onTaping, text: "SignIn"),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already a member? "),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: const Text(
                          "LogIn now",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
