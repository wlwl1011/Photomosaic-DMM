import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:front/screens/history/abstract/components/body.dart';
import 'package:front/screens/history/components/my_bottom_nav_bar.dart';

class AbstractScreen extends StatelessWidget {
  const AbstractScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
      bottomNavigationBar: const MyBottomNavBar(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
        title: const Text('History'),
        centerTitle: true,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {},
          ),
        ]);
  }
}
