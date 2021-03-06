import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('EVENT',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w200)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  const SizedBox(
                    height: 17,
                  ),
                  Row(
                    children: const [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'PHOTOMOSAIC WITH TOO COLL FOR SCHOOL',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: const [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '22SUMMER COLLECTION',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                ],
              ),
              color: Colors.black12,
              alignment: Alignment.centerLeft,
            ),
            Image.asset(
              'assets/images/too_cool.jpeg',
              fit: BoxFit.contain,
            ),
            Image.asset(
              'assets/images/too_cool_logo.jpg',
              fit: BoxFit.contain,
            ),
            SizedBox(
              height: Get.height * 0.05,
            ),
            Container(
              child: Column(
                children: [
                  const Text('PHOTOMOSAIC',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.left),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  const Text(
                    'X TOO COLL FOR SCHOOL',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.05,
                  ),
                  const Text(
                    '????????? ??????',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.005,
                  ),
                  const Text(
                    '4/25(???) ~ 5/02(???)',
                    style: TextStyle(
                      color: Colors.black45,
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.05,
                  ),
                  const Text(
                    '????????? ??????',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(60, 20, 60, 20),
                    child: Image.asset(
                      'assets/images/event_m.jpg',
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.05,
                  ),
                  const Text(
                    '?????? ??????',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  const Text(
                    '1. ????????? ?????????????????? ?????? ?????? (??????: ??????)',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  const Text(
                    '2. ???????????? #TooCooForSchool ???????????? ?????????',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              alignment: Alignment.center,
            ),
            SizedBox(
              height: Get.height * 0.05,
            ),
            Container(
              // constraints: BoxConstraints(maxHeight: 180, maxWidth: 180),
              child: Image.asset(
                'assets/images/banner_image_3.png',
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              height: Get.height * 0.05,
            ),
            Image.asset(
              'assets/images/too_cool_.jpg',
              fit: BoxFit.contain,
            ),
            SizedBox(
              height: Get.height * 0.05,
            ),
            Image.asset(
              'assets/images/too_for_school.jpg',
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}
