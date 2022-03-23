import 'package:flutter/material.dart';
import 'package:front/constants/color_constant.dart';
// import 'package:front/screens/history/main/main_screen.dart';

import 'package:front/screens/home_screen.dart';
import 'package:front/screens/splash_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: initialize(),
//       builder: (context, AsyncSnapshot snapshot) {
//         // Show splash screen while waiting for app resources to load:
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return MaterialApp(
//             debugShowCheckedModeBanner: false,
//             home: Splash(),
//           );
//         } else {
//           // Loading is done, return the app:

//           return MaterialApp(
//             debugShowCheckedModeBanner: false,
//             title: 'PHOTOMOSAIC',
//             theme: ThemeData(
//               primarySwatch: Colors.grey,
//             ),
//             home: const HomeScreen(),
//           );
//         }
//       },
//     );
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PHOTOMOSAIC',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(primary: kMainColor)),
      home: Splash(),
    );
  }
}
