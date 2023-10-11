import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:operaciones/ui/controllers/controller.dart';
import 'package:operaciones/ui/controllers/user_controller.dart';
import 'test_page.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Obtener el controlador
    MyController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Selecciona la Operacion'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             Align(
              alignment: Alignment.topCenter, // Alineación en la parte superior del centro
              child: Container(
                padding: const EdgeInsets.all(20.0),
                margin: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const Text(
                  '¡Bienvenido al Test de Matemáticas!\n\n'
                  'El test consta de tres niveles: Fácil, Intermedio y Difícil. '
                  'Debes responder un número específico de preguntas correctas para avanzar al siguiente nivel. '
                  'También tienes un tiempo limitado para completar cada nivel. ¡Buena suerte!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
           
            // Muestra el nombre desde el controlador
            Obx(() => Text("¡Hola, ${controller.name}!")),
            
            // Muestra el puntaje desde el controlador
            Obx(() => Text("Tu puntaje: ${controller.score}")),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Navegar a la página del test de suma
                    controller.updateCurrentOperation("Suma");
                    Get.to(() => TestPage());
                  },
                  child: const Text("Suma"),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Navegar a la página del test de multiplicación
                    controller.updateCurrentOperation("Multiplicación");
                    Get.to(() => TestPage());
                  },
                  child: const Text("Multiplicación"),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Navegar a la página del test de resta
                    controller.updateCurrentOperation("Resta");
                    Get.to(() => TestPage());
                  },
                  child: const Text("Resta"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

