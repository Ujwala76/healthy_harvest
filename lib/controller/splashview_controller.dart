import 'dart:async';
import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'package:healthy_harvest/view/login_view.dart';

class SplashViewController extends GetxController {
  void _navigateToHome() {
    Get.off(() => const LoginView());
  }

  _mockCheckForSession() {
    Timer(const Duration(seconds: 5), _navigateToHome);
  }

  @override
  void onInit() async {
    super.onInit();

    _mockCheckForSession();
  }
}
