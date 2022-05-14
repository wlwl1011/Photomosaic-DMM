import 'package:flutter/material.dart';

class CreateOtherHistoryScreen extends StatefulWidget {
  CreateOtherHistoryScreen({Key? key}) : super(key: key);

  @override
  State<CreateOtherHistoryScreen> createState() =>
      _CreateOtherHistoryScreenState();
}

class _CreateOtherHistoryScreenState extends State<CreateOtherHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Text('create other history screen'));
  }
}
