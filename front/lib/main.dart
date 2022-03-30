import 'package:flutter/material.dart';
import 'package:front/constants/color_constant.dart';
// import 'package:front/screens/history/main/main_screen.dart';
import 'package:front/screens/splash_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PHOTOMOSAIC',
      theme: ThemeData(
          colorScheme:
              ColorScheme.fromSwatch().copyWith(primary: Colors.black)),
      home: Splash(),
    );
  }
}
