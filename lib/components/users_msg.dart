import 'package:flutter/material.dart';
import 'package:social_transport/components/user_msg_id.dart';
import 'package:social_transport/pages/message_box.dart';

class UsersMsgs extends StatefulWidget {
  const UsersMsgs({super.key});

  @override
  State<UsersMsgs> createState() => _UsersMsgsState();
}

class _UsersMsgsState extends State<UsersMsgs> {
  void contactUser() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MessageBox()),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SafeArea(
        child: Container(
          color: Theme.of(context).colorScheme.background,
          child: ListView(
            children: const [
              SizedBox(height: 20,),
              UserMsgId(),
              UserMsgId(),
              UserMsgId(),
              UserMsgId(),
              UserMsgId(),
              UserMsgId(),
              UserMsgId(),
              UserMsgId(),
              UserMsgId(),
              UserMsgId(),
            ],
          ),
        ),
      ),
    );
  }
}