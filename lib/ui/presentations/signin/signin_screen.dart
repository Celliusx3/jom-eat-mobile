import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jomeat/ui/presentations/signin/controller/signin_controller.dart';
import 'package:jomeat/ui/widgets/full_width_button_widget.dart';
import 'package:jomeat/ui/widgets/edit_text_widget.dart';

class SigninScreen extends GetView<SigninController> {
  static const routeName = "/sign-in";
  const SigninScreen({Key? key}) : super(key: key);

  @override Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign in"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: EditText(
                        textInputType: TextInputType.emailAddress,
                        textEditingController: controller.emailController,
                        title: "Email",
                        placeholder: "Enter a valid email address"
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: EditText(
                        textEditingController: controller.passwordController,
                        title: "Password",
                        placeholder: "Enter your password"
                      )
                    ),
                  ],
                ),
              )
            ),
            FullWidthButton(
              buttonText: "Sign in",
              onClicked: () { controller.onSubmitClicked(); },
            )
          ],
        ),
      )
    );
  }
}
