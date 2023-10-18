import 'dart:math';

import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:operaciones/models/user.dart';
import 'package:operaciones/ui/controllers/controller.dart';
import 'package:operaciones/ui/controllers/user_controller.dart';
enum DifficultyLevel {
  easy,
  intermediate,
  difficult,
}

UserController userController = Get.find();
MyController  controller = Get.find();

class MathOperations {
  static String generateRandomOperation(DifficultyLevel level, String operation) {
    final random = Random();
    final maxNumber = level == DifficultyLevel.easy
        ? 10
        : level== DifficultyLevel.intermediate
            ? 50
            : 100; // Define los rangos de números según el nivel
  
    int num1 = random.nextInt(maxNumber + 1);
    int num2 = random.nextInt(maxNumber + 1);

    final operators = ['+', '-', '*'];
    final operator;
    // Elige una operación aleatoria: suma, resta o multiplicación
    if (operation=="Resta"){
       operator= operators[1];
    }else if (operation=="Multiplicación"){
      operator= operators[2];
    }else {
      operator= operators[0];
    }
  
    

    return '$num1 $operator $num2';
  }
}

class LevelSummary {
  final int correctAnswers;
  final List<String> incorrectOperations;
  final List<String> correctOperations;

  LevelSummary({
    required this.correctAnswers,
    required this.incorrectOperations,
    required this.correctOperations,
  });
}

class LevelManager {
  int correctAnswers = 0;
  int totalQuestions = 0;
  List<LevelSummary> levelSummaries = [];
  List<String> incorrectOperations = [];
  List<String> correctOperations = [];

  DifficultyLevel getCurrentLevel(lastCorrectAnswers, DifficultyLevel previous) {

    switch (previous) {
      case DifficultyLevel.easy: 
        if (lastCorrectAnswers >= 5){
          return DifficultyLevel.intermediate;
        }else {
          return DifficultyLevel.easy;
        }
      case DifficultyLevel.intermediate:
        if (lastCorrectAnswers >= 5){
          return DifficultyLevel.difficult;
        }else if(lastCorrectAnswers <= 3){
          return DifficultyLevel.easy;
        }else{
          return DifficultyLevel.intermediate;
        }
      case DifficultyLevel.difficult:
        if(lastCorrectAnswers <= 3){
            return DifficultyLevel.intermediate;
          }else{
            return DifficultyLevel.difficult;
          }
    }
}

void updateDifficulty() {
      logInfo("----------------------------IMPORTANTE----------------------------");
      User user = controller.user.value;
      DifficultyLevel l1 = controller.levels[0].value;
      DifficultyLevel l2 = controller.levels[1].value;
      DifficultyLevel l3 = controller.levels[2].value;

      user.difficulties = [(l1 == DifficultyLevel.easy ? "easy" : l1 == DifficultyLevel.intermediate ? "intermediate" : "difficult"), 
      (l2 == DifficultyLevel.easy ? "easy" : l2 == DifficultyLevel.intermediate ? "intermediate" : "difficult"), 
      (l3 == DifficultyLevel.easy ? "easy" : l3 == DifficultyLevel.intermediate ? "intermediate" : "difficult")];

      controller.updateUser(user);
      userController.updateUser(user);
      userController.updateUserLocal(user);
      logInfo("----------------------------FIN----------------------------");
    }

  void almacenarQuestion(String userAnswer, String currentOperation, int time) {
    if (totalQuestions < 6) {
      // Obtener los componentes de la operación actual
      final operationParts = currentOperation.split(' ');
      final num1 = int.parse(operationParts[0]);
      final operator = operationParts[1];
      final num2 = int.parse(operationParts[2]);


      // Calcular la respuesta correcta en función del operador
      int correctAnswer = 0;
      if (operator == '+') {
        correctAnswer = num1 + num2;
      } else if (operator == '-') {
        correctAnswer = num1 - num2;
      } else if (operator == '*') {
        correctAnswer = num1 * num2;
      }

      // Verificar si la respuesta del usuario es correcta e incrementar correctAnswers si es necesario
      if (userAnswer == correctAnswer.toString()) {
        correctAnswers++;
        correctOperations.add("Operación: $currentOperation. \t Tiempo: ${time.toString()} ms.");
      } else {
        // Respuesta incorrecta, agregar la operación a incorrectOperations
        incorrectOperations.add("Operación: $currentOperation. \t Tiempo:  ${time.toString()} ms.");
      }
      totalQuestions++;
    }
    

  }

   
}  
