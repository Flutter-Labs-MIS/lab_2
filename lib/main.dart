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

  String _successMessage = "";

  void _nextQuestion() {
    setState(() {
      if (_currQuestionIndex < questions.length - 1) {
        _currQuestionIndex++;
      } else {
        _successMessage = "Successfully chosen!";
      }
    });
  }

  void _resetQuesions() {
    setState(() {
      _currQuestionIndex = 0;
      _successMessage = "";
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
            if (_successMessage == "")
              ClothesQuestion(
                  questions[_currQuestionIndex]['question'] as String),
            if (_successMessage == "")
              ...(questions[_currQuestionIndex]['answers'] as List<String>)
                  .map((answer) => ClothesAnswer(_nextQuestion, answer)),
            if (_successMessage != "")
              Text(
                _successMessage,
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.green,
                ),
              ),
            if (_successMessage != "")
              Container(
                margin: EdgeInsets.all(20),
                child: ElevatedButton(
                  onPressed: _resetQuesions,
                  child: const Text('Try Again'),
                ),
              )
          ],
        ),
      ),
    );
  }
}
