import 'package:flutter/material.dart';
import 'package:front/screens/history/main/main_screen.dart';
import 'package:get/get.dart';

class UserImageUpload extends StatefulWidget {
  UserImageUpload({Key? key}) : super(key: key);

  @override
  State<UserImageUpload> createState() => _UserImageUploadState();
}

class _UserImageUploadState extends State<UserImageUpload> {
  var targetImage = Get.arguments;

  Widget _userImageUploadBodyWidget() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Text("유저 이미지 업로드 화면"),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: FileImage(targetImage), fit: BoxFit.contain)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Create Photomosaic',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w100)),
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
