import 'package:operaciones/data_source/authentication_source.dart';

import '../data_source/user_source.dart';
import '../models/user.dart';

class Repository {
  late AuthenticationDatatasource _authenticationDataSource;
  late UserDataSource _userDatatasource;
  String token = "";

  // the base url of the API should end without the /
  final String _baseUrl =
      "http://ip172-18-0-46-ck87bmogftqg00eqvs0g-8000.direct.labs.play-with-docker.com";

  Repository() {
    _authenticationDataSource = AuthenticationDatatasource();
    _userDatatasource = UserDataSource();
  }

  Future<bool> login(String name, String grade, String school) async {
    token = await _authenticationDataSource.login(_baseUrl, name, grade, school);
    return true;
  }

  Future<bool> signUp(String name, String grade, String school) async =>
      await _authenticationDataSource.signUp(_baseUrl, name, grade, school);

  Future<bool> logOut() async => await _authenticationDataSource.logOut();

  Future<List<User>> getUsers() async => await _userDatatasource.getUsers();

  Future<bool> addUser(User user) async =>
      await _userDatatasource.addUser(user);

  Future<bool> updateUser(User user) async =>
      await _userDatatasource.updateUser(user);

  Future<bool> deleteUser(int id) async =>
      await _userDatatasource.deleteUser(id);

  Future<bool> simulateProcess() async =>
      await _userDatatasource.simulateProcess(_baseUrl, token);
}