import 'dart:math';

enum DifficultyLevel {
  easy,
  intermediate,
  difficult,
}

class MathOperations {
  static String generateRandomOperation(DifficultyLevel level) {
    final random = Random();
    final maxNumber = level == DifficultyLevel.easy
        ? 10
        : level== DifficultyLevel.intermediate
            ? 50
            : 100; // Define los rangos de números según el nivel

    int num1 = random.nextInt(maxNumber + 1);
    int num2 = random.nextInt(maxNumber + 1);

    // Elige una operación aleatoria: suma, resta o multiplicación
    final operators = ['+', '-', '*'];
    final operator = operators[random.nextInt(operators.length)];

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

  DifficultyLevel getCurrentLevel() {
  if (correctAnswers == 5) {
    return DifficultyLevel.intermediate;
  } else if (correctAnswers >= 4) {
    return DifficultyLevel.difficult;
  } else {
    return DifficultyLevel.easy;
  }
}

  void almacenarQuestion(String userAnswer, String currentOperation) {
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
        correctOperations.add(currentOperation);
      } else {
        // Respuesta incorrecta, agregar la operación a incorrectOperations
        incorrectOperations.add(currentOperation);
      }
      totalQuestions++;
    } else {
      // Fin del nivel, genera un resumen
      final levelSummary = LevelSummary(
        correctAnswers: correctAnswers,
        incorrectOperations:
            incorrectOperations, // Agrega las operaciones incorrectas
        correctOperations: correctOperations,
      );
      levelSummaries.add(levelSummary);

      // Cambia de nivel si se cumplen tus condiciones de puntuación
      
       DifficultyLevel newLevel = getCurrentLevel();
       
       
      // Reinicia el contador de preguntas y la lista de operaciones incorrectas
      totalQuestions = 0;
      incorrectOperations = [];
      correctOperations = [];
      
    }

    

  }

  
   
}
