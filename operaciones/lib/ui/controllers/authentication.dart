import 'package:operaciones/use_case/authentication_case.dart';
import 'package:get/get.dart';

import 'package:loggy/loggy.dart';

class AuthenticationController extends GetxController {
  final logged = false.obs;

  bool get isLogged => logged.value;

  Future<void> login(name, grade, school) async {
    final AuthenticationUseCase authentication = Get.find();
    await authentication.login(name, grade, school);
    logged.value = true;
  }

  Future<bool> signUp(name, grade, school) async {
    final AuthenticationUseCase authentication = Get.find();
    logInfo('Controller Sign Up');
    await authentication.signUp(name, grade, school);
    return true;
  }

  Future<void> logOut() async {
    logged.value = false;
  }
}