import 'package:operaciones/repositories/repository.dart';
import 'package:get/get.dart';

class AuthenticationUseCase {
  final Repository _repository = Get.find();

  Future<bool> login(String name, String grade, String school) async =>
      await _repository.login(name, grade, school);

  Future<bool> signUp(String name, String grade, String school) async =>
      await _repository.signUp(name, grade, school);

  Future<bool> logOut() async => await _repository.logOut();
}