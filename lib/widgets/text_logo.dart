import 'package:flutter/material.dart';

class TextLogo extends StatelessWidget {
  final String text;
  final String? fontFamily;
  const TextLogo({super.key, required this.text, this.fontFamily});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: fontFamily,
        fontSize: 36,
        fontWeight: FontWeight.bold,
        color: Colors.blue,
      ),
    );
  }
}
