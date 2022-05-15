import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:front/constants/color_constant.dart';
import 'package:front/screens/history/main/main_screen.dart';
import 'package:front/screens/newProject/choose_page.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class TargetImageUpload extends StatefulWidget {
  const TargetImageUpload({Key? key}) : super(key: key);

  @override
  State<TargetImageUpload> createState() => _TargetImageUploadState();
}

class _TargetImageUploadState extends State<TargetImageUpload> {
  var albumImage;
  var cameraImage;

  Widget _targetImageUploadBodyWidget() {
    return Container(
      height: MediaQuery.of(context).size.height - 50,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              'assets/images/prolog_new_project_background_image.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 65,
              width: MediaQuery.of(context).size.width,
            ),
            const Text(
              "Upload Target Image",
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              constraints: const BoxConstraints(maxHeight: 250, maxWidth: 250),
              child: Image.asset(
                'assets/images/upload_photoimage.jpeg',
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            ElevatedButton.icon(
              onPressed: () async {
                var picker = ImagePicker();
                var image = await picker.pickImage(source: ImageSource.gallery);
                if (image != null) {
                  setState(() {
                    albumImage = File(image.path);
                  });
                  Get.to(ChoosePage(), arguments: albumImage);
                }
              },
              icon: const Icon(
                Icons.crop_original,
              ),
              style: ElevatedButton.styleFrom(
                  primary: kHotpink,
                  fixedSize: Size(MediaQuery.of(context).size.width * 0.27,
                      MediaQuery.of(context).size.height * 0.01)),
              label: const Text("Album"),
            ),
            const SizedBox(
              height: 5,
            ),
            ElevatedButton.icon(
              onPressed: () async {
                var picker = ImagePicker();
                var image = await picker.pickImage(source: ImageSource.camera);
                if (image != null) {
                  setState(() {
                    cameraImage = File(image.path);
                  });
                  Get.to(ChoosePage(), arguments: cameraImage);
                }
              },
              icon: const Icon(
                Icons.add_a_photo,
              ),
              style: ElevatedButton.styleFrom(
                  primary: kHotpink,
                  fixedSize: Size(MediaQuery.of(context).size.width * 0.27,
                      MediaQuery.of(context).size.height * 0.01)),
              label: const Text("Camera"),
            ),
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('MAKING',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w200)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.home,
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(16.5),
            onPressed: () async {
              final user = FirebaseAuth.instance.currentUser;
              print('hhhh');
              print(user);
              final userData = await FirebaseFirestore.instance
                  .collection('user')
                  .doc(user!.uid)
                  .get(); //현재 모든 유저의 데이터를 담음

              Get.to(() => mainScreen(
                    nickName: userData.data()!['userId'],
                  ));
            },
          )
        ],
      ),
      body: _targetImageUploadBodyWidget(),
    );
  }
}
