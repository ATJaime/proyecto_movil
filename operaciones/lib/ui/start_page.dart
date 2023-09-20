import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:operaciones/ui/controllers/controller.dart';
import 'test_page.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Obtener el controlador
    MyController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Selecciona la Dificultad'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Muestra el nombre desde el controlador
            Obx(() => Text("¡Hola, ${controller.name}!")),
            
            // Muestra el puntaje desde el controlador
            Obx(() => Text("Tu puntaje: ${controller.score}")),
            
            // Botón para iniciar el test
            ElevatedButton(
              onPressed: () {
                // Navegar a la página del test
                Get.to(() => TestPage());
              },
              child: Text("Iniciar Test"),
            ),
          ],
        ),
      ),
    );
  }
}

