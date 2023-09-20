import 'package:get/get.dart';

class MyController extends GetxController {
  final _school = "".obs;
  final _name = "".obs;
  final _grade = "".obs;
  final _score = 0.obs;
  final _age = 0.obs;
  final _lastCorrectAnswers = 0.obs;

  String get school => _school.value;
  String get name => _name.value;
  String get grade => _grade.value;
  int get score => _score.value;
  int get age => _age.value;
  int get lastCorrectAnswers => _lastCorrectAnswers.value;

  void updateSchool(String school) {
    _school.value = school;
  }

  void updateName(String name) {
    _name.value = name;
  }

  void updateGrade(String grade) {
    _grade.value = grade;
  }

  void updateScore(int score) {
    _score.value = score;
  }

  void updateAge(int age) {
    _age.value = age;
  }

  void updateCorrectAnswers(int lastCorrectAnswers) {
    _lastCorrectAnswers.value = lastCorrectAnswers;
  }
}
