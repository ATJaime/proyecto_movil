import 'package:get/get.dart';

class MyController extends GetxController {
  final _user = "".obs;
  final _password = "".obs;
  final _grade = "".obs;
  final _score = 0.obs;
  final _age = 0.obs;

  String get user => _user.value;
  String get password => _password.value;
  String get grade => _grade.value;
  int get score => _score.value;
  int get age => _age.value;

  void updateUser(String user) {
    _user.value = user;
  }

  void updatePassword(String password) {
    _password.value = password;
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
}
