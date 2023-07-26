import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../components/post.dart';

class Transfers extends StatefulWidget {
  const Transfers({super.key});

  @override
  State<Transfers> createState() => _TransfersState();
}


class _TransfersState extends State<Transfers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  date: transfer['TimeStamp'],
                  last: index+1 == snapshot.data!.docs.length
                );
              }
            );
          }
          else{
            return const Center(
              child: CircularProgressIndicator()
            );
          }
        }
      ),
    );
  }
}