import 'package:flutter/material.dart';
import 'package:quizapp/app/quiz.dart';
import 'package:quizapp/app/result.dart';
import 'app/question.dart';
import 'app/answer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

Color white = Colors.white;
Color black = Colors.black;
bool isSwitched = false;

class _MyAppState extends State<MyApp> {
  int _totalScore = 0;
  int _questionIndex = 0;

  void _resettQuiz() {
    setState(() {
      _questionIndex = 0;
    });
  }

  void answerQuestion(int score) {
    setState(() {
      _totalScore += score;
      _questionIndex += 1;
    });
    print(_questionIndex);
    print("Answer Chosen !");
    print(_totalScore);
  }

  final List<Map<String, Object>> _questions = [
    {
      'questionText': 'What\'s your favorite color',
      'answers': [
        {'text': 'Black', 'score': 30},
        {'text': 'Green', 'score': 10},
        {'text': 'Blue', 'score': 30},
        {'text': 'Yellow', 'score': 20}
      ]
    },
    {
      'questionText': 'What\'s your favorite animal',
      'answers': [
        {'text': 'Rabbit', 'score': 20},
        {'text': 'Dog', 'score': 30},
        {'text': 'Cat', 'score': 30},
        {'text': 'Lion', 'score': 10},
      ]
    },
    {
      'questionText': 'What\'s your favorite player',
      'answers': [
        {'text': 'Messi', 'score': 30},
        {'text': 'CR7', 'score': 10},
        {'text': 'Kaka', 'score': 20},
        {'text': 'Robben', 'score': 30},
      ]
    },
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.orange),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Quiz App"),
          actions: [
            Switch(
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                });
              },
              activeColor: Colors.white,
              inactiveThumbColor: Colors.black,
              inactiveTrackColor: Colors.black,
            ),
          ],
        ),
        body: Container(
          color: isSwitched == false ? Colors.white : Colors.black,
          child: _questionIndex < _questions.length
              ? Quiz(_questions, _questionIndex, answerQuestion)
              : Result(_resettQuiz, _totalScore),
        ),
      ),
    );
  }
}
