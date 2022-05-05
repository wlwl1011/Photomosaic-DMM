// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front/screens/history/event/event_screen.dart';
import 'package:front/screens/history/main/main_screen.dart';
import 'package:get/get.dart';
import '../../../constants/color_constant.dart';
import './screen_login.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import './widgets/widget.dart';
import '../../../constants/color_constant.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isPasswordVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image(
                            //image: AssetImage('assets/images/login.png'),
                            image: AssetImage('assets/images/login_color.png'),
                            width: MediaQuery.of(context).size.width * 0.3,
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          MyTextField(
                            hintText: 'Phone, email or username',
                            inputType: TextInputType.text,
                          ),
                          MyPasswordField(
                            isPasswordVisible: isPasswordVisible,
                            onTap: () {
                              setState(() {
                                isPasswordVisible = !isPasswordVisible;
                              });
                            },
                          ),
                        ],
                      ),
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
                              textStyle:
                                  TextStyle(fontSize: 15, color: Colors.white)),
                          onPressed: () {
                            Get.to(() => RegisterPage());
                          },
                          child: Text(
                            'Register',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    MyTextButton(
                      buttonName: 'Sign In',
                      onTap: () {
                        Get.to(() => mainScreen());
                      },
                      bgColor: Colors.black87,
                      textColor: Colors.white,
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
