import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:social_transport/components/break.dart';
import 'package:social_transport/components/comment_texting_field.dart';

import 'comments.dart';

class Post extends StatefulWidget {
  final String description;
  final String weight;
  final String price;
  final String email;
  final Timestamp date;
  final int nowDate;
  final bool last;
  final String postId;
  const Post({
    required this.description, 
    required this.weight,
    required this.price,
    required this.email,
    required this.last,
    required this.date,
    required this.nowDate,
    required this.postId,
    super.key
  });

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  final currentUser = FirebaseAuth.instance.currentUser!;

  final _controller = TextEditingController();

  String timerSeconds(time){
    if(time >= 0){
      if (time % 60 < 10) {
        return "0${time % 60}";
      }
      return "${time % 60}";
    }
    return "00";
  }

  String timerMinutes(time){
    if(time >0 ){
      if (time < 10) {
        return "0${time ~/ 60}";
      }
      return "${time ~/ 60}";
    }
    return "00";
  }

  void showOffers(){
    if(MediaQuery.of(context).size.shortestSide < 600) {
      showModalBottomSheet<void>(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext context){
          return ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft:Radius.circular(20),
              topRight: Radius.circular(20),
            ),
              child: Comments(
                id: widget.postId
              ),
          );
        }
    );
    } else {
      showDialog(
        context: context, 
        builder: (BuildContext context){
          return ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40)),
            child: Comments(id: widget.postId),
          );
        }
      );
    }
  }

  void showCommentDialog() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
        title: const Text("Add Offer"),
        content: TextField(
          controller: _controller,
        ),
        actions: [
          TextButton(
            child: const Text("add"),
            onPressed: () {
              FirebaseFirestore.instance
                  .collection("Transfers")
                  .doc(widget.postId)
                  .collection("Comments")
                  .add({
                "commentText": _controller.text,
                "CommentedBy": currentUser.email,
                "CommentTime": Timestamp.now()
              });
              _controller.clear();
              Navigator.pop(context);
            },
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("cancel"),
          )
        ],
      ));
  }
  // ignore: prefer_typing_uninitialized_variables
  var addCommentTextField;
  @override
  void initState() {
    super.initState();
    addCommentTextField = TextingBar(id: widget.postId);
  }

  @override
  Widget build(BuildContext context) {
    if(widget.nowDate < 900) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10,left:10,right: 17, top: 10),
            child: Container(
              width: 600,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                borderRadius: BorderRadius.circular(5),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 2
                  )
                ]
              ),
              child: Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("${timerMinutes(widget.nowDate)}:${timerSeconds(widget.nowDate)}"),
                        Row(
                          children: [
                            const Icon(
                              Icons.person
                            ),
                            Text(
                              widget.email,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w100,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ],
                        ),
                        //post description
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 0),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 3),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, bottom: 10, left: 4),
                                    child: Text(
                                      widget.description,
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    //weight height
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                      text: "W e i g h t: ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic,
                                        color: Theme.of(context).colorScheme.secondary,
                                        fontSize: 15,
                                      ),
                                    ),
                                    TextSpan(
                                      text: widget.weight,
                                      style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        
                                        color: Theme.of(context).colorScheme.secondary,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ]),
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "O f f e r: ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.italic,
                                          color: Theme.of(context).colorScheme.secondary,
                                          fontSize: 15,
                                        ),
                                      ),
                                      TextSpan(
                                        text: widget.price,
                                        style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          color: Theme.of(context).colorScheme.secondary,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ]
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                  addCommentTextField,
                  //offers add offer
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: TextButton(
                          onPressed: showOffers,
                          child: const Text(
                            'See Offers',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )),
                    ],
                  ),
                ],
              ),
            ),
          ).animate().fade(),
          const Break(),
          const SizedBox(height: 15,),
          widget.last ? Row(
            children: [
              Expanded(
                child: Container(
                  height: 30,
                  color:Theme.of(context).colorScheme.primary,
                  child: const Center(
                    child: Text("End Of Transfers")
                  )),
              ),
            ],
          ) 
          : const SizedBox(),
        ],
      );
    } else{
        return Container();
      }
  }
}