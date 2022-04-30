import 'package:flutter/material.dart';
import 'package:front/controller/select_theme_controller.dart';
import 'package:front/screens/history/main/main_screen.dart';
import 'package:front/screens/newProject/Ad_screen.dart';
import 'package:front/screens/newProject/create_new_project.dart';
import 'package:get/get.dart';
import 'package:front/constants/color_constant.dart';

class ServerImageUpload extends StatefulWidget {
  ServerImageUpload({Key? key}) : super(key: key);

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
      decoration: BoxDecoration(
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
              Text(
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
                padding: EdgeInsets.only(left: 0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    showThemeDialogPop();
                  },
                  icon: Icon(
                    Icons.fact_check,
                  ),
                  style: ElevatedButton.styleFrom(primary: kHotpink),
                  label: Text("Select Theme"),
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
      barrierColor: Color.fromARGB(120, 0, 0, 0),
      builder: (BuildContext context) {
        return StatefulBuilder(builder: ((context, setState) {
          return AlertDialog(
            backgroundColor: kBlackColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            title: Text(
              'Select Theme',
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
                            constraints:
                                BoxConstraints(maxHeight: 80, maxWidth: 80),
                            child: Image.asset(
                              'assets/images/flower_theme.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                          Text(
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
                          print('tree click');
                          color_controller.ChangeButtonColor(3);
                        });
                      },
                      child: Column(
                        children: [
                          Container(
                            constraints:
                                BoxConstraints(maxHeight: 80, maxWidth: 80),
                            child: Image.asset(
                              'assets/images/tree_theme.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                          Text(
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
                          color_controller.ChangeButtonColor(4);
                        });
                      },
                      child: Column(
                        children: [
                          Container(
                            constraints:
                                BoxConstraints(maxHeight: 80, maxWidth: 80),
                            child: Image.asset(
                              'assets/images/ocean_theme.png',
                              fit: BoxFit.contain,
                            ),
                          ),
                          Text(
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
                ],
              ),
            ),
            actions: [
              Center(
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      //포토모자이크 생성하는 함수
                      //생성한 포토모자이크 전달
                      photomosaicImage = targetImage;
                      Get.to(AdScreen(), arguments: photomosaicImage);
                    },
                    child: Text('Create Photomosaic'),
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
      body: _serverImageUploadBodyWidget(),
    );
  }
}
