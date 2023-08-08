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
    void addComment() {
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
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: MyTextField(
            controller: addOfferController,
            hintText: 'add an offer',
            obscureText: false,
            function: addComment,
          )
        ),
        const SizedBox(width: 5,),
        Align(
          alignment: const Alignment(0, 1),
          child: Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
              child: IconButton(onPressed: addOfferController.text == ""? addComment:(){},
                    icon: const Icon(Icons.post_add,color: Colors.white,),
              ),
            )),
        )
      ],
    );
  }
}