import 'package:front/constants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:front/screens/login_register/welcome_page.dart';
import 'package:get/get.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

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
        Get.offAll(WelcomePage(), transition: null);
      });
    }

    return Scaffold(
      backgroundColor: kBackgroundColorWithe.withOpacity(1.0),
      body: SafeArea(
        top: false,
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Center(
            child: AnimatedPadding(
              duration: const Duration(milliseconds: 2000),
              padding: isLoading
                  ? const EdgeInsets.only(top: 20)
                  : const EdgeInsets.all(0),
              child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 2000),
                  opacity: isLoading ? 1 : 0,
                  child: Hero(
                      tag: 'logo', child: Image.asset('assets/images/1.jpg'))),
            ),
          ),
        ),
      ),
    );
  }
}
