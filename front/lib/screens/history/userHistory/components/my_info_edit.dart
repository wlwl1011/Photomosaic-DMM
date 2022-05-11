import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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

  Widget _postList() {
    return Column(
      children: List.generate(50, (index) => PostWidget()).toList(),
    );
  }

  var albumImage;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

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
                try {
                  final r = FirebaseAuth.instance;
                  final user = FirebaseAuth.instance;
                  r.currentUser!.updateDisplayName(_userNameCtrl.text);
                  // r.currentUser!.updatePhoneNumber(_userPhoneCtrl);
                  r.currentUser!.updatePassword(_userPasswordCtrl.text);
                  // r.currentUser!.reload();
                  // r.userChanges();
                  await FirebaseAuth.instance.signOut();
                  // r.authStateChanges();
                  // await r.currentUser!.reauthenticateWithCredential(credential);

                  Get.to(() => WelcomePage());
                } catch (e) {
                  await FirebaseAuth.instance.signOut();
                  Get.to(() => WelcomePage());
                } finally {
                  if (mounted) setState(() => _loading = false);
                  await FirebaseAuth.instance.signOut();
                  Get.to(() => WelcomePage());
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
              const RoundedImage(
                imagePath: "assets/images/profile.jpeg",
                size: Size.fromWidth(70.0),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    child: const Text("Chanege profile photo",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold)),
                    onTap: () async {
                      var picker = ImagePicker();
                      var image =
                          await picker.pickImage(source: ImageSource.gallery);
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
