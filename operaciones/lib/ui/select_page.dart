import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:operaciones/ui/controllers/controller.dart';
import 'test_page.dart';

class SelectPage extends StatelessWidget {
  const SelectPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    MyController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seleccione Dificultad'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(200.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FloatingActionButton(
                  onPressed: () {
                    Get.to(() => TestPage());
                  },
                  child: const Text("Fácil")),
              FloatingActionButton(
                  onPressed: () {
                    Get.to(() => TestPage());
                  },
                  child: const Text("Medio")),
              FloatingActionButton(
                  onPressed: () {
                    Get.to(() => TestPage());
                  },
                  child: const Text("Difícil"))
            ],
          )),
    );
  }
}
