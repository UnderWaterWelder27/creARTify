import 'package:flutter/material.dart';


class BoardTittleWidget extends StatelessWidget {
  const BoardTittleWidget({super.key, required this.inputText});
  final String inputText;

  @override
  Widget build(BuildContext context) {
    return Text(
      inputText,
      style: TextStyle(
        fontFamily: 'TTNorms',
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    );
  }
}
