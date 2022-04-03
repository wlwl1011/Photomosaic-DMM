import 'package:front/screens/history/userHistory/components/my_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final item = [
  "assets/images/userImage_1.jpeg",
  "assets/images/userImage_2.jpeg",
  "assets/images/userImage_3.jpeg",
  "assets/images/userImage_4.jpeg",
  "assets/images/userImage_5.jpeg",
  "assets/images/userImage_6.jpeg",
  "assets/images/userImage_7.jpeg",
  "assets/images/userImage_8.jpeg",
  "assets/images/userImage_9.jpeg",
];

class UserHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: Get.height * 0.03,
          ),
          const MyInfo(),
          SizedBox(
            height: Get.height * 0.04,
          ),
          SizedBox(
            height: Get.height * 0.04,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 30,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(),
              ),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                //itemCount: item.length,
                itemBuilder: (context, i) {
                  final urlImage = item[i];
                  return Container(
                    child: Image.asset(urlImage),
                  );
                },
              ),
            ),
          )
          /*Row(
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
          ),*/
        ],
      ),
    );
  }
}
