import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:healthy_harvest/controller/login_controller.dart';
import 'package:healthy_harvest/view/home_view.dart';
import 'package:healthy_harvest/view/logo_image.dart';
import 'package:healthy_harvest/view/register_view.dart';
import 'package:healthy_harvest/view/welcome_view.dart';

import 'package:healthy_harvest/view/forgot_password.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController());

    //  TextEditingController emailController = TextEditingController();
    // TextEditingController passController = TextEditingController();
    return Scaffold(
        body: Form(
      key: controller.formkey,
      child: Padding(
        padding: EdgeInsets.all(30.0),
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.02),
            ),
            ImageView.getImageAsset(),
            Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.03),
              // ignore: prefer_const_constructors
              child: Text(
                "Login Now",
                // ignore: prefer_const_constructors
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.05),
              child: TextFormField(
                  //controller: emailController,
                  validator: controller.validateLoginEmail,
                  onSaved: controller.saveEmail,
                  decoration: InputDecoration(
                    labelText: "Email",
                    floatingLabelStyle: const TextStyle(
                        color: Color.fromARGB(255, 28, 189, 13)),
                    focusColor: const Color.fromARGB(255, 28, 189, 13),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 28, 189, 13),
                      ),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                  )),
            ),
            Obx(
              () => Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.02),
                  child: TextFormField(
                    //controller: passController,
                    keyboardType: TextInputType.text,
                    validator: controller.validateLoginPassword,
                    onSaved: controller.savePassword,
                    decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: controller.changeObsecureText,
                          child: Icon(
                            controller.obsecureText.value == true
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: const Color.fromARGB(255, 28, 189, 13),
                          ),
                        ),
                        labelText: "Password",
                        floatingLabelStyle: const TextStyle(
                            color: Color.fromARGB(255, 28, 189, 13)),
                        focusColor: const Color.fromARGB(255, 28, 189, 13),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 28, 189, 13),
                          ),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                    obscureText: controller.obsecureText.value,
                  )),
            ),
            Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.03),
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const ForgotPassView();
                      }));
                    },
                    child: Container(
                      // ignore: prefer_const_constructors
                      child: Text(
                        "forgot password",
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 28, 189, 13)),
                      ),
                    ))),
            Container(
              height: 30.0,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 3.0,
                backgroundColor: Colors.grey[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: const BorderSide(
                      width: 1.5, color: Color.fromARGB(255, 28, 189, 13)),
                ),
                padding: const EdgeInsets.only(
                    right: 100.0, left: 100.0, top: 10.0, bottom: 10.0),
              ),
              onPressed: controller.validateInputs
              /*  FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                        email: emailController.text,
                        password: passController.text)
                    .then((value) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const HomeView();
                  }));
                }).onError((error, stackTrace) {
                  print("Error ${error.toString()}");
                });*/
              ,
              child: const Text(
                "Login",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    textBaseline: TextBaseline.alphabetic,
                    color: Color.fromARGB(255, 12, 7, 7)),
              ),
            ),
            Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.05),
                child: RichText(
                  // ignore: prefer_const_constructors
                  textAlign: TextAlign.center,

                  // ignore: prefer_const_constructors
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: const TextStyle(color: Colors.black, fontSize: 15),
                    // ignore: prefer_const_literals_to_create_immutables
                    children: <TextSpan>[
                      // ignore: prefer_const_constructors
                      TextSpan(
                          text: ' Register now!',
                          style: const TextStyle(
                            color: Color.fromARGB(255, 28, 189, 13),
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return RegisterView();
                              }));
                            }),
                    ],
                  ),
                ))
          ],
        ),
      ),
    ));
  }
}
