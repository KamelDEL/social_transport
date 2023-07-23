import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_transport/components/drawer.dart';
import 'package:social_transport/components/post.dart';
import 'package:social_transport/pages/add_transfer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void signout() {
    FirebaseAuth.instance.signOut();
  }

  void createNewTransfer(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddTransfer()),
    );
  }

// ignore: non_constant_identifier_names

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Icon(Icons.emoji_transportation),
            Text(
              'T R A N S P O R T E R',
            )
          ],
        ),
        actions: [
          Row(
            children: [
                  IconButton(
                    onPressed: signout,
                    icon: const Icon(
                      Icons.inbox,
                    ),
                  ),
              const SizedBox(width: 20,)
            ],
          ),
        ],
      ),
      drawer: Drawer(
        child: MyDrawer(),
      ),
      floatingActionButton: FloatingActionButton(onPressed: createNewTransfer,
        child: const Icon(Icons.add),
      ),
      body: ListView(
        children: const  [
          Post(
              text:
                  'i have this and i need it to be transported, its a weigh of 32KG and i need it to be in algiers as fast as possible weigh of 32KG and i need it to be in algiers as fast as possible weigh of 32KG and i need it to be in algiers as fast as possible'),
          Post(
              text:
                  'i have this and i need it to be transported, its a weigh of 52KG and i need it to be in algiers as fast as possible'),
          Post(
              text:
                  'i have this and i need it to be transported, its a weigh of 42KG and i need it to be in algiers as fast as possible'),
          Post(
              text:
                  'i have this and i need it to be transported, its a weigh of 98KG and i need it to be in algiers as fast as possible'),
        ],
      ),
    );
  }
}