import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

import '../../models/user.dart';
import '../../domain/repositories/use_case/user_case.dart';

class UserController extends GetxController {
  final RxList<User> _users = <User>[].obs;
  final UserUseCase userUseCase = Get.find();

  List<User> get users => _users;

  getUsers() async {
    logInfo("Getting users");
    _users.value = await userUseCase.getUsers();
  }

  addUser(User user) async {
    logInfo("Add user");
    await userUseCase.addUser(user);
  }

  updateUser(User user) async {
    logInfo("Update user");
    await userUseCase.updateUser(user);
  }

  void deleteUser(int id) async {
    await userUseCase.deleteUser(id);
  }

  void simulateProcess() async {
    await userUseCase.simulateProcess();
  }

  Future<User> getUser(String email) async {
   User user = await userUseCase.getUser(email);
   return user;
  }
}