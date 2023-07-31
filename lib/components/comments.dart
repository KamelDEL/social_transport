import 'package:flutter/material.dart';
import 'package:social_transport/components/comments_field.dart';
import 'package:social_transport/components/texting.dart';

class Comments extends StatelessWidget {
  final String id;
  const Comments({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text("Offers"),
      ),
      body: 
          Column(
            children: [
              Expanded(child: CommentField(id: id)),
              TextingBar(id: id)
            ],
          )
    );
  }
}