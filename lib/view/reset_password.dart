import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reset Password"),
        backgroundColor: const Color.fromARGB(255, 28, 189, 13),
      ),
      body: Form(
          child: Padding(
              padding: EdgeInsets.all(30.0),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.02),
                    child: TextFormField(
                      //validator: ,
                      //onSaved: ,
                      decoration: InputDecoration(
                          labelText: "New Password",
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
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.02),
                    child: TextFormField(
                      //validator: ,
                      //onSaved: ,
                      decoration: InputDecoration(
                          labelText: "Confirm Password",
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
                    ),
                  ),
                  Container(
                    height: 30,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 3.0,
                      backgroundColor: Colors.grey[100],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(
                            width: 1.5,
                            color: Color.fromARGB(255, 28, 189, 13)),
                      ),
                      padding: const EdgeInsets.only(
                          right: 100.0, left: 100.0, top: 10.0, bottom: 10.0),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const ResetPassword();
                      }));
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
              ))),
    );
  }
}
