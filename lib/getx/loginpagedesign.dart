import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'loginpagegetx.dart';

class Loginpagedesign extends StatefulWidget {
  const Loginpagedesign({super.key});

  @override
  State<Loginpagedesign> createState() => _LoginpagedesignState();
}

class _LoginpagedesignState extends State<Loginpagedesign> {
  final Loginpagegetx authController = Get.put(Loginpagegetx());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Login",
              style: TextStyle(color: Colors.blueAccent, fontSize: 20),
            ),
            Obx(
              () => TextField(
                controller: authController.gmailcontroller,
                decoration: InputDecoration(
                    hintText: "username",
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black)),
                    errorText: authController.isEmailValid.value
                        ? null
                        : "Enter a valid email"),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(
              () => TextField(
                controller: authController.passwordcontroller,
                decoration: InputDecoration(
                    hintText: "username",
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black)),
                    errorText: authController.isPasswordValid.value
                        ? null
                        : "Enter a valid Password"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
