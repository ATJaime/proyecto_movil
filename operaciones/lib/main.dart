import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:operaciones/data_source/local_data_source.dart';
import 'package:operaciones/domain/repositories/repository.dart';
import 'package:operaciones/models/some_data_db.dart';
import 'package:operaciones/ui/central.dart';
import 'package:operaciones/domain/repositories/use_case/authentication_case.dart';
import 'package:operaciones/domain/repositories/use_case/user_case.dart';
import 'package:operaciones/ui/controllers/authentication.dart';
import 'package:operaciones/ui/controllers/user_controller.dart';
import 'ui/controllers/controller.dart';
import 'package:loggy/loggy.dart';

Future<List<Box>> _openBox() async{
  List<Box> boxList = [];
  await Hive.initFlutter();
  Hive.registerAdapter(SomeDataDbAdapter());
  boxList.add(await Hive.openBox('someData'));
  return boxList;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _openBox();
  Get.lazyPut<MyController>(() => MyController());
  Loggy.initLoggy(
    logPrinter: const PrettyPrinter(
      showColors: true,
    ),
  );

  Get.put(Repository());
  Get.put(LocalDataSource());
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
      title: 'Operaciones',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const Central(),
    );
  }
}