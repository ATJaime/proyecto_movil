import 'package:operaciones/domain/repositories/use_case/authentication_case.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationController extends GetxController {
  final logged = false.obs;
  final AuthenticationUseCase _authentication = Get.find<AuthenticationUseCase>();
  bool get isLogged => logged.value;

  Future<void> login(email, password) async {
    final AuthenticationUseCase authentication = Get.find();
    await authentication.login(email, password);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('logged', true);
    logged.value = true;
  }

  Future<bool> signUp(email, password) async {
    final AuthenticationUseCase authentication = Get.find();
    logInfo('Controller Sign Up');
    await authentication.signUp(email, password);
    return true;
  }
  set isLogged(bool mode) {
    logged.value = mode;
  }

  void initializeRoute() async {
    isLogged = await _authentication.init;
  }

  Future<void> logOut() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('logged', false);
    logged.value = false;
  }
}
