import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jomeat/data/repositories/auth/auth_repository.dart';
import 'package:jomeat/ui/presentations/main/main_screen.dart';

class SigninController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final AuthRepository _repository;

  SigninController(this._repository);

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void onSubmitClicked() async {
    final auth = await _repository.signIn(
      emailController.text,
      passwordController.text
    );

    Get.offAllNamed(MainScreen.routeName);
  }
}