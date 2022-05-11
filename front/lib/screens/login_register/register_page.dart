// import 'dart:html';
// ignore_for_file: prefer_const_constructors
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:front/screens/history/main/main_screen.dart';
import 'package:front/screens/login_register/screen_login.dart';
import 'package:get/get.dart';
import './widgets/widget.dart';
import '../../../constants/color_constant.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool passwordVisibility = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _userEmailCtrl = TextEditingController();
  TextEditingController _userPasswordCtrl = TextEditingController();
  TextEditingController _userNameCtrl = TextEditingController();
  TextEditingController _userPhoneCtrl = TextEditingController();
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text('Register'),
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
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  children: [
                    Container(
                        child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 50,
                          ),
                          Image(
                            //image: AssetImage('assets/images/register.png'),
                            image:
                                AssetImage('assets/images/register_color.png'),
                            width: MediaQuery.of(context).size.width * 0.3,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          // SizedBox(
                          //   height: 20,
                          // ),
                          // SizedBox(
                          //   height: 50,
                          // ),
                          MyTextField(
                            hintText: 'Name',
                            inputType: TextInputType.name,
                            controller: _userNameCtrl,
                          ),
                          MyTextField(
                            hintText: 'Email',
                            inputType: TextInputType.emailAddress,
                            controller: _userEmailCtrl,
                          ),
                          MyTextField(
                            hintText: 'Phone',
                            inputType: TextInputType.phone,
                            controller: _userPhoneCtrl,
                          ),
                          MyPasswordField(
                            isPasswordVisible: passwordVisibility,
                            controller: _userPasswordCtrl,
                            onTap: () {
                              setState(() {
                                passwordVisibility = !passwordVisibility;
                              });
                            },
                          )
                        ],
                      ),
                    )),
                    SizedBox(
                      height: 30,
                    ),
                    MyTextButton(
                      buttonName: 'Register',
                      onPressed: () async {
                        // Get.to(() => mainScreen());
                        if (!_formKey.currentState!.validate()) return;
                        try {
                          setState(() => _loading = true);
                          final r = await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                            email: _userEmailCtrl.text,
                            password: _userPasswordCtrl.text,
                          );
                          // ignore: deprecated_member_use
                          // final userInfo = await FirebaseAuth.instance.currentUser!.updateProfile(displayName: user.diplayName);
                          FirebaseAuth.instance.currentUser!
                              .updateDisplayName(_userNameCtrl.text);
                          FirebaseAuth.instance.currentUser!.updatePhotoURL(
                              'https://ssl.gstatic.com/ui/v1/icons/mail/rfr/logo_gmail_lockup_default_1x.png');
                          await r.user!.reload();
                          // await r.user!.sendEmailVerification();
                          Get.to(() => WelcomePage());
                        } catch (e) {
                          print(e);
                        } finally {
                          if (mounted) setState(() => _loading = false);
                        }
                      },
                      bgColor: Colors.black87,
                      textColor: Colors.white,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account? ",
                          style: kBodyText,
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                              primary: Colors.black87,
                              textStyle:
                                  TextStyle(fontSize: 15, color: Colors.white)),
                          onPressed: () {
                            Get.to(() => SignInPage());
                          },
                          child: Text(
                            'Sign In',
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
    );
  }
}
