import 'package:flutter/material.dart';
import '../use_case/create_questions.dart';
import 'package:get/get.dart';
import 'test_page.dart';

class LevelSummaryPage extends StatelessWidget {
  final LevelSummary levelSummary;

  LevelSummaryPage({required this.levelSummary});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resumen del Nivel'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Resumen del Nivel',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Preguntas Correctas: ${levelSummary.correctAnswers}',
              style: TextStyle(fontSize: 18, color: Colors.green),
            ),
            SizedBox(height: 10),
            Text(
              'Preguntas Incorrectas:',
              style: TextStyle(fontSize: 18, color: Colors.red),
            ),
            for (var i = 0; i < levelSummary.incorrectOperations.length; i++)
              Column(
                children: [
                  Text(
                    levelSummary.incorrectOperations[i],
                    style: TextStyle(fontSize: 16, color: Colors.red),
                  ),
                ],
              ),
            SizedBox(height: 10),
            Text(
              'Respuestas Correctas:',
              style: TextStyle(fontSize: 18, color: Colors.green),
            ),
            for (var i = 0; i < levelSummary.correctOperations.length; i++)
              Column(
                children: [
                  Text(
                    levelSummary.correctOperations[i],
                    style: TextStyle(fontSize: 16, color: Colors.green),
                  ),
                ],
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.to(()=> TestPage());
              },
              child: Text('Continuar'),
            ),
          ],
        ),
      ),
    );
  }
}
