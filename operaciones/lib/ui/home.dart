import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:operaciones/ui/controllers/authentication.dart';
import 'package:loggy/loggy.dart';
import 'controllers/controller.dart';
import 'signup.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  final controllerName = TextEditingController();
  final controllerGrade = TextEditingController();
  final controllerSchool = TextEditingController();
  MyController controller = Get.find();
  AuthenticationController authenticationController = Get.find();

  _login(theName, theGrade, theSchool) async {
    logInfo('_login $theName $theGrade, $theSchool');
    try {
      await authenticationController.login(theName, theGrade, theSchool);
    } catch (err) {
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
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "",
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      controller: controllerName,
                      decoration:
                          const InputDecoration(labelText: "Nombre"),
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Ingrese nombre";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: controllerGrade,
                      decoration: const InputDecoration(labelText: "Grado"),
                      keyboardType: TextInputType.number,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Ingrese Grado";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: controllerSchool,
                      decoration: const InputDecoration(labelText: "Colegio"),
                      keyboardType: TextInputType.name,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Ingrese Colegio";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    OutlinedButton(
                        onPressed: () async {
                          // this line dismiss the keyboard by taking away the focus of the TextFormField and giving it to an unused
                          FocusScope.of(context).requestFocus(FocusNode());
                          final form = _formKey.currentState;
                          form!.save();
                          if (_formKey.currentState!.validate()) {
                            await _login(
                                controllerName.text, controllerGrade.text, controllerSchool.text);
                          }
                        },
                        child: const Text("Submit")),
                  ]),
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const SignUp()));
                },
                child: const Text("Create account"))
          ],
        ),
      ),
    );
  }
}