import 'package:flutter/material.dart';

class Comment extends StatelessWidget {
  final String offer;
  const Comment({
    super.key,
    required this.offer
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Row(
        children: [
          const Icon(Icons.abc),
          Column(
            children: [
              Text(offer)
            ],
          )
        ],
      )
    );
  }
}