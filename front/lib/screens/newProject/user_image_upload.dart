import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:front/constants/color_constant.dart';
import 'package:front/screens/history/main/main_screen.dart';
import 'package:front/screens/newProject/Ad_screen.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserImageUpload extends StatefulWidget {
  const UserImageUpload({Key? key}) : super(key: key);

  @override
  State<UserImageUpload> createState() => _UserImageUploadState();
}

class _UserImageUploadState extends State<UserImageUpload> {
  var targetImage = Get.arguments;
  var photomosaicImage = 0;
  List userImages = [];

  Widget _userImageUploadBodyWidget() {
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
              "Upload Your Photos For \nTile Image",
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              height: 250,
              width: MediaQuery.of(context).size.width - 100,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: FileImage(targetImage), fit: BoxFit.contain)),
            ),
            const SizedBox(
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
              icon: const Icon(
                Icons.photo_library,
              ),
              style: ElevatedButton.styleFrom(primary: kHotpink),
              label: const Text("Upload Images"),
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
      body: _userImageUploadBodyWidget(),
    );
  }
}
