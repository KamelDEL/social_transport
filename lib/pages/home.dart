import 'package:cloud_firestore/cloud_firestore.dart';
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

  void openEndDrawer(){
    Scaffold.of(context).openEndDrawer();
  }

// ignore: non_constant_identifier_names

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Expanded(
          child: Row(
            children:  [
              Icon(Icons.emoji_transportation),
              Text(
                'T R A N S P O R T E R',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.blue
                ),
              )
            ],
          ),
        ),
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: openEndDrawer,
                icon: const Icon(
                  Icons.inbox,
                ),
              ),
              IconButton(
                onPressed: openEndDrawer,
                icon: const Icon(
                  Icons.settings,
                ),
              ),
              IconButton(
                onPressed: openEndDrawer,
                icon: const Icon(
                  Icons.sunny,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        ],
      ),
      drawer: Drawer(
        child: MyDrawer(),
      ),
      endDrawer: const Drawer(),
      floatingActionButton: FloatingActionButton(onPressed: createNewTransfer,
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore
          .instance
          .collection("Transfers")
          .orderBy(
            'TimeStamp',
            descending: true
          ).snapshots(),
        builder: (context, snapshot) {
          
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index){
                final transfer = snapshot.data!.docs[index];
                return Post(
                  email: transfer['Email'],
                  description: transfer['Description'],
                  weight: transfer['Weight'],
                  price: transfer['Price'],
                );
              }
            );
          }
          else{
            return const Center(
              child: Text('its so dry here')
            );
          }
        }
      ),
    );
  }
}