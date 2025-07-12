import 'package:flutter/material.dart';

class TextPrimary extends StatelessWidget {
  final String text;

  const TextPrimary({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(fontSize: 16, fontFamily: 'QuickSand'));
  }
}
