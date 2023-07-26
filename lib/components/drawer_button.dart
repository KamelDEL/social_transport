import 'package:flutter/material.dart';
class DrawButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;
  final bool red;
  const DrawButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
    required this.red
  });
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      color: red? Colors.red: Colors.transparent,
      onPressed: onPressed,
      height: 50,
      child: Row(
        children: [
          Icon(
            icon,
            size: 20,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: const TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
}
}