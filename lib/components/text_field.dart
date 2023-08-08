import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final VoidCallback? function;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    this.function
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: Column(
        children: [
        const SizedBox(height: 5,),
          TextField(
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              border: const UnderlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              enabledBorder: const  OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.secondary
                ),
              ),
              fillColor: Colors.grey[500]!,
              hintText: hintText,
              hintStyle: TextStyle(
                color:Colors.grey[500]!,
              ),
            ),
          ),
          const SizedBox(height: 5,),
        ],
      ),
    );
  }
}