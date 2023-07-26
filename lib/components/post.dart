import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Post extends StatelessWidget {
  final String description;
  final String weight;
  final String price;
  final String email;
  const Post({
    required this.description, 
    required this.weight,
    required this.price,
    required this.email,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top:5,left:10,right: 10),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: Expanded (
                    child: Column(
                      children: [
                        SizedBox(
                          height: 41,
                          child: Container(
                            decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(15),
                              topLeft: Radius.circular(5)),
                            color: Colors.black.withAlpha(80),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.person
                                ),
                                Text(
                                  email,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                    fontStyle: FontStyle.italic
                                  ),  
                                ),
                              ],
                            ),
                          ),
                        ),

                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 1),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(80)
                          ),
                          child: const Image(
                            image: NetworkImage(
                              "https://th.bing.com/th/id/OIP.TiWLhoqSQRdwgihF10cZZAHaE8?pid=ImgDet&rs=1",
                              )
                            ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal:0),
                                child: Container(
                                  padding:const EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.black54,
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top:10,bottom: 10,left: 4),
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
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(15),
                              bottomLeft: Radius.circular(15)),
                            color: Colors.black.withAlpha(80),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      "W e i g ht: $weight",
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontSize: 15,
                                      ),
                                    ),
                                    const SizedBox(height: 5,),
                                    Text(
                                      "O f f e r: $price",
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ] 
            ),
          ),
      ).animate().fade();
  }
}