import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:operaciones/ui/controllers/authentication.dart';
import 'package:loggy/loggy.dart';
import 'controllers/controller.dart';
import 'start_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage> {
    final _formKey = GlobalKey<FormState>();
    final nameController = TextEditingController();
    final gradeController = TextEditingController();
    final schoolController = TextEditingController();
    MyController controller = Get.find();
    AuthenticationController authenticationController = Get.find();

    

  
  _login(theName, theGrade, theSchool) async {
    logInfo('_login $theName $theGrade $theSchool');
    try {
      await authenticationController.login(theName, theGrade, theSchool);
      Get.to(() => const StartPage());

        String name = nameController.text;
        String grade = gradeController.text;
        String school = schoolController.text;

        controller.updateName(name);
        controller.updateGrade(grade);
        controller.updateSchool(school);
      }
     catch (err) {
      Get.snackbar(
        "Login",
        err.toString(),
        icon: const Icon(Icons.person, color: Colors.red),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Usuario'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Nombre'),
              validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Ingrese nombre";
                        }
                        return null;
                      },
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: gradeController,
              decoration: const InputDecoration(labelText: 'Grado'),
              validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Ingrese grado";
                        }
                        return null;
                      },
              
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: schoolController,
              decoration: const InputDecoration(labelText: 'Instituto'),
              validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Ingrese Instituto";
                        }
                        return null;
                      },
              
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                FocusScope.of(context).requestFocus(FocusNode());
                          final form = _formKey.currentState;
                          form!.save();
                          if (_formKey.currentState!.validate()) {
                            await _login(
                                nameController.text, gradeController.text, schoolController.text);
                          }
              },
              child: const Text('Registrarse'),
            ),
          ],
        ),
      ),
    );
  }
}
