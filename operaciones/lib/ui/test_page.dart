import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:operaciones/ui/controllers/controller.dart';
import '../use_case/create_questions.dart';
import './LevelSummaryPage.dart'; 

class TestPage extends StatefulWidget {
  

  @override
  _TestPageState createState() => _TestPageState();
}
MyController controller = Get.find();
class _TestPageState extends State<TestPage> {
  final TextEditingController resultController = TextEditingController();
  String currentOperation = "";
  LevelManager levelManager = LevelManager(); // Instancia de LevelManager
  bool finished =
      false; // Bandera para verificar si se ha finalizado el cuestionario
  bool isNegative = false;
  int tiempoRestante = 60 * 1000; // 60 segundos convertidos a milisegundos

  @override
  void initState() {
    super.initState();
    generateRandomOperation();
  }

  void generateRandomOperation() {
    setState(() {
      currentOperation =
          MathOperations.generateRandomOperation(controller.currentLevel, controller.currentOperation);
      resultController.text = "";
      
      
    });
  }

  // Método para alternar entre positivo y negativo
  void toggleNegative() {
    setState(() {
      isNegative = !isNegative;

      // Obtiene el valor actual del campo de entrada
      final currentValue = int.tryParse(resultController.text);

      // Cambia el valor entre positivo y negativo
      if (currentValue != null) {
        resultController.text =
            isNegative ? (-currentValue).toString() : currentValue.toString();
      }
    });
  }

  // Método para agregar un número al campo de entrada
  void _addToInput(String number) {
    setState(() {
      resultController.text += number;
    });
  }

  // Método para eliminar el último carácter del campo de entrada
  void _removeLastInput() {
    if (resultController.text.isNotEmpty) {
      setState(() {
        resultController.text = resultController.text
            .substring(0, resultController.text.length - 1);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test Page"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[


              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  currentOperation,
                  style: TextStyle(
                    fontSize: 36,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: const EdgeInsets.all(10.0),
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: TextField(
                  controller: resultController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Ingrese su respuesta',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  style: TextStyle(fontSize: 10),
                ),
              ),

              // Botones numéricos
              Column(
                children: [
                  for (int i = 1; i <= 9; i += 3)
                    Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  _addToInput(i.toString());
                                },
                                child: Text(i.toString()),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  _addToInput((i + 1).toString());
                                },
                                child: Text((i + 1).toString()),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  _addToInput((i + 2).toString());
                                },
                                child: Text((i + 2).toString()),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.0),
                      ],
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          _addToInput("0");
                        },
                        child: Text("0"),
                      ),
                      SizedBox(width: 10.0),
                      ElevatedButton(
                        onPressed: toggleNegative,
                        child: Text("+/-"),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          if (!finished) {
                            // Obtener la respuesta del usuario
                            final userAnswer = resultController.text;
                            
                            // Llamar al método generateNextQuestion y pasar el resultado del usuario
                            levelManager.almacenarQuestion(
                                userAnswer, currentOperation);


                            if (levelManager.totalQuestions >= 6) {
                              setState(() {
                                finished = true;
                                //
                                controller.updateCorrectAnswers(levelManager.correctAnswers);
                                controller.updateCurrentLevel(levelManager.getCurrentLevel(controller.lastCorrectAnswers, controller.currentLevel));
                                
                              });

                              // Navegar a la página de resumen cuando el cuestionario haya finalizado
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LevelSummaryPage(
                                    levelSummary: LevelSummary(
                                      correctAnswers:
                                          levelManager.correctAnswers,
                                      incorrectOperations:
                                          levelManager.incorrectOperations,
                                      correctOperations:
                                          levelManager.correctOperations,
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              // Generar la siguiente pregunta
                              generateRandomOperation();
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: finished ? Colors.red : Colors.orange,
                          padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10), // Aumentar el tamaño del botón
                        ),
                        child: Text(finished ? "Finalizar" : "Siguiente"),
                      ),
                      SizedBox(width: 10.0),
                      ElevatedButton(
                        onPressed: () {
                          if (!finished) {
                            // Borrar el último carácter del campo de entrada
                            _removeLastInput();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.grey,
                          padding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10), // Aumentar el tamaño del botón
                        ),
                        child: Text("Borrar"),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
