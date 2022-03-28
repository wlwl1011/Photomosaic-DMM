import 'package:flutter/material.dart';

class NewProjectHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(child: Text("새 프로젝트 창")),
    );
  }
}
