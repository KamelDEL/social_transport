import 'package:flutter/material.dart';
import 'package:social_transport/components/text_field.dart';

class AddTransfer extends StatelessWidget {
  const AddTransfer({super.key});

  @override
  Widget build(BuildContext context) {
    final description = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add new transfer"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),

            MyTextField(
              controller: description, 
              hintText: "describe your transfer", 
              obscureText: false
            ),
          ],
        ),
      ),
    );
  }
}