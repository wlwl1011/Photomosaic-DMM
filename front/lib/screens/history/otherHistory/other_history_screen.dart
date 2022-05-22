import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
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
            icon: const Icon(
              Icons.home,
              color: kWhiteColor,
            ),
          )
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('post')
            .orderBy('time', descending: true)
            .snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          print(snapshot);
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final postDocs = snapshot.data!.docs;

          return ListView.builder(
            reverse: false,
            itemCount: postDocs.length,
            itemBuilder: (context, index) {
              return PostWidget(
                //user.photoURL!,
                postDocs[index]['photoUrl'],
                postDocs[index]['text'],
                //postDocs[index]['time'],
                postDocs[index]['heart'],
                postDocs[index]['postUid'],
                //'assets/images/userImageDefault.jpg',
                postDocs[index]['userId'],
                //chatDocs[index]['userID'].toString() == user!.uid,
                postDocs[index]['userPhotoUrl'],
                //chatDocs[index]['time']
              );
            },
          );
        },
      ),
      backgroundColor: Colors.white,
    );
  }
}
