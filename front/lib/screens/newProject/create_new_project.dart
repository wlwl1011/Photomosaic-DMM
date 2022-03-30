import 'package:flutter/material.dart';

class CreateNewProject extends StatefulWidget {
  CreateNewProject({Key? key}) : super(key: key);

  @override
  State<CreateNewProject> createState() => _CreateNewProjectState();
}

class _CreateNewProjectState extends State<CreateNewProject> {
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
      ),
      body: _createNewProjectBodyWidget(),
    );
  }
}
