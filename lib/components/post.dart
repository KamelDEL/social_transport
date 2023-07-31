import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:social_transport/components/break.dart';

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
                color: Colors.grey.withAlpha(20),
                borderRadius: BorderRadius.circular(5),
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
                      color: Colors.grey.withAlpha(50),
                      borderRadius: BorderRadius.circular(5),
                    ),
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
                                    const TextSpan(
                                      text: "W e i g h t: ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic,
                                        color: Colors.grey,
                                        fontSize: 15,
                                      ),
                                    ),
                                    TextSpan(
                                      text: widget.weight,
                                      style: const TextStyle(
                                        fontStyle: FontStyle.italic,
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    )
                                  ]),
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      const TextSpan(
                                        text: "O f f e r: ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.italic,
                                          color: Colors.grey,
                                          fontSize: 15,
                                        ),
                                      ),
                                      TextSpan(
                                        text: widget.price,
                                        style: const TextStyle(
                                          fontStyle: FontStyle.italic,
                                          color: Colors.white,
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
                        Container(
                          height: 35,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.grey.withAlpha(30),
                            borderRadius: BorderRadius.circular(5)
                          ),
                          child: MaterialButton(
                            onPressed: showCommentDialog,
                            child:const Center(
                              child: Text(
                                "Add Offer",
                              )
                            ),
                          )
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(child: Container(
                        padding: const EdgeInsets.only(top: 5),
                        child: Container(
                          color: Colors.blue.withAlpha(20),
                          child: TextButton(child: const Text('Offers'),onPressed: (){
                            showModalBottomSheet(context: context, builder: (BuildContext context){
                              return Comments(id: widget.postId);
                            });
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => Comments(id: widget.postId)),
                            //   );
                          },),
                        ),
                      )),
                    ],
                  ),
                  const Row(
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ).animate().fade(),
          const Break(),
          widget.last ? Container(
            height: 100,
            width: 600,
            color:Colors.grey.withAlpha(20),
            child: const Center(
              child: Text("End Of Transfers")
            )) 
            : const SizedBox(),
        ],
      );
    } else{
        return Container();
      }
  }
}