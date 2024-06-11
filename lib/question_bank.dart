import 'package:quizzler/question.dart';

class QuestionBank {
  final List<Question> _questions = [
    Question('First question', false),
    Question('Second question', false)
  ];

  int _currentPostition = -1;

  Question getNextQuestion() {
    if (_currentPostition < _questions.length - 1) {
      _currentPostition = _currentPostition + 1;
    }
    return _questions[_currentPostition];
  }

  int getTotalQuestionsCount() {
    return _questions.length;
  }
}
