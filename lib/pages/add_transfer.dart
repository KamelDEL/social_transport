import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:social_transport/components/button.dart';
import 'package:social_transport/components/my_snack_bar.dart';
import 'package:social_transport/components/text_field.dart';
import 'package:social_transport/pages/home.dart';

class AddTransfer extends StatelessWidget {
  const AddTransfer({super.key});

  @override
  Widget build(BuildContext context) {
    final description = TextEditingController();
    final from = TextEditingController();
    final to = TextEditingController();
    final weight = TextEditingController();
    final expectation = TextEditingController();
    
    void postTransfer() {
      try {
        FirebaseFirestore.instance.collection("Transfers").add({
          'Email' : FirebaseAuth.instance.currentUser?.email,
          'Description' : description.text,
          'From': from.text,
          'To' : to.text,
          'Weight' : "${weight.text}Kg",
          'Price' : "${expectation.text}DA",
          'TimeStamp': Timestamp.now(),
        });
      } on FirebaseException catch (e) {
        SnackBar(content: MySnackBar(e: e.code));
      }
      description.text = "";
      from.text = "";
      to.text = "";
      weight.text = "";
      expectation.text = "";
      
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Home()),
      );
      
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add new transfer"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
        
                MyTextField(
                  controller: description,
                  hintText: "describe your transfer",
                  obscureText: false,
                ),
        
                MyTextField(
                  controller: from,
                  hintText: "From",
                  obscureText: false,
                ),
                
                MyTextField(
                  controller: to,
                  hintText: "To",
                  obscureText: false,
                ),
        
                MyTextField(
                  controller: weight, 
                  hintText: "How many KG", 
                  obscureText: false,
                ),
        
                MyTextField(
                  controller: expectation, 
                  hintText: "How much money is your expectations", 
                  obscureText: false,
                ),
                
                const Text("Add a picture"),
                const SizedBox(height: 10,),
                DottedBorder(
                  color: Colors.white,
                  strokeWidth: 3,
                  dashPattern: const [20,20],
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      child: SizedBox(
                        height: 200,
                        child: Container(
                          color: Colors.black45,
                          child: const Center(
                            child: Icon(
                              Icons.add,
                              size: 50,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                
                const SizedBox(
                  height: 10,
                ),
                
                MyButton(
                  onTap: postTransfer, 
                  text: "Add Transfer",
                ),

                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ).animate().fade(),
    );
  }
}