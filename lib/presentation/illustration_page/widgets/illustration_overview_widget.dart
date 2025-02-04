import 'package:flutter/material.dart';



class IllustrationOverviewWidget extends StatelessWidget {
  const IllustrationOverviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Overview',
        style: TextStyle(
            fontFamily: 'TTNorms',
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.white
        ),
      ),
    );
  }
}
