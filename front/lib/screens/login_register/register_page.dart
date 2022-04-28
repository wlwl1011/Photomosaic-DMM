// import 'dart:html';
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import './widgets/widget.dart';
import '../../../constants/color_constant.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool passwordVisibility = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor_l,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image(
            width: 24,
            color: Colors.white,
            image: Svg('front/assets/images/back_arrow_l.svg'),
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
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Register",
                            style: kHeadline,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              "Please sign in to continue",
                              style: kBodyText3,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          MyTextField(
                            hintText: 'Name',
                            inputType: TextInputType.name,
                          ),
                          MyTextField(
                            hintText: 'Email',
                            inputType: TextInputType.emailAddress,
                          ),
                          MyTextField(
                            hintText: 'Phone',
                            inputType: TextInputType.phone,
                          ),
                          MyPasswordField(
                            isPasswordVisible: passwordVisibility,
                            onTap: () {
                              setState(() {
                                passwordVisibility = !passwordVisibility;
                              });
                            },
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 30),
                      child: Text(
                        "Or",
                        style: TextStyle(fontSize: 15, color: Colors.white60),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 20),
                              height: 50,
                              child: Image(
                                image: AssetImage(
                                    'front/assets/images/facebook.png'),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 20),
                              height: 50,
                              child: Image(
                                image: AssetImage(
                                    'front/assets/images/kakao-talk.png'),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 20),
                              height: 50,
                              child: Image(
                                image: AssetImage(
                                    'front/assets/images/google.png'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account? ",
                          style: kBodyText,
                        ),
                        Text(
                          "Sign In",
                          style: kBodyText.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    MyTextButton(
                      buttonName: 'Register',
                      onTap: () {},
                      bgColor: Colors.white,
                      textColor: Colors.black87,
                    )
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
