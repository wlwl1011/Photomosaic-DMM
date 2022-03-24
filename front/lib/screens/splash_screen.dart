import 'package:front/constants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:front/screens/home_screen.dart';
import 'package:get/get.dart';

import 'history/abstract/abstract_screen.dart';

class Splash extends StatefulWidget {
  Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  var isLoading = false;
  @override
  Widget build(BuildContext context) {
    if (!isLoading) {
      Future.delayed(const Duration(milliseconds: 200), () {
        setState(
          () {
            isLoading = true;
          },
        );
      });
    } else {
      Future.delayed(const Duration(milliseconds: 2000), () {
        Get.to(AbstractScreen());
      });
    }

    return Scaffold(
      backgroundColor: kBackgroundColorWithe.withOpacity(1.0),
      body: SafeArea(
        top: false,
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
          child: Center(
            child: AnimatedPadding(
              duration: const Duration(milliseconds: 2000),
              padding: isLoading
                  ? const EdgeInsets.only(top: 50)
                  : const EdgeInsets.all(0),
              child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 2000),
                  opacity: isLoading ? 1 : 0,
                  child: Hero(
                      tag: 'logo',
                      child: Image.asset('assets/images/logo.jpg'))),
            ),
          ),
        ),
      ),
    );
  }
}

Future initialize() async {
  await Future.delayed(const Duration(seconds: 3));
}

class Init {
  Init._();
  static final instance = Init._();
}
