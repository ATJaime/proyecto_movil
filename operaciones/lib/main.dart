import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'ui/home.dart';
import 'ui/controllers/controller.dart';

void main() {
  Get.lazyPut<MyController>(() => MyController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Proyecto'),
    );
  }
}
