import 'package:flutter/material.dart';
import 'package:front/controller/heart_controller.dart';
import 'package:front/screens/history/otherHistory/components/post_widget.dart';
import 'package:get/get.dart';

class otherHistoryScreen extends StatelessWidget {
  otherHistoryScreen({Key? key}) : super(key: key) {
    Get.put(HeartController());
  }

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
          title: const Text('HOT POSTS',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w200)),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            _postList(),
          ],
        ));
  }
}
