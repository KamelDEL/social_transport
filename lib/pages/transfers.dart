import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:social_transport/components/comments.dart';

import '../components/post.dart';

class Transfers extends StatefulWidget {
  const Transfers({super.key});

  @override
  State<Transfers> createState() => _TransfersState();
}


class _TransfersState extends State<Transfers> {
  int time = 0;
  String postId = "";
  void _startCountDown() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        time = Timestamp.now().seconds.toInt();
      });
    });
  }

  void delete(id)async {
    final commentsDocs =
      await FirebaseFirestore.instance
        .collection('Transfers')
        .doc(id)
        .collection('Comments')
        .get();
    for(var doc in commentsDocs.docs){
      await FirebaseFirestore.instance
        .collection('Transfers')
        .doc(id)
        .collection('Comments').doc(doc.id).delete();
    }
    FirebaseFirestore.instance
      .collection('Transfers')
      .doc(id)
      .delete();

  }
  // setDate(date){

  // }
  
  @override
  void initState() {
    _startCountDown();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Comments(id: postId),
        Scaffold(
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
                itemBuilder: (context, index) {
                  final transfer = snapshot.data!.docs[index];
                  final timer = 900 - (time.toInt() - transfer['TimeStamp'].seconds.toInt());
                  final id = transfer.id;
                  if(timer > 0) {
                    return Post(
                          email: transfer['Email'],
                          description: transfer['Description'],
                          weight: transfer['Weight'],
                          price: transfer['Price'],
                          date: transfer['TimeStamp'],
                          nowDate: timer.toInt(),
                          last: index+1 == snapshot.data!.docs.length,
                          postId : id,
                        );
                }
                  else {
                    delete(id);
                    return Container();
                  }
                }
              );
            }
            else{
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }
        ),
      ),]
    );
  }
}