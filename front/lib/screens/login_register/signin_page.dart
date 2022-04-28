<<<<<<< HEAD
// ignore_for_file: prefer_const_constructors

=======
>>>>>>> ca0e1c46fa92eaab96b9aab33eae6ec5ed4d7a0b
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../constants/color_constant.dart';
import './screen_login.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import './widgets/widget.dart';
<<<<<<< HEAD
import '../../../constants/color_constant.dart';
=======
>>>>>>> ca0e1c46fa92eaab96b9aab33eae6ec5ed4d7a0b

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isPasswordVisible = true;
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
<<<<<<< HEAD
            image: Svg('front/assets/images/back_arrow_l.svg'),
=======
            image: Svg('assets/images/back_arrow.svg'),
>>>>>>> ca0e1c46fa92eaab96b9aab33eae6ec5ed4d7a0b
          ),
        ),
      ),
      body: SafeArea(
        //to make page scrollable
        child: CustomScrollView(
          reverse: true,
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      fit: FlexFit.loose,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome back.",
                            style: kHeadline,
                          ),
                          SizedBox(
                            height: 10,
                          ),
<<<<<<< HEAD
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              "Please login to continue",
                              style: kBodyText3,
                            ),
                          ),
                          SizedBox(
                            height: 20,
=======
                          Text(
                            "You've been missed!",
                            style: kBodyText2,
                          ),
                          SizedBox(
                            height: 60,
>>>>>>> ca0e1c46fa92eaab96b9aab33eae6ec5ed4d7a0b
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
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => RegisterPage(),
                              ),
                            );
                          },
                          child: Text(
                            'Register',
                            style: kBodyText.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    MyTextButton(
                      buttonName: 'Sign In',
                      onTap: () {},
                      bgColor: Colors.white,
                      textColor: Colors.black87,
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
