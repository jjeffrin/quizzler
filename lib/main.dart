import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quizzler/question_bank.dart';
import 'package:quizzler/question.dart';

QuestionBank _questionBank = QuestionBank();

void main() {
  runApp(const QuizzlerApp());
}

class QuizzlerApp extends StatefulWidget {
  const QuizzlerApp({super.key});

  @override
  State<QuizzlerApp> createState() => _QuizzlerAppState();
}

class _QuizzlerAppState extends State<QuizzlerApp> {
  Question _currentQuestion = _questionBank.getNextQuestion();
  List<Icon> answerIcons = [];

  @override
  Widget build(BuildContext context) {
    void moveToNextQuestion(bool selectedAnswer) {
      setState(() {
        if (selectedAnswer == _currentQuestion.answer) {
          if (answerIcons.length != _questionBank.getTotalQuestionsCount()) {
            answerIcons.add(Icon(Icons.check));
          }
          _currentQuestion = _questionBank.getNextQuestion();
        } else {
          if (answerIcons.length != _questionBank.getTotalQuestionsCount()) {
            answerIcons.add(Icon(Icons.close));
          }
          _currentQuestion = _questionBank.getNextQuestion();
        }
      });
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 8,
                  child: Center(child: Text(_currentQuestion.title)),
                ),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () => moveToNextQuestion(true),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Container(
                        color: Colors.green,
                        child: Center(child: Text('True')),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () => moveToNextQuestion(false),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Container(
                        color: Colors.red,
                        child: Center(child: Text('False')),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: answerIcons,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
