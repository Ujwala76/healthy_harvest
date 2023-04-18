import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class LeafView extends StatelessWidget {
  const LeafView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Leaf Disease Detection"),
        backgroundColor: const Color.fromARGB(255, 28, 189, 13),
      ),
      body: Form(
          child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Center(
              child: Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.3,
                      bottom: MediaQuery.of(context).size.height * 0.03),
                  child: const Text(
                    "Leaf Disease Detection",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )),
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  elevation: 3.0,
                  backgroundColor: Colors.grey[100],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: const BorderSide(
                        width: 1.5, color: Color.fromARGB(255, 28, 189, 13)),
                  )),
              onPressed: () {},
              icon: const Icon(
                // <-- Icon
                Icons.file_upload_outlined,
                size: 24.0,
                color: Colors.black,
              ),
              label: const Text(
                'Upload Image',
                style: TextStyle(color: Colors.black),
              ), // <-- Text
            ),
            Container(
              height: 20,
            ),
            UnconstrainedBox(
                child: SizedBox(
                    width: 110,
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
