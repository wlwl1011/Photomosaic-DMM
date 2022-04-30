import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShakeController extends GetxController {
  var photomosaicImage = Image.asset('assets/images/empty_image.png');
  bool isVisible = false;

  void ShakeScreen() {
    this.isVisible = true;
    update();
  }
}
