import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:front/constants/color_constant.dart';
import 'package:front/controller/main_controller.dart';
import 'package:front/screens/history/main/main_screen.dart';
import 'package:front/screens/newProject/Ad_screen.dart';
import 'package:front/screens/newProject/user_image_test.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class UserImageUpload extends StatefulWidget {
  const UserImageUpload({Key? key}) : super(key: key);

  @override
  State<UserImageUpload> createState() => _UserImageUploadState();
}

class _UserImageUploadState extends State<UserImageUpload> {
  var targetImage = Get.arguments;
  var photomosaicImage;
  List<Asset> resultList = <Asset>[];
  List<Asset> imageList = <Asset>[];

  void showImageLimitDialogPop() {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: const Color.fromARGB(120, 0, 0, 0),
      builder: (BuildContext context) {
        return StatefulBuilder(builder: ((context, setState) {
          return AlertDialog(
            backgroundColor: kBlackColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            title: const Text(
              'Count Error!',
              style: TextStyle(
                color: kWhiteColor,
                fontWeight: FontWeight.bold,
              ),
              //textAlign: TextAlign.center,
            ),
            content: const SingleChildScrollView(
              child: Text(
                'You must choose at least 200 pictures for tile images.',
                style: TextStyle(
                  color: kWhiteColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  //화면으로 돌아가기
                  Get.back();
                },
                child: Text('OK'),
                style: TextButton.styleFrom(
                  primary: kHotpink,
                  textStyle: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          );
        }));
      },
    ).then((value) {
      setState(() {});
    });
  }

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
                resultList = await MultiImagePicker.pickImages(maxImages: 1000);
                if (resultList.length < 200) {
                  showImageLimitDialogPop();
                } else {
                  if (resultList != null) {
                    photomosaicImage = targetImage;
                    var controller = Get.find<MainController>();
                    Get.to(AdScreen(),
                        arguments:
                            await controller.Upload(photomosaicImage, 'Ocean'));
                    setState(() {
                      imageList = resultList;
                    });
                  }
                  //포토모자이크 생성
                  //생성한 포토모자이크 전달
                }
              },
              icon: const Icon(
                Icons.photo_library,
              ),
              style: ElevatedButton.styleFrom(primary: kHotpink),
              label: const Text("Upload Images"),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              '※Choose at least 200 pictures ※',
              style: TextStyle(
                color: kBottomIcon,
                fontWeight: FontWeight.w400,
                fontSize: 10,
              ),
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
