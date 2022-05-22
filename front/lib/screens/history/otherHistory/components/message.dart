import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:front/screens/history/otherHistory/components/avartar_widget.dart';
import 'package:front/screens/history/otherHistory/components/chat_list_item.dart';
import 'package:get/get.dart';

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
//DB 연결 후 수정
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('chat')
          .orderBy('time', descending: true)
          .snapshots(),
      builder: (context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        print('00');
        print(snapshot);
        print('11');
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final chatDocs = snapshot.data!.docs;

        return ListView.builder(
          reverse: false,
          itemCount: chatDocs.length,
          itemBuilder: (context, index) {
            print('....');

            print('1');
            print(chatDocs[index]['photoUrl'].toString());
            print(chatDocs[index]['userID'].toString());
            print(chatDocs[index]['userName'].toString());
            print('2');
            print(user!.uid);
            print('3');
            print(chatDocs[index]['time']);
            return Padding(
              padding: EdgeInsets.symmetric(
                  vertical: Get.height * 0.01, horizontal: Get.width * 0.015),
              child: ChatListItem(
                //user.photoURL!,
                chatDocs[index]['photoUrl'],
                //'assets/images/userImageDefault.jpg',
                chatDocs[index]['text'],
                //chatDocs[index]['userID'].toString() == user!.uid,
                chatDocs[index]['userName'],
                //chatDocs[index]['time']
              ),
            );
          },
        );
      },
    );
  }
}
