import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:operaciones/models/user.dart';
import 'package:operaciones/ui/controllers/user_controller.dart';
import '../ui/controllers/authentication.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _FirebaseSignUpState();
}

class _FirebaseSignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final controllerName = TextEditingController();
  final controllerGrade = TextEditingController();
  final controllerSchool = TextEditingController();
  final controllerPassword = TextEditingController();
  AuthenticationController authenticationController = Get.find();
  UserController userController = Get.find();

  _signup(theName, theGrade, theSchool, thePassword) async {
    try {
      await authenticationController.signUp(theName, thePassword);

      Get.snackbar(
        "Sign Up",
        'OK',
        icon: const Icon(Icons.person, color: Colors.red),
        snackPosition: SnackPosition.BOTTOM,
      );
      
      User user = User(
        name: theName,
        grade: theGrade,
        school: theSchool,
        difficulties: ["easy", "easy", "easy"] 
      );
      userController.addUser(user);
      
    } catch (err) {
      logError('SignUp error $err');
      Get.snackbar(
        "Sign Up",
        err.toString(),
        icon: const Icon(Icons.person, color: Colors.red),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
            child: Container(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Sign Up Information",
                          style: TextStyle(fontSize: 20),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.name,
                          controller: controllerName,
                          decoration:
                              const InputDecoration(labelText: "Name"),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              logError('SignUp validation empty name');
                              return "Enter name";
                            } 
                            return null;
                          },
                        ),
                        TextFormField(
                          keyboardType: TextInputType.name,
                          controller: controllerGrade,
                          decoration:
                              const InputDecoration(labelText: "Grade"),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              logError('SignUp validation empty grade');
                              return "Enter grade";
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          keyboardType: TextInputType.name,
                          controller: controllerSchool,
                          decoration:
                              const InputDecoration(labelText: "School"),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              logError('SignUp validation empty school');
                              return "Enter school";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: controllerPassword,
                          decoration:
                              const InputDecoration(labelText: "Password"),
                          keyboardType: TextInputType.number,
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter password";
                            } else if (value.length < 6) {
                              return "Password should have at least 6 characters";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextButton(
                            onPressed: () async {
                              final form = _formKey.currentState;
                              form!.save();
                              FocusScope.of(context).requestFocus(FocusNode());
                              if (_formKey.currentState!.validate()) {
                                logInfo('SignUp validation form ok');
                                await _signup(controllerName.text,
                                    controllerGrade.text,
                                    controllerSchool.text,
                                    controllerPassword.text);
                              } else {
                                logError('SignUp validation form nok');
                              }
                            },
                            child: const Text("Submit")),
                      ]),
                ))));
  }
}
