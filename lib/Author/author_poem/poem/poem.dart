import 'package:flutter/material.dart';

class CardPoem extends StatelessWidget {
  String poemName;
  List<String> poem;

  CardPoem({required this.poemName, required this.poem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(poemName),
        ),
        body: SingleChildScrollView(
          child: Text(
            poem.join(),
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                fontFamily: 'Kirimomi',
                wordSpacing: 8,
                color: Colors.white),
          ),
        ));
  }
}
