import 'package:flutter/material.dart';
import 'package:operaciones/ui/central.dart';
import 'package:operaciones/ui/controllers/controller.dart';
import 'package:operaciones/ui/controllers/user_controller.dart';
import 'package:operaciones/ui/start_page.dart';
import '../domain/repositories/use_case/create_questions.dart';
import 'package:get/get.dart';
import 'test_page.dart';

class LevelSummaryPage extends StatelessWidget {
  final LevelSummary levelSummary;

  LevelSummaryPage({super.key, required this.levelSummary});
  MyController controller = Get.find();
  UserController userController = Get.find();
  @override
  Widget build(BuildContext context) {
    userController.updateUser(controller.user.value);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resumen del Nivel'),
        actions: [IconButton(onPressed: () {Get.off(() => const Central());}, icon: const Icon(Icons.home))]
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Resumen del Nivel',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              'Preguntas Correctas: ${levelSummary.correctAnswers}',
              style: const TextStyle(fontSize: 18, color: Colors.green),
            ),
            const SizedBox(height: 10),
            const Text(
              'Preguntas Incorrectas:',
              style: TextStyle(fontSize: 18, color: Colors.red),
            ),
            for (var i = 0; i < levelSummary.incorrectOperations.length; i++)
              Column(
                children: [
                  Text(
                    levelSummary.incorrectOperations[i],
                    style: const TextStyle(fontSize: 16, color: Colors.red),
                  ),
                ],
              ),
            const SizedBox(height: 10),
            const Text(
              'Respuestas Correctas:',
              style: TextStyle(fontSize: 18, color: Colors.green),
            ),
            for (var i = 0; i < levelSummary.correctOperations.length; i++)
              Column(
                children: [
                  Text(
                    levelSummary.correctOperations[i],
                    style: const TextStyle(fontSize: 16, color: Colors.green),
                  ),
                ],
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                 final snackBar = SnackBar(
                content: Text('Dificultad ajustada a: ${controller.currentLevel.toString().split('.').last}'),
                duration: const Duration(seconds: 3), // Duración del mensaje flotante
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);

                Get.to(() => TestPage());
              },
              child: const Text('Continuar'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Reinicia los valores necesarios en MyController antes de regresar a StartPage
                controller.updateCurrentLevel(DifficultyLevel.easy);
                controller.updateCorrectAnswers(0);

                // Regresa a StartPage
                Obx(() => const StartPage());
              },
              child: const Text('Terminar y Empezar de Nuevo'),
            ),
          ],
        ),
      ),
    );
  }
}
