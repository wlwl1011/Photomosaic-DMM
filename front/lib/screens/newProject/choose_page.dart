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
            onPressed: () {
              Get.to(mainScreen());
            },
          )
        ],
      ),
      body: _choosePageBodyWidget(),
    );
  }
}
