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
    return GestureDetector(
      onTap: (){Navigator.pop(context);},
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: 
            Center(
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[800]!,
                  ),
                  height: 600,
                  width: 500,
                  child: Column(
                    children: [
                      Expanded(child: CommentField(id: id)),
                      TextingBar(id: id)
                    ],
                  ),
                ),
              ),
            )
      ),
    );
  }
}