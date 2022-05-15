import 'package:firebase_auth/firebase_auth.dart';
import 'package:front/screens/history/userHistory/components/radial_progress.dart';
import 'package:front/screens/history/userHistory/components/rounded_image.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyInfo extends StatelessWidget {
  const MyInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    String image;
    if (user!.photoURL == 'assets/images/userImageDefault.jpg') {
      image = 'assets/images/userImageDefault.jpg';
    } else {
      image = user.photoURL!;
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: Get.height * 0.1,
        ),
        RadialProgress(
          width: 4,
          goalCompleted: 0.9,
          child: RoundedImage(
            imagePath: image,
            size: Size.fromWidth(70.0),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              "Anne Grethe",
            ),
          ],
        ),
      ],
    );
  }
}
