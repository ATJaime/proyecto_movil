import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:operaciones/ui/controllers/controller.dart';
import 'test_page.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seleccione Dificultad'),
      ),
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Obx(() => Text("Hola ${controller.name}")),
          Obx(() => Text("Tu puntaje ${controller.score}")),
          FloatingActionButton(
              onPressed: () {
                Get.to(() => TestPage());
              },
              child: const Text("Iniciar")),
        ],
      )),
    );
  }
}
