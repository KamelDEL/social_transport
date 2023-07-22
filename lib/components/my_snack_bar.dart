// ignore: file_names
import 'package:flutter/material.dart';

class MySnackBar extends StatelessWidget {
  final String e;
  const MySnackBar({
    super.key,
    required this.e
  });

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Row(
            children: [
              const SizedBox(
                width: 30,
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          const Text("Oops!! something went wrong",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white)),
                          Text("error: $e",
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.white)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 30,
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          )
        ],
      );
  }
}