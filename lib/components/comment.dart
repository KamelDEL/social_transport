import 'package:flutter/material.dart';

class Comment extends StatelessWidget {
  final String offer;
  const Comment({
    super.key,
    required this.offer
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
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
                  Text(offer)
                ],
              ),
              const Expanded(
                child: SizedBox()
              ),
              const Icon(Icons.arrow_right)
            ],
          ),
        )
      ),
    );
  }
}