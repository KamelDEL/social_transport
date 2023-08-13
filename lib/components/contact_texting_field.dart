import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_transport/components/text_field.dart';

import '../chat/chat_service.dart';

class ContactTextingField extends StatelessWidget {
  final String receiverId;
  const ContactTextingField({
    super.key, 
    required this.receiverId
  });

  @override
  Widget build(BuildContext context) {
    final msgController = TextEditingController();
    // ignore: no_leading_underscores_for_local_identifiers
    final ChatService _chatService = ChatService();
    // ignore: no_leading_underscores_for_local_identifiers, unused_local_variable
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    // ignore: unused_element
    void sendMessage() async {
      if (msgController.text.isNotEmpty) {
        await _chatService.sendMessage(receiverId, msgController.text);
        msgController.clear();
      }
    }
    
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