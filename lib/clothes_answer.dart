import 'package:flutter/material.dart';

class ClothesAnswer extends StatelessWidget {
  String _answer;
  VoidCallback pressed;

  ClothesAnswer(this.pressed, this._answer);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: pressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
        ),
        child: Text(
          _answer,
          style: const TextStyle(
            fontSize: 25,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
