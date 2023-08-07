import 'package:flutter/material.dart';
import 'package:social_transport/components/contact_texting_field.dart';

import '../components/msg_box.dart';
//import '../components/comment_texting_field.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: const Column(
        children: [
          MsgBox(),
          ContactTextingField(),
        ],
      )
    );
  }
}