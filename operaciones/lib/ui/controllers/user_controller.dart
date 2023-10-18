import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:operaciones/domain/repositories/entities/some_data.dart';

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
    var connectivityResult = await (Connectivity().checkConnectivity()); 
    if (connectivityResult != ConnectivityResult.none){
      User u = await userUseCase.getUser(user.name);
      user.id = u.id;
      await userUseCase.updateUser(user);
    }
  }

  void deleteUser(int id) async {
    await userUseCase.deleteUser(id);
  }

  Future<User> getUser(String name) async {
   User user = await userUseCase.getUser(name);
   return user;
  }

  Future<SomeData> getAll() async{
    List<SomeData> all = await userUseCase.getAll();
    logInfo(all);
    return await userUseCase.getAll();
  }

  void updateUserLocal(User user) async{
    await userUseCase.updateUserLocal(user);
  }
  void addUserLocal(User user) async{
    await userUseCase.addUserLocal(user);
  }
}