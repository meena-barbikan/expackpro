import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Loginpagegetx extends GetxController {
  var gmailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var isConfirmPasswordcontroller = TextEditingController();

  var isEmailValid = true.obs;
  var isPasswordValid = true.obs;
  var isConfirmPasswordValid = true.obs;

  void Login() {
    String email = gmailcontroller.text;
    String passsword = passwordcontroller.text;

    if (email.isEmpty || !email.isEmail) {
      isEmailValid.value = false;
    } else {
      isEmailValid.value = true;
    }
    if (passsword.isEmpty || passsword.length < 6) {
      isPasswordValid.value = false;
    } else {
      isPasswordValid.value = true;
    }

    if (isEmailValid.value &&
        isPasswordValid.value &&
        email == "meena@gmail.com") {
      Get.snackbar("Login", "Logged In Success",
          colorText: Colors.green, backgroundColor: Colors.green);
    } else {
      Get.snackbar("Login", "Logged In Error",
          colorText: Colors.red, backgroundColor: Colors.red);
    }
  }

  void signUp() {
    String email = gmailcontroller.text;
    String passsword = passwordcontroller.text;
    String isconfirmPassword = isConfirmPasswordcontroller.text;
    if (email.isEmpty || !email.isEmail) {
      isEmailValid.value = false;
    } else {
      isEmailValid.value = true;
    }
    if (passsword.isEmpty || passsword.length < 6) {
      isPasswordValid.value = false;
    } else {
      isPasswordValid.value = true;
    }
    if (isconfirmPassword.isEmpty != passsword) {
      isConfirmPasswordValid.value = false;
    } else {
      isConfirmPasswordValid.value = true;
    }

    if (isEmailValid.value &&
        isPasswordValid.value &&
        isConfirmPasswordValid.value &&
        email == "meena@gmail.com") {
      Get.snackbar("SignUp", "SignUp  Success",
          colorText: Colors.green, backgroundColor: Colors.green);
    } else {
      Get.snackbar("SignUp", "SignUp In Error",
          colorText: Colors.red, backgroundColor: Colors.red);
    }
  }
}
