import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_transport/components/button.dart';
import 'package:social_transport/components/my_snack_bar.dart';
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
  void signIn() async{
    showDialog(context: context, builder: (context) => const Center(
      child:CircularProgressIndicator(), 
    ));
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailTextController.text, 
        password: passwordTextController.text,
      );
      if(context.mounted){
        Navigator.pop(context);
      }
    } on FirebaseAuthException catch(e){
      
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          padding: const EdgeInsets.all(0),
          backgroundColor: Colors.transparent,
          content: MySnackBar(e: e.code,)
        )
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
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
      
                    MyButton(onTap: signIn, text: "SignIn"),
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