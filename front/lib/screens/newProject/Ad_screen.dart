import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:front/constants/color_constant.dart';
import 'package:front/controller/shake_controller.dart';
import 'package:front/screens/history/main/main_screen.dart';
import 'package:front/screens/newProject/create_new_project.dart';
import 'package:get/get.dart';
import 'package:shake/shake.dart';

class AdScreen extends StatefulWidget {
  AdScreen({Key? key}) : super(key: key);

  @override
  State<AdScreen> createState() => _AdScreenState();
}

class _AdScreenState extends State<AdScreen> {
  var photomosaicImage = Get.arguments;

  @override
  void initState() {
    SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
      showAdDialogPop();
    });
    super.initState();
  }

  void showAdDialogPop() {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Color.fromARGB(120, 0, 0, 0),
      builder: (BuildContext context) {
        return StatefulBuilder(builder: ((context, setState) {
          // Future.delayed(Duration(seconds: 3), () {
          //   Get.to(() => CreateNewProject(), arguments: photomosaicImage);
          // });
          return AlertDialog(
            backgroundColor: kBlackColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            content: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    IconButton(
                      onPressed: () {
                        print("........");
                        print(photomosaicImage);
                        Get.to(() => CreateNewProject(),
                            arguments: photomosaicImage);
                      },
                      icon: Icon(Icons.clear),
                      color: kWhiteColor,
                    ),
                  ]),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    'Too Cool For School',
                    style: TextStyle(
                      color: kWhiteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    constraints: BoxConstraints(maxHeight: 200, maxWidth: 200),
                    child: Image.asset(
                      'assets/images/too_cool.jpeg',
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
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
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w200)),
        centerTitle: true,
      ),
      body: Container(color: kBlackColor),
    );
  }
}
