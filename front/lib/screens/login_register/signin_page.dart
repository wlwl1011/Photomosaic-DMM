// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:front/screens/history/event/event_screen.dart';
import 'package:front/screens/history/main/main_screen.dart';
import 'package:get/get.dart';
import '../../../constants/color_constant.dart';
import './screen_login.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import './widgets/widget.dart';
import '../../../constants/color_constant.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool Showspinner = false;
  bool isPasswordVisible = true;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _userEmailCtrl = TextEditingController();
  TextEditingController _userPasswordCtrl = TextEditingController();
  bool _loading = false;
  String userInfo = " ";

  @override
  void dispose() {
    _userEmailCtrl.dispose();
    // _userNameCtrl.dispose();
    _userPasswordCtrl.dispose();
    // _userPhoneCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: Showspinner,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          title: Text('Sign In'),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Image(
              width: 24,
              color: Colors.white,
              image: Svg('assets/images/back_arrow_l.svg'),
            ),
          ),
        ),
        body: SafeArea(
          //to make page scrollable
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image(
                                //image: AssetImage('assets/images/login.png'),
                                image:
                                    AssetImage('assets/images/login_color.png'),
                                width: MediaQuery.of(context).size.width * 0.3,
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              MyTextField(
                                  hintText: 'email',
                                  inputType: TextInputType.text,
                                  controller: _userEmailCtrl),
                              MyPasswordField(
                                isPasswordVisible: isPasswordVisible,
                                controller: _userPasswordCtrl,
                                onTap: () {
                                  setState(() {
                                    isPasswordVisible = !isPasswordVisible;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.05,
                      ),
                      MyTextButton(
                        buttonName: 'Sign In',
                        onPressed: () async {
                          setState(() {
                            Showspinner = true;
                          });
                          // Get.to(() => mainScreen());
                          if (!_formKey.currentState!.validate()) {
                            print("validate");
                            setState(() {
                              Showspinner = false;
                            });
                            return;
                          }
                          try {
                            setState(() {
                              _loading = true;
                            });
                            await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                              email: _userEmailCtrl.text,
                              password: _userPasswordCtrl.text,
                            );

                            final user = FirebaseAuth.instance.currentUser;
                            print('hhhh');
                            print(user);
                            final userData = await FirebaseFirestore.instance
                                .collection('user')
                                .doc(user!.uid)
                                .get(); //현재 모든 유저의 데이터를 담음

                            print(userData.data()!['userId']);
                            Get.to(() => mainScreen(
                                  nickName: userData.data()!['userId'],
                                ));
                            setState(() {
                              Showspinner = false;
                            });
                          } on FirebaseAuthException catch (e) {
                            var error_message = "!";
                            switch (e.code) {
                              case 'wrong-password':
                                error_message =
                                    "Please re-enter your password.";
                                break;
                              case 'user-not-found':
                                error_message =
                                    'Please check your ID or try again after registering as a member.';
                                break;
                              case 'unknown':
                                error_message =
                                    'Please check again to see if there is an blank.';
                                break;
                              case 'invalid-mail':
                                error_message =
                                    'Please enter the correct email format.';
                                break;
                            }
                            await Get.dialog(
                              AlertDialog(
                                title: Text(e.code + "!"),
                                content: Text(error_message),
                                actions: [
                                  TextButton(
                                    child: Text("Ok"),
                                    onPressed: () => Get.back(),
                                  ),
                                ],
                              ),
                            );
                          } finally {
                            setState(() {
                              _loading = false;
                              Showspinner = false;
                            });
                          }
                        },
                        bgColor: Colors.black87,
                        textColor: Colors.white,
                      ),
                      SizedBox(
                        height: Get.height * 0.1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Dont't have an account? ",
                            style: kBodyText,
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                                primary: Colors.black87,
                                textStyle: TextStyle(
                                    fontSize: 15, color: Colors.white)),
                            onPressed: () {
                              Get.to(() => RegisterPage());
                            },
                            child: Text(
                              'Register',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
