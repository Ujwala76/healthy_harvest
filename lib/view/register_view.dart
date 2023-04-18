import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:healthy_harvest/controller/register_controller.dart';
import 'package:healthy_harvest/view/home_view.dart';

class RegisterView extends StatelessWidget {
  RegisterController controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    // ignore: prefer_const_constructors
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register Page"),
        backgroundColor: const Color.fromARGB(255, 28, 189, 13),
      ),
      body: Form(
          key: controller.formkey,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.05),
                  child: const Text(
                    "Register",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.05),
                  child: TextFormField(
                      validator: controller.validateName,
                      //onSaved: ,
                      decoration: InputDecoration(
                        labelText: "Name",
                        floatingLabelStyle:
                            const TextStyle(color: Color.fromARGB(255, 28, 189, 13)),
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
                Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.02),
                  child: TextFormField(
                      controller: emailController,
                      validator: controller.validatRegisterEmail,
                      //onSaved: ,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "Email",
                        floatingLabelStyle:
                            const TextStyle(color: Color.fromARGB(255, 28, 189, 13)),
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
                Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.02),
                  child: TextFormField(
                      controller: passController,
                      validator: controller.validateRegisterPassword,
                      //onSaved: ,
                      decoration: InputDecoration(
                        labelText: "Password",
                        floatingLabelStyle:
                            const TextStyle(color: Color.fromARGB(255, 28, 189, 13)),
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
                Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.02),
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
                  onPressed: () {
                    FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: emailController.text,
                            password: passController.text)
                        .then((value) {
                      print("Account created");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeView()));
                    }).onError((error, stackTrace) {
                      print("Error ${error.toString()}");
                    });
                  },
                  child: const Text(
                    "Register",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        textBaseline: TextBaseline.alphabetic,
                        color: Color.fromARGB(255, 12, 7, 7)),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
