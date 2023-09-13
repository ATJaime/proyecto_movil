import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'select_page.dart';
import 'controllers/controller.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    MyController controller = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Usuario'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(labelText: 'Nombre'),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Grado'),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Usuario'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.to(() => const SelectPage());
                // Aquí puedes manejar la lógica de registro del usuario

                // Por ejemplo, puedes imprimir los valores ingresado

                // Puedes realizar la lógica de registro aquí

                // Y luego, si el registro es exitoso, puedes navegar a otra página
                // Navigator.pushReplacement(context, MaterialPageRoute(
                //   builder: (context) => MyHomePage(),
                // ));
              },
              child: const Text('Registrarse'),
            ),
          ],
        ),
      ),
    );
  }
}
