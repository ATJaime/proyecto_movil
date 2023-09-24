import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:operaciones/repositories/repository.dart';
import 'package:operaciones/ui/central.dart';
import 'package:operaciones/use_case/authentication_case.dart';
import 'package:operaciones/use_case/user_case.dart';
import 'package:operaciones/ui/controllers/authentication.dart';
import 'package:operaciones/ui/controllers/user_controller.dart';
import 'ui/controllers/controller.dart';
import 'package:loggy/loggy.dart';

void main() {
  Get.lazyPut<MyController>(() => MyController());
  Loggy.initLoggy(
    logPrinter: const PrettyPrinter(
      showColors: true,
    ),
  );

  Get.put(Repository());
  Get.put(AuthenticationUseCase());
  Get.put(UserUseCase());
  Get.put(AuthenticationController());
  Get.put(UserController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Central(),
    );
  }
}