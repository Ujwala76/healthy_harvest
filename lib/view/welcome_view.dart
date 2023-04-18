import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class welcomeView extends StatelessWidget {
  welcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: getImageAsset()),
    );
  }
}

Widget getImageAsset() {
  AssetImage assetImage = AssetImage('assets/images/welcome_page.png');
  Image image = Image(
    image: assetImage,
    width: 200.0,
    height: 200.0,
  );
  return Container(
    child: image,
  );
}
