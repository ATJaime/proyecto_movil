import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:operaciones/models/user.dart';
import '../../domain/repositories/use_case/create_questions.dart';
class MyController extends GetxController {
  final _user = User(id: 0, name: "", grade: "", school: "", difficulties: ["easy", "easy", "easy"]).obs;
  final _lastCorrectAnswers = 0.obs;
  final _levels = [DifficultyLevel.easy.obs, DifficultyLevel.easy.obs, DifficultyLevel.easy.obs];
  final _currentLevel = DifficultyLevel.easy.obs; // Agregar _currentLevel
  final _currentOperation = "".obs; // Nuevo atributo para la operación actual
  Rx<User> get user => _user;
  int get lastCorrectAnswers => _lastCorrectAnswers.value;
  List<Rx<DifficultyLevel>> get levels => _levels;
  
  DifficultyLevel get currentLevel => _currentLevel.value; // Agregar getter para currentLevel
  String get currentOperation => _currentOperation.value; // Nuevo getter para la operación actual

  void updateUser(User user){
    _user.value = user;
  }


  void updateCorrectAnswers(int lastCorrectAnswers) {
    _lastCorrectAnswers.value = lastCorrectAnswers;
  }

  void updateLevels(List<dynamic> levels) {
    switch(levels[0]){
      case "easy":
        _levels[0].value = DifficultyLevel.easy;
        break;
      case "intermediate":
        _levels[0].value = DifficultyLevel.intermediate;
        break;
      case "difficult":
        _levels[0].value = DifficultyLevel.difficult;
        break;
    }
    switch(levels[1]){
      case "easy":
        _levels[1].value = DifficultyLevel.easy;
        break;
      case "intermediate":
        _levels[1].value = DifficultyLevel.intermediate;
        break;
      case "difficult":
        _levels[1].value = DifficultyLevel.difficult;
        break;
    }
    switch(levels[2]){
      case "easy":
        _levels[2].value = DifficultyLevel.easy;
        break;
      case "intermediate":
        _levels[2].value = DifficultyLevel.intermediate;
        break;
      case "difficult":
        _levels[2].value = DifficultyLevel.difficult;
        break;
    }
  }	

  void updateCurrentLevel(DifficultyLevel level) { // Agregar método para actualizar currentLevel
    _currentLevel.value = level;
    switch(_currentOperation.value){
      case "Suma":
        _levels[0].value = _currentLevel.value;
        break;
      case "Multiplicación":
        _levels[1].value = _currentLevel.value;
        break;
      case "Resta":
        _levels[2].value = _currentLevel.value;
        break;
    }
  }

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
