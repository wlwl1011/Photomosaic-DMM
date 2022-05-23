// ignore_for_file: prefer_const_constructors
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:front/main.dart';
import 'package:front/screens/history/event/event_screen.dart';
import 'package:front/screens/history/main/main_screen.dart';
import '../../../constants/color_constant.dart';
import './screen_login.dart';
import './widgets/widget.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:twitter_login/twitter_login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WelcomePage extends StatelessWidget {
  Future<UserCredential> signInWithTwitter() async {
    // Create a TwitterLogin instance
    final twitterLogin = new TwitterLogin(
        apiKey: 'gNbb1xq8e6tQ4I2rX94b0Xoof',
        apiSecretKey: '839YCSgH7B7fVYHwZb3sKxIf7P8oKUEjSIov7hQHT7aWRNJVlz',
        redirectURI: 'https://photomosaic-dmm.firebaseapp.com/__/auth/handler');

    // Trigger the sign-in flow
    final authResult = await twitterLogin.login();

    // Create a credential from the access token
    final twitterAuthCredential = TwitterAuthProvider.credential(
      accessToken: authResult.authToken!,
      secret: authResult.authTokenSecret!,
    );
    final r = FirebaseAuth.instance.signInWithCredential(twitterAuthCredential);

    Get.to(() => mainScreen(
          nickName: 'subinKwon',
        ));

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance
        .signInWithCredential(twitterAuthCredential);
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    final r = await FirebaseAuth.instance.signInWithCredential(credential);
    FirebaseAuth.instance.currentUser!
        .updatePhotoURL('assets/images/userImageDefault.jpg');
    await FirebaseFirestore.instance // userID 추가하는 코드 추가함! -민지-
        .collection('user')
        .doc(r.user!.uid)
        .set({
      'uid': r.user!.uid,
      'userId': r.user!.displayName,
      'email': r.user!.email,
      'photoUrl': 'assets/images/userImageDefault.jpg',
    });

    Get.to(() => mainScreen(
        nickName: r.user!.displayName // 사용자 아이디 (닉네임)전달 -구글에서는 어캐 하니?
        ));

    // Once signed in, return the UserCredential

    // final r = await FirebaseAuth.instance.signInWithCredential(credential);
    // print(r);
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);
    final r =
        FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);

    Get.to(() => mainScreen(
          nickName: 'subinKwon',
        ));
    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

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
                      child: Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Container(
                          margin: const EdgeInsets.only(top: 90),
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Image(
                            image: AssetImage('assets/images/1.jpg'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: Get.width * 0.7,
                        height: Get.height * 0.05,
                        child: SignInButton(
                          Buttons.Facebook,
                          text: "Login with Facebook",
                          onPressed: signInWithFacebook,
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.03,
                      ),
                      Container(
                        width: Get.width * 0.7,
                        height: Get.height * 0.05,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black12,
                            width: 1,
                          ),
                        ),
                        child: SignInButton(
                          Buttons.Google,
                          text: "Login with Google",
                          onPressed: signInWithGoogle,
                          // onPressed: () {
                          //   // Get.to(() => mainScreen());
                          // },
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.03,
                      ),
                      Container(
                        width: Get.width * 0.7,
                        height: Get.height * 0.05,
                        child: SignInButton(
                          Buttons.Twitter,
                          text: "Login with Twitter",
                          onPressed: signInWithTwitter,
                        ),
                      ),
                    ]),
              ),
              SizedBox(
                height: Get.height * 0.01,
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
                                TextStyle(fontSize: 15, color: Colors.white)),
                        onPressed: () {
                          Get.to(() => RegisterPage());
                        },
                        child: Text(
                          'Register',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                            primary: Colors.grey[850],
                            textStyle:
                                TextStyle(fontSize: 15, color: Colors.white)),
                        onPressed: () {
                          Get.to(() => SignInPage());
                        },
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
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
