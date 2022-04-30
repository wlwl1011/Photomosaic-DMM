import 'dart:io';

import 'package:flutter/material.dart';
import 'package:front/constants/color_constant.dart';
import 'package:front/screens/history/main/main_screen.dart';
import 'package:front/screens/newProject/choose_page.dart';
import 'package:front/screens/newProject/prolog_new_project.dart';
import 'package:front/screens/newProject/server_image_upload.dart';
import 'package:front/screens/newProject/user_image_upload.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';

class TargetImageUpload extends StatefulWidget {
  TargetImageUpload({Key? key}) : super(key: key);

  @override
  State<TargetImageUpload> createState() => _TargetImageUploadState();
}

class _TargetImageUploadState extends State<TargetImageUpload> {
  var albumImage;
  var cameraImage;

  Widget _targetImageUploadBodyWidget() {
    return Container(
      height: MediaQuery.of(context).size.height - 50,
      decoration: BoxDecoration(
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
            Text(
              "Upload Target Image",
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              constraints: BoxConstraints(maxHeight: 250, maxWidth: 250),
              child: Image.asset(
                'assets/images/upload_photoimage.jpeg',
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
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
              icon: Icon(
                Icons.crop_original,
              ),
              style: ElevatedButton.styleFrom(primary: kHotpink),
              label: Text("Album"),
            ),
            SizedBox(
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
              icon: Icon(
                Icons.add_a_photo,
              ),
              style: ElevatedButton.styleFrom(primary: kHotpink),
              label: Text("Camera"),
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
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            padding: EdgeInsets.all(16.5),
            onPressed: () {
              Get.to(mainScreen());
            },
          )
        ],
      ),
      body: _targetImageUploadBodyWidget(),
    );
  }
}
