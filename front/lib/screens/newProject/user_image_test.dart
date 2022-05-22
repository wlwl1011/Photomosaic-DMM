import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:front/constants/color_constant.dart';
import 'package:front/controller/main_controller.dart';
import 'package:front/screens/history/main/main_screen.dart';
import 'package:front/screens/newProject/Ad_screen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/src/multipart_file.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
//import 'package:dio/dio.dart';

class UserImageTest extends StatefulWidget {
  UserImageTest({Key? key}) : super(key: key);

  @override
  State<UserImageTest> createState() => _UserImageTestState();
}

class _UserImageTestState extends State<UserImageTest> {
  var targetImage = Get.arguments;
  var photomosaicImage;
  List<XFile> _userImages = [];
  final ImagePicker _picker = ImagePicker();
  List<Asset> resultList = <Asset>[];
  List<Asset> imageList = <Asset>[];

  Future selectImage() async {
    if (_userImages != null) {
      _userImages.clear();
    }
    try {
      resultList = await MultiImagePicker.pickImages(maxImages: 1000);
      setState(() {
        if (resultList.isNotEmpty) {
          imageList = resultList;
          print(imageList);
        } else {
          print('no image select');
        }
      });
    } catch (e) {
      print(e);
    }
  }

  void uploadImage() async {
    FormData _formData;

    if (_userImages.isEmpty) {
      //오류 다이얼로그 띄우기 (여러장 선택하세요)
    } else {
      // final List<MultipartFile> _files = _userImages
      //     .map((img) => MultipartFile.fromFileSync(img.path,
      //         contentType: MediaType("image", "jpg")))
      //     .toList();
      // _formData = FormData(Map.from({"file": _files}));
      // MultiImagePicker();
    }
  }

  Widget _imageTestBodyWidget() {
    return SingleChildScrollView(
      child: Container(
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
                height: 15,
                width: MediaQuery.of(context).size.width,
              ),
              const Text(
                "Test Screen",
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
              imageList.isEmpty
                  ? Container()
                  : Container(
                      height: 400,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: imageList.length,
                          itemBuilder: (BuildContext context, int index) {
                            Asset asset = imageList[index];
                            return AssetThumb(
                                asset: asset, width: 300, height: 300);
                          })),
              const SizedBox(
                height: 55,
              ),
              ElevatedButton.icon(
                onPressed: () async {
                  photomosaicImage = targetImage;
                  selectImage();
                  // final ImagePicker _picker = ImagePicker();
                  // final List<XFile>? images = await _picker.pickMultiImage(
                  //   imageQuality: 30,
                  // );
                },
                icon: const Icon(
                  Icons.photo_library,
                ),
                style: ElevatedButton.styleFrom(primary: kHotpink),
                label: const Text("Upload Images"),
              ),
            ]),
      ),
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
      body: _imageTestBodyWidget(),
    );
  }
}
