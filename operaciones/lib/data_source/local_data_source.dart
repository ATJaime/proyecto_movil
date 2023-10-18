import 'package:operaciones/domain/repositories/entities/some_data.dart';
import 'package:hive/hive.dart';
import 'package:loggy/loggy.dart';
import 'package:operaciones/models/user.dart';

import '../models/some_data_db.dart';

class LocalDataSource {
  Future<void> addEntry(User user) async {
    logInfo("Adding entry to db");
    Hive.box('someData')
        .add(SomeDataDb(name: user.name, grade: user.Grade, school: user.School, difficulty: user.difficulties));
  }

  Future<List<SomeData>> getAll() async {
    List<SomeData> entries = Hive.box('someData')
        .values
        .map((entry) => SomeData.id(
            id: entry.key, name: entry.name, grade: entry.grade, school: entry.school, difficulty: entry.difficulty))
        .toList();
    return entries;
  }

  Future<List<User>> getUsers() async {
    List<SomeData> users = await getAll();
    return users.map((e) => User(
      id: e.id, 
      name: e.name, 
      grade: e.grade, 
      school: e.school, 
      difficulties: e.difficulty)).toList();
  }

  Future<User> getUser(String name) async {
    User user;
    List<SomeData> users = await getAll();
    SomeData u = users.where((x) => x.name == name).first;
    if (u == null) {
      return Future.error("User not found");
    }
    user = User(
        id: u.id,
        name: u.name,
        grade: u.grade,
        school: u.school,
        difficulties: u.difficulty,
      );
    return Future.value(user);
    
  }

  updateEntry(User user) {
    logInfo("Updating entry with id ${user.id}");
    Hive.box('someData').put(
        user.id,
        SomeDataDb(
          name: user.Name, grade: user.Grade, school: user.School, difficulty: user.difficulties
        ));
  }
}