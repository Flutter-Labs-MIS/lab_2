import 'package:flutter/material.dart';

class ClothesQuestion extends StatelessWidget {
  String _question;

  ClothesQuestion(this._question);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Text(
        _question,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.blue,
          fontSize: 30,
        ),
      ),
    );
  }
}
