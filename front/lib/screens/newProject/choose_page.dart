import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:front/screens/history/main/main_screen.dart';
import 'package:front/screens/newProject/server_image_upload.dart';
import 'package:front/screens/newProject/user_image_upload.dart';
import 'package:get/get.dart';
import 'package:front/constants/color_constant.dart';

class ChoosePage extends StatefulWidget {
  ChoosePage({Key? key}) : super(key: key);

  @override
  State<ChoosePage> createState() => _ChoosePageState();
}

class _ChoosePageState extends State<ChoosePage> {
  var targetImage = Get.arguments;

  Widget _choosePageBodyWidget() {
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
              "Choose How To Construct \nTile Image",
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
              onPressed: () {
                Get.to(UserImageUpload(), arguments: targetImage);
              },
              icon: Icon(
                Icons.photo_library,
              ),
              style: ElevatedButton.styleFrom(
                  primary: kHotpink,
                  fixedSize: Size(MediaQuery.of(context).size.width * 0.45,
                      MediaQuery.of(context).size.height * 0.01)),
              label: Text("Using User Image"),
            ),
            SizedBox(
              height: 5,
            ),
            ElevatedButton.icon(
              onPressed: () {
                Get.to(ServerImageUpload(), arguments: targetImage);
              },
              icon: Icon(
                Icons.backup,
              ),
              style: ElevatedButton.styleFrom(
                  primary: kHotpink,
                  fixedSize: Size(MediaQuery.of(context).size.width * 0.45,
                      MediaQuery.of(context).size.height * 0.01)),
              label: Text("Using Server Image"),
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
      body: _choosePageBodyWidget(),
    );
  }
}
