import 'package:get/get.dart';

class MyController extends GetxController {
  final _user = "".obs;
  final _password = "".obs;
  final _score = 0.obs;

  String get user => _user.value;
  String get password => _password.value;
  int get score => _score.value;

  void updateUser(String user) {
    _user.value = user;
  }

  void updatePassword(String password) {
    _password.value = password;
  }

  void updateScore(int score) {
    _score.value = score;
  }
}
