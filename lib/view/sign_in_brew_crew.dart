import 'package:flutter/material.dart';
import 'package:healthy_harvest/services/auth.dart';

class Brew extends StatefulWidget {
  const Brew({super.key});

  @override
  State<Brew> createState() => _BrewState();
}

class _BrewState extends State<Brew> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Brew crew"),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: ElevatedButton(
              onPressed: () async {
                dynamic result = await _auth.signInAnon();
                if (result == null) {
                  print("ERROR");
                } else {
                  print('Signed in');
                  print(result);
                }
              },
              child: Text("Sign in to Brew crew")),
        ),
      ),
    );
    ;
  }
}
