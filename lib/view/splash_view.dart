import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:healthy_harvest/controller/splashview_controller.dart';

import 'logo_image.dart';

class SplashView extends StatelessWidget {
  SplashViewController controller = Get.put(SplashViewController());
  SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            // backgroundColor: Color.fromARGB(255, 169, 223, 164),
            body: Padding(
                padding: EdgeInsets.all(15),
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.125),
                      child: Center(
                          child: Container(
                        child: const Text(
                          '''        Wel-Come
               To
 “Healthy-Harvest” ''',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Color.fromARGB(255, 28, 189, 13)),
                        ),
                      )),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.09),
                      child: ImageView.getImageAsset(),
                    )
                  ],
                ))));
  }
}
