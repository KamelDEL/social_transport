import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: Column(
        children: [
        const SizedBox(height: 10,),
          TextField(
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              enabledBorder: const  OutlineInputBorder(
                borderSide: BorderSide(),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(),
              ),
              fillColor: Colors.grey[400]!,
              hintText: hintText,
              hintStyle: TextStyle(
                color:Colors.grey[400]!,
              )
            ),
          ),
          const SizedBox(height: 10,),
        ],
      ),
    );
  }
}