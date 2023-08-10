import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final void function;

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
          TextFormField(
            keyboardType: hintText == "add an offer"? const TextInputType.numberWithOptions(
              decimal: true,
            ):null,
            validator:hintText == "add an offer"? (string){
              final number = num.tryParse(string!);
              if( number == null ) {
                return "";
              }
              return null;
            }:null,
            controller: controller,
            obscureText: obscureText,
            onFieldSubmitted:(value)=>function, 
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(hintText=="add an Offer"? 50:10),
              ),
              enabledBorder:  OutlineInputBorder(
                borderRadius: BorderRadius.circular(hintText == "add an Offer" ? 50 : 10),
                borderSide: const BorderSide(
                  color: Colors.grey,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.secondary
                ),
              ),
              fillColor: Colors.grey[500]!,
              suffix: hintText == "add an offer"? const Text("DA") : null,
              hintText: hintText,
              labelText: hintText,
              labelStyle: TextStyle(
                color: Theme.of(context).colorScheme.onBackground
              ),
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