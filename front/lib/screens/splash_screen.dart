import 'package:front/constants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:front/screens/history/main/main_screen.dart';
import 'package:front/screens/login_register/welcome_page.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  var isLoading = false;
  bool isLoggedIn = false;

  @override
  void initState() {
    isLoggedIn = false;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

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
      Future.delayed(const Duration(milliseconds: 2000), () async {
        if (isLoggedIn == true) {
          final user = FirebaseAuth.instance.currentUser;
          final userData = await FirebaseFirestore.instance
              .collection('user')
              .doc(user!.uid)
              .get(); //현재 모든 유저의 데이터를 담음
          Get.offAll(mainScreen(nickName: userData.data()!['userId']),
              transition: null);
        } else {
          Get.offAll(WelcomePage(), transition: null);
        }
        // Get.offAll(mainScreen(nickName: " "), transition: null);
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
