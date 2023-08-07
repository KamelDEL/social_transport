import 'package:flutter/material.dart';
import 'package:social_transport/components/text_field.dart';

class ContactTextingField extends StatelessWidget {
  const ContactTextingField({super.key});

  @override
  Widget build(BuildContext context) {
    final msgController = TextEditingController();
    return Row(children: [
      MyTextField(controller: msgController, hintText: "message", obscureText: false),
      const Icon(Icons.send)
    ],);
  }
}