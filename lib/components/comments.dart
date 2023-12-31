import 'package:flutter/material.dart';
import 'package:social_transport/components/comments_field.dart';
import 'package:social_transport/components/comment_texting_field.dart';

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
  // ignore: prefer_typing_uninitialized_variables
  var commentTextingField;
  @override
  void initState() {
    super.initState();
    commentTextingField = TextingBar(id: widget.id);
  }
  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
      onTap: (){Navigator.pop(context);},
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              height: 600,
              width: 500,
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  const Text("offers"),
                  SizedBox(
                      height: 20,
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Theme.of(context).colorScheme.background,
                          ),
                          height: 3,
                          width: 50,
                        ),
                      ),
                    ),
                  
                  Expanded(child: CommentField(id: widget.id)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:8.0),
                    child: commentTextingField,
                  )
                ],
              ),
            ),
          ),
        )
      ),
    );
  }
}