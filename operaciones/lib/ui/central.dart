import 'package:operaciones/ui/controllers/authentication.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:operaciones/ui/home.dart';
import 'package:operaciones/ui/start_page.dart';

class Central extends StatelessWidget {
  const Central({super.key});

  @override
  Widget build(BuildContext context) {
    AuthenticationController authenticationController = Get.find();
    return Obx(() => authenticationController.isLogged
        ? const MyHomePage()
        : const StartPage());
  }
}