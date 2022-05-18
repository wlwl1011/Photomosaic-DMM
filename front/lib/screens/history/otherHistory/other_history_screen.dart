import 'dart:io';

import 'package:flutter/material.dart';
import 'package:front/constants/color_constant.dart';
import 'package:front/controller/heart_controller.dart';
import 'package:front/screens/history/main/main_screen.dart';
import 'package:front/screens/history/otherHistory/components/post_widget.dart';
import 'package:get/get.dart';

class otherHistoryScreen extends StatelessWidget {
  otherHistoryScreen({Key? key}) : super(key: key) {
    Get.put(HeartController());
  }

  var pid = Get.arguments;

  Widget _postList() {
    return Column(
      children: List.generate(50, (index) => const PostWidget()).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text('HOT POSTS',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w200)),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.to(mainScreen(nickName: pid));
            },
            icon: Icon(
              Icons.home,
              color: kWhiteColor,
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          _postList(),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
}
