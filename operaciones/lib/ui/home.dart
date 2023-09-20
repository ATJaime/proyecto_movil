import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'start_page.dart';
import 'controllers/controller.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final nameController = TextEditingController();
    final gradeController = TextEditingController();
    final userController = TextEditingController();
    MyController controller = Get.find();
     return Scaffold(
  appBar: AppBar(
    title: Text("Registro de Usuario"),
  ),
  body: SingleChildScrollView(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextFormField(
          controller: nameController,
          decoration: const InputDecoration(labelText: 'Nombre'),
        ),
        const SizedBox(height: 20),
        TextFormField(
          controller: gradeController,
          decoration: const InputDecoration(labelText: 'Grado'),
        ),
        const SizedBox(height: 20),
        TextFormField(
          controller: userController,
          decoration: const InputDecoration(labelText: 'Instituto'),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Get.to(() => const StartPage());

            // Aquí puedes manejar la lógica de registro del usuario
            String name = nameController.text;
            String grade = gradeController.text;
            String user = userController.text;

            controller.updateName(name);
            controller.updateGrade(grade);
            controller.updateUser(user);
          },
          child: const Text('Registrarse'),
        ),
      ],
    ),
  ),
);

  }
}
