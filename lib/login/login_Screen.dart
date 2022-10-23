import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 300,
        width: kIsWeb && Get.width > 600 ? Get.width * 0.5 : Get.width,
        child: TextFormField(),
      ),
    );
  }
}
