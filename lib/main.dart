import 'package:flutter/material.dart';
import 'clothes_question.dart';
import 'clothes_answer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clothes Q&A',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Clothes Q&A'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var questions = [
    {
      'question': 'Choose your hat',
      'answers': ['Black hat', 'White hat', 'Red hat'],
    },
    {
      'question': 'Choose your t-shirt',
      'answers': ['Black t-shirt', 'White t-shirt', 'Red t-shirt'],
    },
    {
      'question': 'Choose your jeans',
      'answers': ['Black jeans', 'White jeans', 'Red jeans'],
    }
  ];
  var _currQuestionIndex = 0;

  void _pressButton() {
    setState(() {
      if (_currQuestionIndex < questions.length - 1) _currQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClothesQuestion(
                questions[_currQuestionIndex]['question'] as String),
            ...(questions[_currQuestionIndex]['answers'] as List<String>)
                .map((answer) => ClothesAnswer(_pressButton, answer)),
          ],
        ),
      ),
    );
  }
}
