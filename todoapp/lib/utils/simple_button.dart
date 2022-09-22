import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SimpleButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  SimpleButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.blueGrey,
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
