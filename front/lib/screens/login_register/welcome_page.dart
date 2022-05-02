// ignore_for_file: prefer_const_constructors
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../constants/color_constant.dart';
import './screen_login.dart';
import './widgets/widget.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        margin: const EdgeInsets.only(top: 50),
                        width: MediaQuery.of(context).size.width,
                        child: Image(
                          image: AssetImage('assets/images/1.jpg'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SignInButton(
                        Buttons.Facebook,
                        text: "Login with Facebook",
                        onPressed: () {},
                      ),
                      Divider(),
                      SignInButton(
                        Buttons.Google,
                        text: "Login with Google",
                        onPressed: () {},
                      ),
                      Divider(),
                      SignInButton(
                        Buttons.Twitter,
                        text: "Login with Twitter",
                        onPressed: () {},
                      ),
                      Divider(),
                    ]),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                            primary: Colors.grey[850],
                            textStyle:
                                TextStyle(fontSize: 12, color: Colors.white)),
                        onPressed: () {
                          Get.to(() => RegisterPage());
                        },
                        child: Text(
                          'Register',
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                            primary: Colors.grey[850],
                            textStyle:
                                TextStyle(fontSize: 12, color: Colors.white)),
                        onPressed: () {
                          Get.to(() => SignInPage());
                        },
                        child: Text(
                          'Sign In',
                        ),
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
