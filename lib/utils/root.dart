import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/controllers/authController.dart';
import 'package:pokedex/controllers/userController.dart';
import 'package:pokedex/screens/home_page.dart';
import 'package:pokedex/screens/login_page.dart';

class Root extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return GetX(
      initState: (_) async {
        Get.put<UserController>(UserController());
      },
      builder: (_) {
        if (Get.find<AuthController>().user?.uid != null) {
          return HomePage();
        } else {
          return LoginPage();
        }
      },
    );
  }
}