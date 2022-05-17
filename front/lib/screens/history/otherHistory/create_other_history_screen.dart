import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:front/constants/color_constant.dart';
import 'package:front/constants/constatns.dart';
import 'package:front/screens/history/main/main_screen.dart';
import 'package:front/screens/history/otherHistory/other_history_screen.dart';
import 'package:front/screens/newProject/create_new_project.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'components/avartar_widget.dart';

class CreateOtherHistoryScreen extends StatefulWidget {
  CreateOtherHistoryScreen({Key? key}) : super(key: key);
  //final String nickName;

  @override
  State<CreateOtherHistoryScreen> createState() =>
      _CreateOtherHistoryScreenState();
}

class _CreateOtherHistoryScreenState extends State<CreateOtherHistoryScreen> {
  var pid = Get.arguments;

  Widget _createOtherHistoryScreenBodyWidget() {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              margin: EdgeInsets.only(
                top: 10,
                bottom: 10,
              ),
              child: AvartarWidget(
                nickName: 'minzzl',
                //nickName: Text(widget.nickName),
                imagePath: "assets/images/profile.jpeg",
                size: const Size.fromWidth(40.0),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: const TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  focusedBorder: InputBorder.none,
                  hintText: 'Tell us about this picture...',
                  border: InputBorder.none,
                ),
              ),
            ),
            Image.network(
              'http://$serverAdr/api/v1/object?pid=photomosaic-$pid',
            ),
            // Container(
            //   height: MediaQuery.of(context).size.height,
            //   width: double.infinity,
            //   decoration: BoxDecoration(
            //       image: DecorationImage(
            //           image: FileImage(photomosaicImage),
            //           fit: BoxFit.fitWidth)),
            // ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  void showPostCancelDialogPop() {
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
              'Stop writing the post?',
              style: TextStyle(
                color: kWhiteColor,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            contentPadding: EdgeInsets.only(
              left: 8,
              right: 8,
              top: 20,
            ),
            content: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(
                  bottom: 10,
                ),
                child: Text(
                  'If you go back now, this post will disappear.',
                  style: TextStyle(
                    color: kWhiteColor,
                    fontWeight: FontWeight.w300,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            actionsPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            actions: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () async {
                        // final userinfo = FirebaseAuth.instance.currentUser;
                        // final userData = await FirebaseFirestore.instance
                        //     .collection('user')
                        //     .doc(userinfo!.uid)
                        //     .get();

                        // Get.to(mainScreen(
                        //   nickName: userData.data()!['userId'],
                        // ));
                        Get.to(mainScreen(nickName: pid));
                      },
                      child: Container(
                        width: double.infinity,
                        child: Text(
                          'Post Delete',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: kHotpink,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        padding: EdgeInsets.only(
                          top: 12,
                          bottom: 12,
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              color: kGreyColor,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        width: double.infinity,
                        child: Text(
                          'Continue Writing',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: kWhiteColor,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        padding: EdgeInsets.only(
                          top: 12,
                          bottom: 8,
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              color: kGreyColor,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        }));
      },
    ).then((value) {
      setState(() {});
    });
  }

  SnackBar postShareSnackBar() {
    return SnackBar(
      content: Text(
        'Post Success!',
        textAlign: TextAlign.center,
      ),
      duration: Duration(seconds: 3),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('NEW POSTS',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w200)),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            showPostCancelDialogPop();
          },
          icon: Icon(Icons.close),
          color: kWhiteColor,
        ),
        actions: [
          TextButton(
            onPressed: () {
              //게시글 올리기
              ScaffoldMessenger.of(context).showSnackBar(postShareSnackBar());
              Get.to(otherHistoryScreen());
            },
            child: Text('Post'),
            style: TextButton.styleFrom(
              primary: kHotpink,
              textStyle: TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
      body: _createOtherHistoryScreenBodyWidget(),
      backgroundColor: Colors.white,
    );
  }
}
