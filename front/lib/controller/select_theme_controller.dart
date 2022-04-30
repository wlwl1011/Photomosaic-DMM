import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectThemeController extends GetxController {
  var themenum = 0.obs;
  var themecolor = Color(0xFFFF3387);
  void ChangeButtonColor(int theme) {
    switch (theme) {
      case 1:
        this.themecolor = Color(0xFFFF3387);
        update();
        break;
      case 2:
        this.themecolor = Color.fromARGB(255, 194, 24, 95);
        update();
        break;
      case 3:
        themecolor = Color.fromARGB(255, 46, 125, 50);
        update();
        break;
      case 4:
        themecolor = Color.fromARGB(255, 2, 120, 189);
        update();
        break;
    }
  }
}
