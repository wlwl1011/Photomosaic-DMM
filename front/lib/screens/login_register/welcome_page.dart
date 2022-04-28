<<<<<<< HEAD
// ignore_for_file: prefer_const_constructors

=======
>>>>>>> ca0e1c46fa92eaab96b9aab33eae6ec5ed4d7a0b
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../constants/color_constant.dart';
import './screen_login.dart';
import './widgets/widget.dart';
<<<<<<< HEAD
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
=======
>>>>>>> ca0e1c46fa92eaab96b9aab33eae6ec5ed4d7a0b

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Flexible(
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        margin: const EdgeInsets.only(top: 50),
                        width: MediaQuery.of(context).size.width,
                        child: Image(
<<<<<<< HEAD
                          image: AssetImage('front/assets/images/title1.png'),
=======
                          image: AssetImage('assets/images/title1.png'),
>>>>>>> ca0e1c46fa92eaab96b9aab33eae6ec5ed4d7a0b
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Photomosaic",
                      style: kHeadline,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Text(
                        "Use our service to create unique photomosaic photos. \n You can experience unique events.",
                        style: kBodyText,
                        textAlign: TextAlign.center,
                      ),
<<<<<<< HEAD
                    ),
=======
                    )
>>>>>>> ca0e1c46fa92eaab96b9aab33eae6ec5ed4d7a0b
                  ],
                ),
              ),
              Container(
<<<<<<< HEAD
                width: MediaQuery.of(context).size.width * 0.6,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        height: 50,
                        child: Image(
                          image: AssetImage('front/assets/images/facebook.png'),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        height: 50,
                        child: Image(
                          image:
                              AssetImage('front/assets/images/kakao-talk.png'),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        height: 50,
                        child: Image(
                          image: AssetImage('front/assets/images/google.png'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: Text(
                  "Or",
                  style: TextStyle(fontSize: 15, color: Colors.white60),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
=======
>>>>>>> ca0e1c46fa92eaab96b9aab33eae6ec5ed4d7a0b
                // margin: const EdgeInsets.only(bottom: 50),
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.grey[850],
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: MyTextButton(
                        bgColor: Colors.white,
                        buttonName: 'Register',
                        onTap: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => RegisterPage()));
                        },
                        textColor: Colors.black87,
                      ),
                    ),
                    Expanded(
                      child: MyTextButton(
                        bgColor: Colors.transparent,
                        buttonName: 'Sign In',
                        onTap: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => SignInPage(),
                              ));
                        },
                        textColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
