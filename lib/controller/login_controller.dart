import 'dart:developer';

import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:healthy_harvest/services/auth.dart';

import '../view/home_view.dart';
import '../model/user_model.dart';

class LoginController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;
  var userlist = Users().obs;

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  var obsecureText = true.obs;

//validate email
  String? validateLoginEmail(value) {
    if (value.length == 0) {
      return 'Please Enter Email';
    } else if (!EmailValidator.validate(value)) {
      return "Invalid Email ID";
    } else {
      return null;
    }
  }

  //validate password
  String? validateLoginPassword(value) {
    if (value.length == 0) {
      return "Please Enter Password";
    } else {
      return null;
    }
  }

  //save email
  String? saveEmail(value) {
    email.value = value;
    return null;
  }

  String? savePassword(value) {
    password.value = value;
    return null;
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

  void validateInputs() async {
    if (formkey.currentState!.validate()) {
      waiting();
      formkey.currentState!.save();

      log("email" + email.value);
      log("pass" + password.value);

      signinwith(email.value, password.value).then((value) {
        Get.back();
        if (userlist.value.user != null) {
          Get.off(() => const HomeView());
        } else {
          Get.defaultDialog(
              title: "Error!",
              titleStyle: TextStyle(color: Color.fromARGB(255, 213, 0, 0)),
              content: const Text("Please check your Email and Password"),
              textCancel: "Close");
        }
      });
      formkey.currentState!.reset();

      /*FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: email.value, password: password.value)
          .then((value) {
        Get.offAll(() => const HomeView());
      });*/
    }
  }

  signinwith(String email, String pass) async {
    try {
      var res = await AuthService().signinwith(email, pass);
      if (res != null) {
        userlist.value = res;
      }
    } finally {
      print("Value got");
    }
  }
}
