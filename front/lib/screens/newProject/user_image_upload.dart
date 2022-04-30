import 'package:flutter/material.dart';
import 'package:front/constants/color_constant.dart';
import 'package:front/screens/history/main/main_screen.dart';
import 'package:front/screens/newProject/Ad_screen.dart';
import 'package:front/screens/newProject/create_new_project.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';

class UserImageUpload extends StatefulWidget {
  UserImageUpload({Key? key}) : super(key: key);

  @override
  State<UserImageUpload> createState() => _UserImageUploadState();
}

class _UserImageUploadState extends State<UserImageUpload> {
  var targetImage = Get.arguments;
  var photomosaicImage;
  List userImages = [];

  Widget _userImageUploadBodyWidget() {
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
              "Upload Your Photos For \nTile Image",
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              height: 250,
              width: MediaQuery.of(context).size.width - 100,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: FileImage(targetImage), fit: BoxFit.contain)),
            ),
            SizedBox(
              height: 55,
            ),
            ElevatedButton.icon(
              onPressed: () async {
                var picker = ImagePicker();
                List<XFile>? images = await picker.pickMultiImage();

                if (images != null) {
                  setState(() {
                    userImages = images;
                  });

                  //포토모자이크 생성
                  //생성한 포토모자이크 전달
                  photomosaicImage = targetImage;
                  Get.to(AdScreen(), arguments: photomosaicImage);
                }
              },
              icon: Icon(
                Icons.photo_library,
              ),
              style: ElevatedButton.styleFrom(primary: kHotpink),
              label: Text("Upload Images"),
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
      body: _userImageUploadBodyWidget(),
    );
  }
}
