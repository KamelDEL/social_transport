import 'package:flutter/material.dart';
class Break extends StatelessWidget {
  const Break({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1,
      width: 50,
      child: Container(
        color: Theme.of(context).colorScheme.secondary,
      )
    );
  }
}