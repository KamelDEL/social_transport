import 'package:flutter/material.dart';
import 'package:social_transport/components/text_field.dart';

class ContactTextingField extends StatelessWidget {
  const ContactTextingField({super.key});

  @override
  Widget build(BuildContext context) {
    final msgController = TextEditingController();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            child: MyTextField(
          controller: msgController,
          hintText: 'add an offer',
          obscureText: false,
        )),
        const SizedBox(
          width: 5,
        ),
        Align(
          alignment: const Alignment(0, 1),
          child: Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.send,
                    color: Colors.white,
                  ),
                ),
              )),
        )
      ],
    );
  }
}