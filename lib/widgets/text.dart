import 'package:flutter/material.dart';

class TextWidgets extends StatelessWidget {
  const TextWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Simple Text Demo',
        style: TextStyle(
          color: Colors.cyanAccent,
          fontSize: 32,
          fontStyle: FontStyle.italic,
          decoration: TextDecoration.underline
        ),
      ),
    );

  }
}
