import 'package:front/screens/history/abstract/profile/my_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final Item = {
  "list": [
    {"image": "assets/images/userImage_1.jpeg"},
    {"image": "assets/images/userImage_2.jpeg"},
    {"image": "assets/images/userImage_3.jpeg"},
    {"image": "assets/images/userImage_4.jpeg"},
    {"image": "assets/images/userImage_5.jpeg"},
    {"image": "assets/images/userImage_6.jpeg"},
    {"image": "assets/images/userImage_7.jpeg"},
    {"image": "assets/images/userImage_8.jpeg"},
    {"image": "assets/images/userImage_9.jpeg"},
  ]
};

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const MyInfo(),
          Row(
            children: [
              SizedBox(width: Get.width * 0.02),
              SizedBox(
                width: Get.width * 0.3,
                height: Get.height * 0.3,
                child: Image.asset("assets/images/userImage_1.jpeg"),
              ),
              SizedBox(width: Get.width * 0.03),
              SizedBox(
                width: Get.width * 0.3,
                height: Get.height * 0.3,
                child: Image.asset("assets/images/userImage_2.jpeg"),
              ),
              SizedBox(width: Get.width * 0.03),
              SizedBox(
                width: Get.width * 0.3,
                height: Get.height * 0.3,
                child: Image.asset("assets/images/userImage_3.jpeg"),
              ),
              SizedBox(width: Get.width * 0.02),
            ],
          ),
          Row(
            children: [
              SizedBox(width: Get.width * 0.02),
              SizedBox(
                width: Get.width * 0.3,
                height: Get.height * 0.3,
                child: Image.asset("assets/images/userImage_4.jpeg"),
              ),
              SizedBox(width: Get.width * 0.03),
              SizedBox(
                width: Get.width * 0.3,
                height: Get.height * 0.3,
                child: Image.asset("assets/images/userImage_5.jpeg"),
              ),
              SizedBox(width: Get.width * 0.03),
              SizedBox(
                width: Get.width * 0.3,
                height: Get.height * 0.3,
                child: Image.asset("assets/images/userImage_6.jpeg"),
              ),
              SizedBox(width: Get.width * 0.02),
            ],
          ),
          Row(
            children: [
              SizedBox(width: Get.width * 0.02),
              SizedBox(
                width: Get.width * 0.3,
                height: Get.height * 0.3,
                child: Image.asset("assets/images/userImage_7.jpeg"),
              ),
              SizedBox(width: Get.width * 0.03),
              SizedBox(
                width: Get.width * 0.3,
                height: Get.height * 0.3,
                child: Image.asset("assets/images/userImage_8.jpeg"),
              ),
              SizedBox(width: Get.width * 0.03),
              SizedBox(
                width: Get.width * 0.3,
                height: Get.height * 0.3,
                child: Image.asset("assets/images/userImage_9.jpeg"),
              ),
              SizedBox(width: Get.width * 0.02),
            ],
          ),
        ],
      ),
    );
  }
}
