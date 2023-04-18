import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  var name = ''.obs;
  var email = ''.obs;
  var password = ''.obs;

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
      return "Please enter email";
    } else if (!EmailValidator.validate(value, true)) {
      return "Invalid Email ID";
    } else {
      return null;
    }
  }

  String? validateRegisterPassword(value) {
    if (value.length == 0) {
      return "Please enter Password";
    } else {
      return null;
    }
  }
}
