import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_transport/components/my_snack_bar.dart';

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
  final confirmPasswordTextController = TextEditingController();

  void errorMsg(text){
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          padding: const EdgeInsets.all(0),
          backgroundColor: Colors.transparent,
          content: MySnackBar(e: text),
        ));
  }

  Future<void> signUp() async {
    showDialog(context: context, builder: (context) =>  const Center(
      child: CircularProgressIndicator(),
    ));
    if(passwordTextController.text != confirmPasswordTextController.text){
      Navigator.pop(context);
      errorMsg("passwords do not match");
       return;
    }
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailTextController.text, password: passwordTextController.text);
      if(context.mounted){
        
        Navigator.pop(context);
      }
    } on FirebaseAuthException catch (e){
      Navigator.pop(context);
      errorMsg(e.code);
    }
  }

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
                  MyTextField(
                    controller: confirmPasswordTextController,
                    obscureText: true,
                    hintText: "confirm password",
                  ),
                  const SizedBox(height: 25),
                  MyButton(onTap: signUp, text: "SignUp"),
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
