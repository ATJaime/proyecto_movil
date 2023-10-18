import 'package:operaciones/domain/repositories/repository.dart';
import '../../../data_source/local_preference.dart';
import 'package:get/get.dart';

class AuthenticationUseCase {
  final Repository _repository = Get.find();
  final _sharedPreferences = LocalPreferences();

  Future<bool> get init async =>
      await _sharedPreferences.retrieveData<bool>('logged') ?? false;

  Future<bool> login(String email, String password) async =>
      await _repository.login(email, password);

  Future<bool> signUp(String email, String password) async =>
      await _repository.signUp(email, password);

  Future<bool> logOut() async => await _repository.logOut();
}
