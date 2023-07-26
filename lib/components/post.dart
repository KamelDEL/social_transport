import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:social_transport/components/break.dart';

class Post extends StatelessWidget {
  final String description;
  final String weight;
  final String price;
  final String email;
  final bool last;
  const Post({
    required this.description, 
    required this.weight,
    required this.price,
    required this.email,
    required this.last,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    if(email == "kamel@kamel.com") {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10,left:10,right: 17, top: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.withAlpha(20),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                children: [
                  Column(
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.person
                            ),
                            Text(
                              email,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w100,
                                fontStyle: FontStyle.italic
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
                                      description,
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
                      borderRadius: BorderRadius.circular(15),
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
                                      text: weight,
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
                                        text: price,
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
                        GestureDetector(
                          onTap: (){},
                          child: Container(
                            height: 35,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.grey.withAlpha(30),
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child:const Center(child: Text("Add Offer",)),)
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ).animate().fade(),
          const Break(),
          last ? const SizedBox(height: 50) : const SizedBox(height: 0)
        ],
      );
    } else {
      return const SizedBox();
    }
  }
}