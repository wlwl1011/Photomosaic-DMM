import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:front/screens/history/userHistory/components/radial_progress.dart';
import 'package:front/screens/history/userHistory/components/rounded_image.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyInfo extends StatelessWidget {
  const MyInfo({required this.nickName, Key? key}) : super(key: key);
  final String nickName;

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

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
            imagePath: user!.photoURL!,
            size: Size.fromWidth(70.0),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              nickName,
            ),
          ],
        ),
      ],
    );
  }
}
