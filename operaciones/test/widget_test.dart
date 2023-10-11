// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:operaciones/models/user.dart';
import 'package:operaciones/domain/repositories/repository.dart';
import 'package:operaciones/ui/controllers/authentication.dart';
import 'package:operaciones/ui/controllers/controller.dart';
import 'package:operaciones/ui/controllers/user_controller.dart';

import 'package:operaciones/ui/home.dart';
import 'package:operaciones/domain/repositories/use_case/authentication_case.dart';
import 'package:operaciones/domain/repositories/use_case/user_case.dart';
enum DifficultyLevel {
    easy,
    intermediate,
    difficult,
  }
class MockController extends GetxService with Mock implements MyController{
  final _school = "".obs;
  final _name = "".obs;
  final _grade = "".obs;
  final _score = 0.obs;
  final _age = 0.obs;
  final _lastCorrectAnswers = 0.obs;
  final _levels = [DifficultyLevel.easy.obs, DifficultyLevel.easy.obs, DifficultyLevel.easy.obs];
  final _currentLevel = DifficultyLevel.easy.obs; // Agregar _currentLevel
  final _currentOperation = "".obs; // Nuevo atributo para la operación actual

  @override
  String get school => _school.value;
  @override
  String get name => _name.value;
  @override
  String get grade => _grade.value;
  @override
  int get score => _score.value;
  @override
  int get age => _age.value;
  @override
  int get lastCorrectAnswers => _lastCorrectAnswers.value;
  @override
  String get currentOperation => _currentOperation.value; // Nuevo getter para la operación actual

  @override
  void updateSchool(String school) {
    _school.value = school;
  }

  @override
  void updateName(String name) {
    _name.value = name;
  }

  @override
  void updateGrade(String grade) {
    _grade.value = grade;
  }

  @override
  void updateScore(int score) {
    _score.value = score;
  }

  @override
  void updateAge(int age) {
    _age.value = age;
  }

  @override
  void updateCorrectAnswers(int lastCorrectAnswers) {
    _lastCorrectAnswers.value = lastCorrectAnswers;
  }

  @override
  void updateCurrentOperation(String operation) { // Método para actualizar la operación actual
    _currentOperation.value = operation;
    switch(currentOperation){
      case "Suma":
        _currentLevel.value = _levels[0].value;
        break;
      case "Multiplicación":
        _currentLevel.value = _levels[1].value;
        break;
      case "Resta":
        _currentLevel.value = _levels[2].value;
        break;
    }
  }
}

class MockUserController extends GetxService with Mock implements UserController{
  final RxList<User> _users = <User>[].obs;

  @override
  final userUseCase = Get.find();

  @override
  List<User> get users => _users;

  @override
  getUers() async {
    logInfo("Getting users");
    _users.value = await userUseCase.getUsers();
  }

  @override
  addUser(User user) async {
    logInfo("Add user");
    await userUseCase.addUser(user);
    getUers();
  }

  @override
  updateUser(User user) async {
    logInfo("Update user");
    await userUseCase.updateUser(user);
    getUers();
  }

  @override
  void deleteUser(int id) async {
    await userUseCase.deleteUser(id);
    getUers();
  }

  @override
  void simulateProcess() async {
    await userUseCase.simulateProcess();
  }
}

class MockAuthenticationController extends GetxService with Mock implements AuthenticationController{
  @override
  final logged = false.obs;

  @override
  bool get isLogged => logged.value;

  @override
  Future<void> login(email, password) async {
    final AuthenticationUseCase authentication = Get.find();
    await authentication.login(email, password);
    logged.value = true;
  }
  @override
  Future<bool> signUp(email, password) async {
    final AuthenticationUseCase authentication = Get.find();
    logInfo('Controller Sign Up');
    await authentication.signUp(email, password);
    return true;
  }
  @override
  Future<void> logOut() async {
    logged.value = false;
  }
}

void main() {
  testWidgets('Login and first test', (WidgetTester tester) async {
    Get.put(Repository());
    Get.put(AuthenticationUseCase());
    Get.put(UserUseCase());
    MockController mockController = MockController();
    Get.put<MyController>(mockController);
    MockAuthenticationController mockAuthenticationController = MockAuthenticationController();
    Get.put<AuthenticationController>(mockAuthenticationController);
    MockUserController mockUserController = MockUserController();
    Get.put<UserController>(mockUserController);
    await tester.pumpWidget(const MyHomePage());
    expect(find.text("Login with email"), findsOneWidget);

    Get.deleteAll();
  });
  testWidgets('Login and second test', (WidgetTester tester) async {
    
  });
  testWidgets('Login and third test', (WidgetTester tester) async {
    
  });

  
  testWidgets('Login and results', (WidgetTester tester) async {
    
  });
}
