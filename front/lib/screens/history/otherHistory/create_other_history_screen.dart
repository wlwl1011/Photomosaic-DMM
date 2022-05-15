import 'package:flutter/material.dart';
import 'package:front/constants/color_constant.dart';
import 'package:get/get.dart';

class CreateOtherHistoryScreen extends StatefulWidget {
  CreateOtherHistoryScreen({Key? key}) : super(key: key);

  @override
  State<CreateOtherHistoryScreen> createState() =>
      _CreateOtherHistoryScreenState();
}

class _CreateOtherHistoryScreenState extends State<CreateOtherHistoryScreen> {
  var photomosaicImage = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('NEW POSTS',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w200)),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: TextButton(
          onPressed: () {},
          child: Text('Cancel'),
          style: TextButton.styleFrom(
            primary: kWhiteColor,
            textStyle: TextStyle(fontWeight: FontWeight.w200),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text('Share'),
            style: TextButton.styleFrom(
              primary: kHotpink,
              textStyle: TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
      //body: ,
      backgroundColor: Colors.white,
    );
  }
}
