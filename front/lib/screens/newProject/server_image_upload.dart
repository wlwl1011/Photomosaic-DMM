import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:front/controller/main_controller.dart';
import 'package:front/controller/select_theme_controller.dart';
import 'package:front/screens/history/main/main_screen.dart';
import 'package:front/screens/newProject/Ad_screen.dart';
import 'package:get/get.dart';
import 'package:front/constants/color_constant.dart';

class ServerImageUpload extends StatefulWidget {
  const ServerImageUpload({Key? key}) : super(key: key);

  @override
  State<ServerImageUpload> createState() => _ServerImageUploadState();
}

class _ServerImageUploadState extends State<ServerImageUpload> {
  var targetImage = Get.arguments;
  var photomosaicImage;
  String keyword = '';
  final color_controller = Get.put(SelectThemeController());
  final TextEditingController _textdelete = TextEditingController();

  Widget _serverImageUploadBodyWidget() {
    return Container(
      height: MediaQuery.of(context).size.height - 50,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              'assets/images/prolog_new_project_background_image.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 9,
                width: MediaQuery.of(context).size.width,
              ),
              const Text(
                "Enter Keyword For Tile Image",
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 12,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2.5,
                width: MediaQuery.of(context).size.width - 100,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: FileImage(targetImage), fit: BoxFit.contain)),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 11,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    showThemeDialogPop();
                  },
                  icon: const Icon(
                    Icons.fact_check,
                  ),
                  style: ElevatedButton.styleFrom(primary: kHotpink),
                  label: const Text("Select Theme"),
                ),
              ),
            ]),
      ),
    );
  }

  void showThemeDialogPop() {
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
              'Select Theme',
              style: TextStyle(
                color: kWhiteColor,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 1,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              print('flower click');
                              color_controller.ChangeButtonColor(2);
                            });
                          },
                          child: Column(
                            children: [
                              Container(
                                constraints: const BoxConstraints(
                                    maxHeight: 80, maxWidth: 80),
                                child: Image.asset(
                                  'assets/images/flower_theme.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                              const Text(
                                'Flower',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: kWhiteColor,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              print('sunset click');
                              color_controller.ChangeButtonColor(3);
                            });
                          },
                          child: Column(
                            children: [
                              Container(
                                constraints: const BoxConstraints(
                                    maxHeight: 80, maxWidth: 80),
                                child: Image.asset(
                                  'assets/images/sunset_theme.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                              const Text(
                                'Sunset',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: kWhiteColor,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              print('money click');
                              color_controller.ChangeButtonColor(4);
                            });
                          },
                          child: Column(
                            children: [
                              Container(
                                constraints: const BoxConstraints(
                                    maxHeight: 80, maxWidth: 80),
                                child: Image.asset(
                                  'assets/images/money_theme.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                              const Text(
                                'Money',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: kWhiteColor,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 1,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              print('tree click');
                              color_controller.ChangeButtonColor(5);
                            });
                          },
                          child: Column(
                            children: [
                              Container(
                                constraints: const BoxConstraints(
                                    maxHeight: 80, maxWidth: 80),
                                child: Image.asset(
                                  'assets/images/tree_theme.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                              const Text(
                                'Tree',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: kWhiteColor,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              print('ocean click');
                              color_controller.ChangeButtonColor(6);
                            });
                          },
                          child: Column(
                            children: [
                              Container(
                                constraints: const BoxConstraints(
                                    maxHeight: 80, maxWidth: 80),
                                child: Image.asset(
                                  'assets/images/ocean_theme.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                              const Text(
                                'Ocean',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: kWhiteColor,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              print('space click');
                              color_controller.ChangeButtonColor(7);
                            });
                          },
                          child: Column(
                            children: [
                              Container(
                                constraints: const BoxConstraints(
                                    maxHeight: 80, maxWidth: 80),
                                child: Image.asset(
                                  'assets/images/space_theme.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                              const Text(
                                'Space',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: kWhiteColor,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            actions: [
              Center(
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      //포토모자이크 생성하는 함수
                      //생성한 포토모자이크 전달
                      photomosaicImage = targetImage;

                      // send post message to create photomosaic
                      var controller = Get.find<MainController>();
                      Get.to(AdScreen(),
                          arguments: await controller.Upload(photomosaicImage));
                    },
                    child: const Text('Create Photomosaic'),
                    style: ElevatedButton.styleFrom(
                        primary: color_controller.themecolor),
                  ),
                ),
              ),
            ],
          );
        }));
      },
    ).then((value) {
      setState(() {
        color_controller.ChangeButtonColor(1);
      });
    });
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
      body: _serverImageUploadBodyWidget(),
    );
  }
}
