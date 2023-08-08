import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:social_transport/components/contact_texting_field.dart';
import 'package:social_transport/components/users_msg.dart';

class MessageBox extends StatefulWidget {
  const MessageBox({super.key});

  @override
  State<MessageBox> createState() => _MessageBoxState();
}

class _MessageBoxState extends State<MessageBox> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Slidable(
        startActionPane: MediaQuery.of(context).size.width < 910
            ? ActionPane(
                extentRatio:
                    MediaQuery.of(context).size.width > 500 ? 0.4 : 0.7,
                motion: const BehindMotion(),
                children: const [
                    UsersMsgs(),
                  ])
            : null,
        endActionPane: MediaQuery.of(context).size.width < 600
            ? ActionPane(
                extentRatio:
                    MediaQuery.of(context).size.width < 500 ? 0.7 : 0.4,
                motion: const BehindMotion(),
                children: const [
                    UsersMsgs(),
                  ])
            : null,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            title: Row(
              children: [
                const Icon(Icons.person),
                Text("user n1",style: TextStyle(color: Theme.of(context).colorScheme.secondary),),
            ]),
            actions: [
              IconButton(
                onPressed: (){}, 
                icon: const Icon(Icons.call),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Expanded(child: Container()),
                const ContactTextingField()
            ],),
          ),
        ),
      ),
    );
  }
}