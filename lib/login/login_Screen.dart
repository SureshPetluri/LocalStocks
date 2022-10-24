import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (controller) => ScaleTransition(
        scale: controller.scaleAnimation,
        child: AlertDialog(
          title: const Text('Login'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: controller.phoneController,
              ),
              TextFormField(
                controller: controller.otpController,
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                controller.phoneNumberVerification(
                    controller.phoneController.text);
              },
              child: const Text("Sent Code"),
            ),
            TextButton(
              child: const Text("Verify"),
              onPressed: () => controller
                  .signInWithPhoneAuthCredential(controller.otpController.text,context),
            ),
            TextButton(
              child: const Text("Close"),
              onPressed: () => controller.inToHomeLogIn(),
            ),
          ],
        ),
      ),
    );
  }
}

