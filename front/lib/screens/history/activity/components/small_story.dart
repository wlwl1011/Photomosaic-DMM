import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SmallStoryWidget extends StatelessWidget {
  final String imagePath;
  String nickName;
  Size size;

  SmallStoryWidget(
      {Key? key,
      required this.imagePath,
      required this.nickName,
      required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          child: Image.asset(
            imagePath,
            width: size.width,
            height: size.width,
            fit: BoxFit.fitWidth,
          ),
        ),
        SizedBox(
          width: Get.width * 0.02,
        ),
        Text(nickName,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
      ],
    );
  }
}
