import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import 'login.dart';
import 'register.dart';

class AuthView extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.activePage == AuthPages.LOGIN
          ? login(controller)
          : register(controller);
    });
  }
}
