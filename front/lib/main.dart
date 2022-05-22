import 'package:flutter/material.dart';
import 'package:front/binder/main_binder.dart';
import 'package:front/constants/color_constant.dart';
import 'package:front/controller/main_controller.dart';
// import 'package:front/screens/history/main/main_screen.dart';
import 'package:front/screens/splash_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:front/constants/constatns.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:kakao_flutter_sdk/link.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  // This widget is the root of your application.
  @override
  void initState() {
    // TODO: implement initState

    WidgetsBinding.instance!.addObserver(this);
    String kakaoAppKey = "08584176995afe2e0b263e8c404a52ec";
    KakaoContext.clientId = kakaoAppKey;
    super.initState();
    _initDynamicLinks();
  }

  void _initDynamicLinks() async {
    FirebaseDynamicLinks.instance.onLink(
        onSuccess: (PendingDynamicLinkData? dynamicLink) async {
      Uri? deepLink = dynamicLink?.link;
      if (deepLink != null) {
        _handleDynamicLink(deepLink);
      }
    }, onError: (OnLinkErrorException e) async {
      print('onLinkError');
      print(e.message);
    });

    final PendingDynamicLinkData? data =
        await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri? deepLink = data?.link;

    if (deepLink != null) {
      _handleDynamicLink(deepLink);
    }
  }

  void _handleDynamicLink(Uri deepLink) {}

  void dispose() {
    super.dispose();
    WidgetsBinding.instance!.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PHOTOMOSAIC',
      theme: ThemeData(
          colorScheme:
              ColorScheme.fromSwatch().copyWith(primary: Colors.black)),
      home: Splash(),
      initialBinding: MainPageBinder(),
    );
  }
}
