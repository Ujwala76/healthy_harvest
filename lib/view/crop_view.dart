import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CropView extends StatefulWidget {
  const CropView({super.key});

  @override
  State<CropView> createState() => _CropViewState();
}

class _CropViewState extends State<CropView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crop Recommondation"),
        backgroundColor: Color.fromARGB(255, 28, 189, 13),
      ),
      body: Form(
          child: Padding(
        padding: EdgeInsets.all(30),
        child: ListView(
          children: <Widget>[
            Container(
                child: TextFormField(
                    decoration: InputDecoration(
              labelText: "N (Nitrogen)",
              floatingLabelStyle:
                  const TextStyle(color: Color.fromARGB(255, 28, 189, 13)),
              focusColor: const Color.fromARGB(255, 28, 189, 13),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 28, 189, 13),
                ),
              ),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
            ))),
            Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.02),
              child: TextFormField(
                //validator: ,
                //onSaved: ,
                decoration: InputDecoration(
                    labelText: "P Phosphorous",
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
                    labelText: "K (Potassium)",
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
                    labelText: "Temperature",
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
                    labelText: "Humidity",
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
                    labelText: "PH",
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
                    labelText: "Rainfall",
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
            UnconstrainedBox(
                child: SizedBox(
                    width: 120,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 3.0,
                            backgroundColor: Colors.grey[100],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                              side: const BorderSide(
                                  width: 1.5,
                                  color: Color.fromARGB(255, 28, 189, 13)),
                            )),
                        onPressed: () {},
                        child: Text(
                          "Submit",
                          style: TextStyle(color: Colors.black),
                        ))))
          ],
        ),
      )),
    );
  }
}
