import 'package:flutter/material.dart';
import 'package:front/screens/history/main/main_screen.dart';
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
              // Padding(
              //   padding: EdgeInsets.fromLTRB(50, 0, 50, 20),
              //   child: Text(
              //     "If you want random image,\n don't type and press the button",
              //     style: TextStyle(color: Colors.white),
              //     textAlign: TextAlign.center,
              //   ),
              // ),
              // Container(
              //   width: MediaQuery.of(context).size.width - 100,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     children: <Widget>[
              //       Flexible(
              //         child: TextField(
              //           style: TextStyle(color: Colors.white),
              //           controller: _textdelete,
              //           decoration: InputDecoration(
              //             labelText: 'Keyword',
              //             hintText: 'Enter a Keyword',
              //             labelStyle: TextStyle(color: Colors.white),
              //             hintStyle: TextStyle(
              //               color: Colors.white.withOpacity(0.5),
              //             ),
              //             focusedBorder: OutlineInputBorder(
              //               borderRadius: BorderRadius.all(Radius.circular(10)),
              //               borderSide:
              //                   BorderSide(width: 1, color: Colors.white),
              //             ),
              //             enabledBorder: OutlineInputBorder(
              //               borderRadius: BorderRadius.all(Radius.circular(10)),
              //               borderSide:
              //                   BorderSide(width: 1, color: Colors.white),
              //             ),
              //             border: OutlineInputBorder(
              //               borderRadius: BorderRadius.all(Radius.circular(10)),
              //             ),
              //             suffixIcon: GestureDetector(
              //               child: const Icon(
              //                 Icons.cancel,
              //                 color: Colors.white,
              //                 size: 20,
              //               ),
              //               onTap: () {
              //                 _textdelete.clear();
              //               },
              //             ),
              //           ),
              //           keyboardType: TextInputType.emailAddress,
              //           onChanged: (text) {
              //             setState(() {
              //               keyword = text;
              //             });
              //           },
              //         ),
              //       ),
              //       // SizedBox(
              //       //   width: 15,
              //       // ),
              //       Padding(
              //         padding: EdgeInsets.only(left: 10),
              //         child: ElevatedButton.icon(
              //           onPressed: () {
              //             //포토모자이크 생성하는 함수
              //             //생성한 포토모자이크 전달
              //             photomosaicImage = targetImage;
              //             Get.to(CreateNewProject(),
              //                 arguments: photomosaicImage);
              //           },
              //           icon: Icon(
              //             Icons.edit,
              //           ),
              //           style: ElevatedButton.styleFrom(primary: kHotpink),
              //           label: Text("Create"),
              //         ),
              //       ),
              //       // IconButton(
              //       //   icon: Icon(Icons.arrow_circle_right),
              //       //   onPressed: () {
              //       //     //포토모자이크 생성하는 함수
              //       //     //생성한 포토모자이크 전달
              //       //     Get.to(CreateNewProject(), arguments: targetImage);
              //       //   },
              //       //   color: kHotpink,
              //       //   iconSize: 35,
              //       // ),
              //     ],
              //   ),
              // ),
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
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          title: Text('제목'),
          content: SingleChildScrollView(
            child: Column(),
          ),
          actions: [
            TextButton(
              onPressed: () {
                //포토모자이크 생성하는 함수
                //생성한 포토모자이크 전달
                photomosaicImage = targetImage;
                Get.to(CreateNewProject(), arguments: photomosaicImage);
              },
              child: Text('확인'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('MAKER',
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
