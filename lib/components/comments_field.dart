import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'comment.dart';

class CommentField extends StatefulWidget {
  final String id;
  const CommentField({
    super.key,
    required this.id
  });

  @override
  State<CommentField> createState() => _CommentFieldState();
}

class _CommentFieldState extends State<CommentField> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore
          .instance
          .collection("Transfers")
          .doc(widget.id)
          .collection("Comments")
          .orderBy(
            "CommentTime",
            descending: false,)
          .snapshots(),
          builder: (context, snapshot) {
            if(snapshot.hasData){
              return Padding(
                padding: const EdgeInsets.only(right: 10,left: 10),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          final comments = snapshot.data!.docs[index];
                          if(snapshot.data!.docs.isNotEmpty) {
                            return Comment(
                              offer: comments["commentText"],
                              user: comments["CommentedBy"],
                              time: comments["CommentTime"],
                              last: snapshot.data!.docs.length - 1 == index,
                            );
                          } else {
                            return const Center(
                              child: Text("No Offers yet")
                            );
                          }
                        }
                      ),
                    ),
                  ],
                  
                ),
              );}
              else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            }
       );
  }
}