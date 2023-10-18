import 'package:get/get.dart';
import 'package:operaciones/data_source/local_data_source.dart';

import '../../../models/user.dart';
import '../repository.dart';

class UserUseCase {
  final Repository _repository = Get.find();
  final LocalDataSource _localDataSource = Get.find();


  Future<List<User>> getUsers() async {
    return await _repository.getUsers();
  }

  Future<void> addUser(User user) async {
    await _repository.addUser(user);
  } 

  Future<void> addUserLocal(User user) async {
    await _localDataSource.addEntry(user);
  } 

  Future<void> updateUser(User user) async {
    	await _repository.updateUser(user);
  }
  Future<void> updateUserLocal(User user) async {
    	await _localDataSource.updateEntry(user);
  }
      

  deleteUser(int id) async => await _repository.deleteUser(id);


  getUser(String email) async {
      return await _repository.getUser(email);
    }

  getAll() async {
    return await _localDataSource.getAll();
  }
  }
