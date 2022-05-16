import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_launcher_icons/constants.dart';
import 'package:flutter_svg/svg.dart';
import 'package:front/constants/color_constant.dart';
import 'package:front/constants/constatns.dart';
import 'package:front/controller/heart_controller.dart';
import 'package:front/controller/main_controller.dart';
import 'package:front/controller/shake_controller.dart';
import 'package:front/screens/history/main/main_screen.dart';
import 'package:front/screens/history/otherHistory/create_other_history_screen.dart';
import 'package:front/screens/newProject/prolog_new_project.dart';
import 'package:get/get.dart';
import 'package:shake/shake.dart';
import 'package:image_picker/image_picker.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'dart:io';

class CreateNewProject extends StatefulWidget {
  CreateNewProject({Key? key}) : super(key: key);

  @override
  State<CreateNewProject> createState() => _CreateNewProjectState();
}

class _CreateNewProjectState extends State<CreateNewProject> {
  // var photomosaicImage = Get.arguments;
  final String pid = Get.arguments as String;
  final shake_controller = Get.put(ShakeController());
  late ShakeDetector shakeaction;
  var blank = Image.asset('assets/images/empty_image.png');
  bool _isVisible = false;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    shakeaction = ShakeDetector.autoStart(onPhoneShake: () {
      //shake_controller.ShakeScreen();
      _isVisible = true;
      print('shaking');
      print(_isVisible);
      // setState(() {
      //   shake_controller.ShakeScreen();
      // });
    });
    super.initState();
  }

  Widget uploadImage(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (controller) {
        print("Build!!");
        return ElevatedButton.icon(
          onPressed: () async {
            // getImageFromGallery(controller, photomosaicImage),
            await controller.Save('photomosaic-$pid');
            showHotPostCreateDialogPop();
          },
          icon: const Icon(Icons.history),
          style: ElevatedButton.styleFrom(
              primary: kHotpink,
              fixedSize: Size(MediaQuery.of(context).size.width * 0.48,
                  MediaQuery.of(context).size.height * 0.01)),
          label: const Text("Save Image in history"),
        );
      },
    );
  }

  Widget _createNewProjectBodyWidget() {
    return Container(
      //height: MediaQuery.of(context).size.height - 50,
      width: double.infinity,

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
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
              // width: MediaQuery.of(context).size.width,
            ),
            const Text(
              "New Photomasaic!",
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
              // width: MediaQuery.of(context).size.width,
            ),
            Visibility(
              visible: true, //_isVisible,
              child: SizedBox(
                height: 250,
                child: Image.network(
                  'http://$serverAdr/api/v1/object?pid=photomosaic-$pid',
                ),
              ),
              // child: Container(
              //   height: 250,
              //   width: MediaQuery.of(context).size.width - 100,
              //   decoration: BoxDecoration(
              //     image: DecorationImage(
              //       image: FileImage(photomosaicImage),
              //       fit: BoxFit.contain,
              //     ),

              //     image: .image,
              //   ),
              // ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
              // width: MediaQuery.of(context).size.width,
            ),
            ElevatedButton.icon(
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
              icon: const Icon(
                Icons.add_circle,
              ),
              style: ElevatedButton.styleFrom(
                  primary: kHotpink,
                  fixedSize: Size(MediaQuery.of(context).size.width * 0.48,
                      MediaQuery.of(context).size.height * 0.01)),
              label: const Text("Create New Project"),
            ),
            const SizedBox(
              height: 2,
            ),

            ///////
            uploadImage(context),
            const SizedBox(
              height: 2,
            ),
            ElevatedButton.icon(
              onPressed: () {
                // String photo_path = photomosaicImage.path;
                // print('phtomosaic path > $photo_path');

                // GallerySaver.saveImage(photo_path).then((value) {
                //   print('>>>> save value = $value');
                //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                //     content: Text(
                //       'Download Success!',
                //       textAlign: TextAlign.center,
                //     ),
                //     duration: Duration(seconds: 3),
                //   ));
                // }).catchError((err) {
                //   print('error :$err');
                // });
              },
              icon: const Icon(
                Icons.save_alt,
              ),
              style: ElevatedButton.styleFrom(
                  primary: kHotpink,
                  fixedSize: Size(MediaQuery.of(context).size.width * 0.48,
                      MediaQuery.of(context).size.height * 0.01)),
              label: const Text("Download in Gallery"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Do you want to Share?',
                  style: TextStyle(
                    color: kWhiteColor,
                    fontSize: 14,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    showShareDialogPop();
                  },
                  icon: const Icon(
                    Icons.share,
                  ),
                  color: kWhiteColor,
                )
              ],
            ),
          ]),
    );
  }

  void showHotPostCreateDialogPop() {
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
              'Saved Image in History!',
              style: TextStyle(
                color: kWhiteColor,
                fontWeight: FontWeight.bold,
              ),
              //textAlign: TextAlign.center,
            ),
            content: SingleChildScrollView(
              child: Text(
                'Do you want to write a post on the hot post?',
                style: TextStyle(
                  color: kWhiteColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () async {
                      // final user = FirebaseAuth.instance.currentUser;
                      // print('hhhh');
                      // print(user);
                      // final userData = await FirebaseFirestore.instance
                      //     .collection('user')
                      //     .doc(user!.uid)
                      //     .get();
                      // Get.to(
                      //     CreateOtherHistoryScreen(
                      //       nickName: userData.data()!['userId'],
                      //     ),
                      //     arguments: photomosaicImage);
                      Get.to(CreateOtherHistoryScreen(), arguments: pid);
                    },
                    child: Text('Yes'),
                    style: TextButton.styleFrom(
                      primary: kHotpink,
                      textStyle: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text('No'),
                    style: TextButton.styleFrom(
                      primary: kWhiteColor,
                      textStyle: TextStyle(fontWeight: FontWeight.w300),
                    ),
                  ),
                ],
              )
            ],
          );
        }));
      },
    ).then((value) {
      setState(() {});
    });
  }

  void showShareDialogPop() {
    showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: const Color.fromARGB(120, 0, 0, 0),
      builder: (BuildContext context) {
        return StatefulBuilder(builder: ((context, setState) {
          return AlertDialog(
            backgroundColor: kBlackColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            title: const Text(
              'Share your Photomosaic',
              style: TextStyle(
                color: kWhiteColor,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            content: SingleChildScrollView(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 7,
                    child: Container(
                      width: double.infinity,
                      color: kTextColor,
                      child: const Padding(
                        padding: EdgeInsets.all(7.0),
                        child: Text(
                          'URL',
                          style: TextStyle(
                            color: kWhiteColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Flexible(
                      flex: 1,
                      child: IconButton(
                        onPressed: () {
                          //URL 카피
                        },
                        color: kWhiteColor,
                        icon: Icon(Icons.content_copy),
                      )),
                ],
              ),
            ),
          );
        }));
      },
    ).then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('CONGRATULATIONS!',
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
      body: _createNewProjectBodyWidget(),
    );
  }
}
