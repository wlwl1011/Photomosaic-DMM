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
        this.themecolor = Color.fromARGB(255, 194, 24, 24);
        update();
        break;
      case 3:
        themecolor = Color.fromARGB(255, 226, 73, 12);
        update();
        break;
      case 4:
        themecolor = Color.fromARGB(255, 230, 187, 0);
        update();
        break;
      case 5:
        themecolor = Color.fromARGB(255, 46, 125, 50);
        update();
        break;
      case 6:
        themecolor = Color.fromARGB(255, 2, 120, 189);
        update();
        break;
      case 7:
        themecolor = Color.fromARGB(255, 105, 2, 189);
        update();
        break;
    }
  }
}
