import 'package:flutter/material.dart';

class UserMsgId extends StatelessWidget {
  const UserMsgId({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(
          Icons.face,
          size: 50,
        ),
        Text("Message user 3"),
      ],
    );
  }
}