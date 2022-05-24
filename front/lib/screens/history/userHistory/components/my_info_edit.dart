import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:front/screens/history/main/main_screen.dart';
import 'package:front/screens/history/otherHistory/components/post_widget.dart';
import 'package:front/screens/history/userHistory/components/radial_progress.dart';
import 'package:front/screens/history/userHistory/components/rounded_image.dart';
import 'package:front/screens/login_register/screen_login.dart';
import 'package:front/screens/login_register/widgets/my_text_field.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

import '../../../login_register/widgets/my_password_field.dart';

class MyInfoEdit extends StatefulWidget {
  const MyInfoEdit({Key? key}) : super(key: key);

  @override
  State<MyInfoEdit> createState() => _MyInfoEditState();
}

class _MyInfoEditState extends State<MyInfoEdit> {
  bool passwordVisibility = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _userEmailCtrl = TextEditingController();
  TextEditingController _userPasswordCtrl = TextEditingController();
  TextEditingController _userNameCtrl = TextEditingController();
  TextEditingController _userPhoneCtrl = TextEditingController();
  bool _loading = false;

  @override
  void dispose() {
    _userEmailCtrl.dispose();
    _userNameCtrl.dispose();
    _userPasswordCtrl.dispose();
    _userPhoneCtrl.dispose();
    super.dispose();
  }

  var albumImage;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('EDIT PROFILE',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w200)),
          actions: <Widget>[
            IconButton(
              icon: SvgPicture.asset(
                "assets/icons/ok.svg",
                color: Colors.white,
              ),
              padding: EdgeInsets.all(16.5),
              onPressed: () async {
                if (!_formKey.currentState!.validate()) return;
                //둘다 비어있을 때
                if (_userNameCtrl.text.isEmpty) {
                  if (_userPasswordCtrl.text.isEmpty) {
                    await Get.dialog(
                      AlertDialog(
                        title: const Text('Notification'),
                        content: Text("There are no modifications."),
                        actions: [
                          TextButton(
                            child: const Text("Ok"),
                            onPressed: () => Get.back(),
                          ),
                        ],
                      ),
                    );
                    Get.back();
                    return;
                  }
                }
                //둘다 변경되었을 때
                final r = FirebaseAuth.instance;
                if (_userNameCtrl.text.isNotEmpty) {
                  if (_userPasswordCtrl.text.isNotEmpty) {
                    r.currentUser!.updateDisplayName(_userNameCtrl.text);
                    print(r.currentUser);

                    r.currentUser!.updatePhotoURL('assets/images/profile.jpeg');

                    final userData = await FirebaseFirestore.instance
                        .collection('user')
                        .doc(user!.uid)
                        .get();

                    print(userData);
                    FirebaseFirestore.instance
                        .collection('user')
                        .doc(user.uid)
                        .update({'userId': _userNameCtrl.text});
                    try {
                      // r.currentUser!.updatePhoneNumber(_userPhoneCtrl);
                      r.currentUser!.updatePassword(_userPasswordCtrl.text);
                      // Get.to(() => WelcomePage());
                    } catch (e) {
                      //
                    } finally {
                      if (mounted) setState(() => _loading = false);
                      await Get.dialog(
                        AlertDialog(
                          title: const Text('Success!'),
                          content: Text(
                              "The password has been modified and requires re-login."),
                          actions: [
                            TextButton(
                              child: const Text("Ok"),
                              onPressed: () => Get.back(),
                            ),
                          ],
                        ),
                      );
                      await FirebaseAuth.instance.signOut();
                      Get.to(() => WelcomePage());
                    }
                    return;
                  } else {
                    //이름만 변경되었을 때
                    r.currentUser!.updateDisplayName(_userNameCtrl.text);

                    print(r.currentUser);

                    r.currentUser!.updatePhotoURL('assets/images/profile.jpeg');

                    final userData = await FirebaseFirestore.instance
                        .collection('user')
                        .doc(user!.uid)
                        .get();

                    print(userData);
                    FirebaseFirestore.instance
                        .collection('user')
                        .doc(user.uid)
                        .update({'userId': _userNameCtrl.text});
                    await Get.dialog(
                      AlertDialog(
                        title: const Text('Success!'),
                        content: Text("The name has been changed."),
                        actions: [
                          TextButton(
                            child: const Text("Ok"),
                            onPressed: () => Get.back(),
                          ),
                        ],
                      ),
                    );
                    Get.back();
                    return;
                  }
                }
                //비밀번호가 변경되었을 때
                if (_userPasswordCtrl.text.isNotEmpty) {
                  try {
                    // r.currentUser!.updatePhoneNumber(_userPhoneCtrl);
                    r.currentUser!.updatePassword(_userPasswordCtrl.text);
                    // Get.to(() => WelcomePage());
                  } catch (e) {
                    await FirebaseAuth.instance.signOut();
                    Get.to(() => WelcomePage());
                  } finally {
                    if (mounted) setState(() => _loading = false);
                    await Get.dialog(
                      AlertDialog(
                        title: const Text('Success!'),
                        content: Text(
                            "The password has been modified and requires re-login."),
                        actions: [
                          TextButton(
                            child: const Text("Ok"),
                            onPressed: () => Get.back(),
                          ),
                        ],
                      ),
                    );
                    await FirebaseAuth.instance.signOut();
                    Get.to(() => WelcomePage());
                  }
                  return;
                }
              },
            )
          ],
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: Get.height * 0.15,
              ),
              RoundedImage(
                imagePath: user!.photoURL!,
                size: Size.fromWidth(70.0),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    child: const Text("Change profile photo",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold)),
                    onTap: () async {
                      // var picker = ImagePicker();
                      // String image = (await picker.pickImage(
                      //     source: ImageSource.gallery)) as String;
                      final r = FirebaseAuth.instance;
                      print(r.currentUser);

                      r.currentUser!
                          .updatePhotoURL('assets/images/profile.jpeg');

                      final userData = await FirebaseFirestore.instance
                          .collection('user')
                          .doc(user.uid)
                          .get();

                      print(userData);
                      FirebaseFirestore.instance
                          .collection('user')
                          .doc(user.uid)
                          .update({'photoUrl': 'assets/images/profile.jpeg'});
                      print('update url');
                      print(userData);

                      print(userData);
                    },
                  ),
                ],
              ),
              SizedBox(
                height: Get.height * 0.1,
              ),
              Container(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: MyTextField(
                          hintText: 'Name',
                          inputType: TextInputType.name,
                          controller: _userNameCtrl,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: MyTextField(
                          hintText: 'Phone',
                          inputType: TextInputType.phone,
                          controller: _userPhoneCtrl,
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: MyPasswordField(
                            isPasswordVisible: passwordVisibility,
                            controller: _userPasswordCtrl,
                            onTap: () {
                              setState(() {
                                passwordVisibility = !passwordVisibility;
                              });
                            },
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
