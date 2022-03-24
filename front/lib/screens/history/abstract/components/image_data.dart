import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageData extends StatelessWidget {
  String icon;
  final double? width;
  ImageData(
    this.icon, {
    Key? key,
    this.width = 55,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      icon,
      width: width! / Get.mediaQuery.devicePixelRatio,
    );
  }
}

class IconPath {
  static String get likeOn => 'assets/icons/like_on_icon.jpeg';
  static String get likeOff => 'assets/icons/like_off_icon.jpeg';
  static String get reply => 'assets/icons/reply_icon.jpeg';
}
