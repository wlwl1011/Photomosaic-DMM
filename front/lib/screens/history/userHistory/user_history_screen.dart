import 'package:front/screens/history/userHistory/components/my_info.dart';
import 'package:flutter/material.dart';
import 'package:front/screens/history/userHistory/components/my_info_edit.dart';
import 'package:get/get.dart';

final items = [
  "assets/images/userImage_1.jpeg",
  "assets/images/userImage_2.jpeg",
  "assets/images/userImage_3.jpeg",
  "assets/images/userImage_4.jpeg",
  "assets/images/userImage_5.jpeg",
  "assets/images/userImage_6.jpeg",
  "assets/images/userImage_7.jpeg",
  "assets/images/userImage_8.jpeg",
  "assets/images/userImage_9.jpeg",
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

Widget _editButton() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30.0),
    child: Row(
      children: [
        Expanded(
            child: GestureDetector(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                border: Border.all(
                  color: const Color(0xffdedede),
                )),
            child: const Text(
              'Edit profile',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          onTap: () {
            Get.to(() => const MyInfoEdit());
          },
        ))
      ],
    ),
  );
}

Widget _tabView() {
  return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1,
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
      ),
      itemBuilder: (BuildContext context, int index) {
        final item = items[index];
        return GestureDetector(
            child: Image.asset(item, fit: BoxFit.fill),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return Scaffold(
                    appBar: AppBar(
                      backgroundColor: Colors.white,
                    ),
                    backgroundColor: Colors.white,
                    body: const Text(
                      'Image',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }),
              );
            });
      });
}

class UserHistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const MyInfo(),
            SizedBox(
              height: Get.height * 0.04,
            ),
            _editButton(),
            SizedBox(
              height: Get.height * 0.1,
            ),
            _tabView(),
          ],
        ),
      ),
    );
  }
}
