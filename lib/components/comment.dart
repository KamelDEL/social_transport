import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Comment extends StatelessWidget {
  final String offer;
  final String user;
  final Timestamp time;
  final bool last;
  const Comment({
    super.key,
    required this.offer,
    required this.user,
    required this.time,
    required this.last
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.withAlpha(10),
              borderRadius: BorderRadius.circular(10)
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Icon(Icons.person),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(user),
                          Text((time.seconds/60).toString()),
                        ],
                      ),
                      Text(offer)
                    ],
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  const Icon(Icons.arrow_right)
                ],
              ),
            )
          ),
          // last? const Expanded(child: SizedBox()) : const SizedBox(),
          // last? const TextField() : const SizedBox()
        ],
      ),
    );
  }
}