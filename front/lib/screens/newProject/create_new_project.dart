import 'package:flutter/material.dart';
import 'package:front/screens/history/main/main_screen.dart';
import 'package:get/get.dart';

class CreateNewProject extends StatelessWidget {
  const CreateNewProject({Key? key}) : super(key: key);

  @override
  Widget _createNewProjectBodyWidget() {
    return Text("포토모자이크 생성 화면");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Create Photomosaic',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w100)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            padding: EdgeInsets.all(16.5),
            onPressed: () {
              Get.to(mainScreen());
            },
          )
        ],
      ),
      body: _createNewProjectBodyWidget(),
    );
  }
}