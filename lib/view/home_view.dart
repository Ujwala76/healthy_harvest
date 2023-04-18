import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:healthy_harvest/view/login_view.dart';

import 'crop_view.dart';
import 'leaf_view.dart';
import 'logo_image.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Healthy Harvest"),
        backgroundColor: const Color.fromARGB(255, 28, 189, 13),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                decoration: const BoxDecoration(
                    /* image: DecorationImage(
                    image: AssetImage("assets/images/download.jpg"),
                  ),*/
                    color: Color.fromARGB(255, 28, 189, 13)),
                child: Column(
                  children: [
                    Container(
                      height: 60.0,
                      width: 60.0,
                    ),
                    // ignore: prefer_const_constructors
                    Text(
                      "Healthy Harvest",
                      // ignore: prefer_const_constructors
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    )
                  ],
                )),
            // ignore: prefer_const_constructors
            ListTile(
              leading: const Icon(
                Icons.home,
                color: Color.fromARGB(255, 28, 189, 13),
              ),
              // ignore: prefer_const_constructors
              title: Text(
                "Home",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            // ignore: prefer_const_constructors
            ListTile(
              onTap: () {
                waiting();

                FirebaseAuth.instance.signOut().then((value) {
                  /* Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginView()));*/
                  Get.back();
                  Get.off(() => const LoginView());
                }).onError((error, stackTrace) {
                  print("Error ${error.toString()}");
                });
              },
              leading: const Icon(
                Icons.logout,
                color: Color.fromARGB(255, 28, 189, 13),
              ),
              // ignore: prefer_const_constructors
              title: Text(
                "Logout",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            )
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.05,
              ),
              child: ImageView.getImageAsset()),
          Container(
            height: 30,
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                elevation: 3.0,
                backgroundColor: Colors.grey[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: const BorderSide(
                      width: 1.5, color: Color.fromARGB(255, 28, 189, 13)),
                )),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return CropView();
              }));
            },
            icon: Image.asset(
              //        <-- Image
              'assets/images/crop_icon.png',
              height: 25,
              fit: BoxFit.cover,
            ),
            label: const Text(
              'Crop Recommondation',
              style: TextStyle(color: Colors.black),
            ), // <-- Text
          ),
          Container(
            height: 30,
          ),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
                elevation: 3.0,
                backgroundColor: Colors.grey[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: const BorderSide(
                      width: 1.5, color: Color.fromARGB(255, 28, 189, 13)),
                )),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return LeafView();
              }));
            },
            icon: Image.asset(
              //        <-- Image
              'assets/images/leaf_icon.png',
              height: 25,
              fit: BoxFit.cover,
            ),
            label: const Text(
              'Leaf Disease Detection',
              style: TextStyle(color: Colors.black),
            ), // <-- Text
          )
        ],
      ),
    );
  }
}

waiting() {
  return Get.defaultDialog(
      title: "",
      content: WillPopScope(
          onWillPop: () async => false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: const <Widget>[
              CircularProgressIndicator(),
              Text("Loading...")
            ],
          )));
}
