import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:social_transport/components/comment.dart';
import 'package:social_transport/components/texting.dart';

class Comments extends StatefulWidget {
  final String id;
  const Comments({
    super.key,
    required this.id,
  });

  @override
  State<Comments> createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        elevation: 2,
        color: Colors.transparent,
        child: TextingBar(id: widget.id),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text("Offers"),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore
          .instance
          .collection("Transfers")
          .doc(widget.id)
          .collection("Comments")
          .orderBy(
            "CommentTime",
            descending: false
          ).snapshots(),
          builder: (context, snapshot) {
            if(snapshot.hasData){
              return Padding(
                padding: const EdgeInsets.only(top:10,right: 10,left: 10),
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
                              time: comments["CommentTime"].seconds.toString(),
                              last: snapshot.data!.docs.length - 1 == index
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
                child: CircularProgressIndicator()
              );
            }
            }
       ),
    );
  }
}