import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:healthy_harvest/view/reset_password.dart';

class ForgotPassView extends StatelessWidget {
  const ForgotPassView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailcontroller = TextEditingController();
    var _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password"),
        backgroundColor: Color.fromARGB(255, 28, 189, 13),
      ),
      body: Form(
          child: Padding(
        padding: EdgeInsets.all(30.0),
        child: ListView(
          children: <Widget>[
            /*Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.05),
              child: Text(
                "Forgot Password",
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),*/
            Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.05),
              child: TextFormField(
                  controller: emailcontroller,
                  validator: (value) {
                    value = emailcontroller.text;
                    if (value.isEmpty) {
                      return "Please Enter Email";
                    } else if (!EmailValidator.validate(value, true)) {
                      return "Invalid Email ID";
                    }
                  },
                  decoration: InputDecoration(
                    labelText: "Email",
                    floatingLabelStyle:
                        TextStyle(color: Color.fromARGB(255, 28, 189, 13)),
                    focusColor: Color.fromARGB(255, 28, 189, 13),
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
                  top: MediaQuery.of(context).size.height * 0.03),
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
                    .sendPasswordResetEmail(email: emailcontroller.text)
                    .then((value) => Navigator.of(context).pop());
              },
              child: const Text(
                "Submit",
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
