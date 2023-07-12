import 'package:flutter/material.dart';
import 'package:social_transport/components/button.dart';
import 'package:social_transport/components/text_field.dart';


class Login extends StatefulWidget {
  final Function()? onTap;
  const Login({
    super.key,
    required this.onTap,
  });

  @override
  State<Login> createState() => _LoginState();
}

// ignore: camel_case_types
class _LoginState extends State<Login> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
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
      
                    MyButton(onTap: (){}, text: "SignIn"),
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Not a member? "),
                        const SizedBox(width: 5),
                        GestureDetector(
                          onTap: widget.onTap,
                          child: const Text(
                            "Register now",
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