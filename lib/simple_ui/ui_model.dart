import 'package:flutter/cupertino.dart';

class Model {
  final String numbers;
  final String title;
  final Color color;

  Model({required this.numbers, required this.title, required this.color});
}

final List<Model> getModel = [
  Model(numbers: '200', title: 'Total Test', color: const Color(0xFF5F58A8)),
  Model(numbers: '250', title: 'Total Student', color: const Color(0xFF35AF47)),
  Model(numbers: '90', title: 'Total Quizzes', color: const Color(0xFFA73196)),
  Model(numbers: '05:30', title: 'Total Time', color: const Color(0xFFEAD241)),
];
