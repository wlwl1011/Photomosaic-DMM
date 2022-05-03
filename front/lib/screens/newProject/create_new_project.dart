import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:front/constants/color_constant.dart';
import 'package:front/controller/shake_controller.dart';
import 'package:front/screens/history/main/main_screen.dart';
import 'package:get/get.dart';
import 'package:shake/shake.dart';

class CreateNewProject extends StatefulWidget {
  CreateNewProject({Key? key}) : super(key: key);

  @override
  State<CreateNewProject> createState() => _CreateNewProjectState();
}

class _CreateNewProjectState extends State<CreateNewProject> {
  var photomosaicImage = Get.arguments;
  final shake_controller = Get.put(ShakeController());
  late ShakeDetector shakeaction;
  var blank = Image.asset('assets/images/empty_image.png');
  bool _isVisible = false;

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

  Widget _createNewProjectBodyWidget() {
    return Container(
      //height: MediaQuery.of(context).size.height - 50,

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
              height: MediaQuery.of(context).size.height * 0.12,
              width: MediaQuery.of(context).size.width,
            ),
            const Text(
              "Shake to Watch \nNew Photomasaic!",
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 25,
            ),
            Visibility(
              visible: true, //_isVisible,
              child: Container(
                height: 250,
                width: MediaQuery.of(context).size.width - 100,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: FileImage(photomosaicImage),
                        fit: BoxFit.contain)),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            ElevatedButton.icon(
              onPressed: () {
                Get.to(mainScreen());
              },
              icon: const Icon(
                Icons.add_circle,
              ),
              style: ElevatedButton.styleFrom(
                  primary: kHotpink,
                  fixedSize: Size(MediaQuery.of(context).size.width * 0.42,
                      MediaQuery.of(context).size.height * 0.01)),
              label: const Text("Create New Project"),
            ),
            const SizedBox(
              height: 3,
            ),
            ElevatedButton.icon(
              onPressed: () {
                //
              },
              icon: const Icon(
                Icons.save_alt,
              ),
              style: ElevatedButton.styleFrom(
                  primary: kHotpink,
                  fixedSize: Size(MediaQuery.of(context).size.width * 0.42,
                      MediaQuery.of(context).size.height * 0.01)),
              label: const Text("Save Image in history"),
            ),
            const SizedBox(
              height: 5,
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
                  icon: Icon(
                    Icons.share,
                  ),
                  color: kWhiteColor,
                )
              ],
            ),
          ]),
    );
  }

  void showShareDialogPop() {
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
                      child: Padding(
                        padding: const EdgeInsets.all(7.0),
                        child: Text(
                          'URL',
                          style: TextStyle(
                            color: kWhiteColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
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
            padding: EdgeInsets.all(16.5),
            onPressed: () {
              Get.to(mainScreen());
            },
          )
        ],
      ),
      body: _createNewProjectBodyWidget(),
    );
  }
}
