import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:healthy_harvest/view/crop_view.dart';
//import 'package:healthy_harvest/view/home_view.dart';
//import 'package:healthy_harvest/view/leaf_view.dart';
import 'package:healthy_harvest/view/login_view.dart';
import 'package:healthy_harvest/view/sign_in_brew_crew.dart';
import 'package:healthy_harvest/view/splash_view.dart';
//import 'package:healthy_harvest/view/logo_image.dart';
//import 'package:healthy_harvest/view/register_view.dart';
import '../view/welcome_view.dart';

import 'controller/splashview_controller.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}
