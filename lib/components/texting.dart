import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_transport/components/text_field.dart';

class TextingBar extends StatelessWidget {
  final String id;
  const TextingBar({
    required this.id,
    super.key});
  

  @override
  Widget build(BuildContext context) {
    final addOfferController = TextEditingController();
    final currentUser = FirebaseAuth.instance.currentUser;

    return Container(
      alignment: const Alignment(0, 1),
      height: 90,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: MyTextField(
                controller: addOfferController,
                hintText: 'add an offer',
                obscureText: false,
              )
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5,bottom: 15),
              child: Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: IconButton(onPressed: () {
                        FirebaseFirestore.instance
                            .collection("Transfers")
                            .doc(id)
                            .collection("Comments")
                            .add({
                          "commentText": addOfferController.text,
                          "CommentedBy": currentUser?.email,
                          "CommentTime": Timestamp.now(),
                        });
                        addOfferController.clear();
                      },
                      icon: const Icon(Icons.post_add),
                )),
            )
          ],
        ),
      ),
    );
  }
}