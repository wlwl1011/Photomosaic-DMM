import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:front/constants/color_constant.dart';
import 'package:front/constants/constatns.dart';
import 'package:front/controller/main_controller.dart';
import 'package:front/screens/history/main/main_screen.dart';
import 'package:front/screens/history/otherHistory/other_history_screen.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'components/avartar_widget.dart';

class CreateOtherHistoryScreen extends StatefulWidget {
  var pid;
  String nickName;
  String imagePath;
  CreateOtherHistoryScreen(
      {this.pid, required this.nickName, required this.imagePath, Key? key})
      : super(key: key);
  //final String nickName;

  @override
  State<CreateOtherHistoryScreen> createState() =>
      _CreateOtherHistoryScreenState();
}

class _CreateOtherHistoryScreenState extends State<CreateOtherHistoryScreen> {
  final _controller = TextEditingController();
  var _userEnterText = '';

  void _createPost() async {
    final user = FirebaseAuth.instance.currentUser;

    print(user);
    final userData = await FirebaseFirestore.instance
        .collection('user')
        .doc(user!.uid)
        .get(); //현재 모든 유저의 데이터를 담음

    print(user.uid);
    print(userData.data());
    var pid = widget.pid;

    print(pid);
    var userId = user.uid;
    FirebaseFirestore.instance.collection('post').add({
      'heart': 0,
      'photoUrl':
          'http://$serverAdr/api/v1/object?pid=photomosaic-$pid&uid=${user.uid}',
      'text': _userEnterText,
      'time': Timestamp.now(),
      'userPhotoUrl': userData.data()!['photoUrl'],
      'userId': userData.data()!['userId'],
    });
    print('done');
    _controller.clear();
    ScaffoldMessenger.of(context).showSnackBar(postShareSnackBar());
    Get.to(otherHistoryScreen());
  }

  Widget _createOtherHistoryScreenBodyWidget() {
    print('........');
    var pid = widget.pid;
    //print('http://$serverAdr/api/v1/object?pid=photomosaic-$pid');
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              margin: const EdgeInsets.only(
                top: 10,
                bottom: 10,
              ),
              child: AvartarWidget(
                nickName: widget.nickName,
                //nickName: Text(widget.nickName),
                imagePath: widget.imagePath,
                size: const Size.fromWidth(40.0),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextField(
                keyboardType: TextInputType.multiline,
                controller: _controller,
                maxLines: null,
                decoration: InputDecoration(
                  focusedBorder: InputBorder.none,
                  hintText: 'Tell us about this picture...',
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  setState(() {
                    _userEnterText = value;
                  });
                },
              ),
            ),
            GetBuilder<MainController>(builder: (ctrl) {
              return Image.network(
                "http://$serverAdr/api/v1/object?pid=photomosaic-$pid&uid=${ctrl.uid}",
              );
            }),
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
            contentPadding: const EdgeInsets.only(
              left: 8,
              right: 8,
              top: 20,
            ),
            content: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.only(
                  bottom: 10,
                ),
                child: const Text(
                  'If you go back now, this post will disappear.',
                  style: TextStyle(
                    color: kWhiteColor,
                    fontWeight: FontWeight.w300,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            actionsPadding:
                const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            actions: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () async {
                        final userinfo = FirebaseAuth.instance.currentUser;
                        final userData = await FirebaseFirestore.instance
                            .collection('user')
                            .doc(userinfo!.uid)
                            .get();

                        Get.to(mainScreen(
                          nickName: userData.data()!['userId'],
                        ));
                      },
                      child: Container(
                        width: double.infinity,
                        child: const Text(
                          'Post Delete',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: kHotpink,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        padding: const EdgeInsets.only(
                          top: 12,
                          bottom: 12,
                        ),
                        decoration: const BoxDecoration(
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
                        child: const Text(
                          'Continue Writing',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: kWhiteColor,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        padding: const EdgeInsets.only(
                          top: 12,
                          bottom: 8,
                        ),
                        decoration: const BoxDecoration(
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
    return const SnackBar(
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
          icon: const Icon(Icons.close),
          color: kWhiteColor,
        ),
        actions: [
          TextButton(
            onPressed: _userEnterText.trim().isEmpty ? null : _createPost,
            child: const Text('Post'),
            style: TextButton.styleFrom(
              primary: kHotpink,
              textStyle: const TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
      body: _createOtherHistoryScreenBodyWidget(),
      backgroundColor: Colors.white,
    );
  }
}
