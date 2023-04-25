import 'dart:math';

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/auth.dart';
import '../view/home_view.dart';
import '../view/login_view.dart';

class RegisterController extends GetxController {
  var name = ''.obs;
  var email = ''.obs;
  var password = ''.obs;
  var autovalidate = false.obs;
  var obsecureText = true.obs;
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  String? validateName(value) {
    if (value.length == 0) {
      return "Please Enter Your Name";
    } else {
      return null;
    }
  }

  String? validatRegisterEmail(value) {
    if (value.length == 0) {
      return "Please Enter Email";
    } else if (!EmailValidator.validate(value, true)) {
      return "Invalid Email ID";
    } else {
      return null;
    }
  }

  String? saveName(value) {
    name.value = value;
  }

  String? saveEmail(value) {
    email.value = value;
  }

  String? savePassword(value) {
    password.value = value;
  }

  changeObsecureText() {
    if (obsecureText.value == true) {
      obsecureText.value = false;
    } else {
      obsecureText.value = true;
    }
  }

  waiting() {
    return Get.defaultDialog(
        title: "",
        content: WillPopScope(
            onWillPop: () async => false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: const <Widget>[
                CircularProgressIndicator(),
                Text("Loading...")
              ],
            )));
  }

  String? validateRegisterPassword(value) {
    if (value.length == 0 || value.length < 6) {
      return "Password must be at least 6 characters long.";
    } else {
      return null;
    }
  }

  void validateInputs() async {
    if (formkey.currentState!.validate()) {
      waiting();

      formkey.currentState!.save();

      debugPrint("Name :" + name.value);
      debugPrint("Email :" + email.value);
      debugPrint("Password :" + password.value);

      /*  UserCredential res = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: email.value, password: password.value);
      User? user = res.user;
      // ignore: deprecated_member_use
      // user!.updateDisplayName(name.value);
      debugPrint("Response of register");

      print(user);*/
      registerWithEmailAndPassword(name.value, email.value, password.value)
          .then((value) {
        Get.back();
        if (value == "Success") {
          Get.defaultDialog(
              title: "Success",
              titleStyle: const TextStyle(color: Colors.green),
              content: const Text("Registered Successfully!!!"),
              textCancel: "Close",
              onCancel: () {
                Get.off(() => HomeView());
              });
        } else {
          Get.defaultDialog(
              title: "Error!",
              titleStyle: TextStyle(color: Color.fromARGB(255, 213, 0, 0)),
              content: const Text("Please check your fields"),
              textCancel: "Close");
        }
      });
      formkey.currentState!.reset();
    }
  }

  registerWithEmailAndPassword(
      String name, String email, String password) async {
    try {
      var res = await AuthService()
          .registerWithEmailAndPassword(name, email, password);
      return res;
    } finally {
      print("Value got");
    }
  }
}
