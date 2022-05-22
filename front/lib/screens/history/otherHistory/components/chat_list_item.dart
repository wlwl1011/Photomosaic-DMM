import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'avartar_widget.dart';

class ChatListItem extends StatelessWidget {
  const ChatListItem(
      this.photoUrl,
      this.message,
      //this.isMe,
      this.userId,
      //this.time,
      {Key? key})
      : super(key: key);
  final String photoUrl;
  final String message;
  final String userId;
  //final String time;
  //final bool isMe;

  @override
  Widget build(BuildContext context) {
    print(photoUrl);
    return Row(
      children: [
        AvartarWidget(
          nickName: '',
          imagePath: photoUrl,
          size: const Size.fromWidth(40.0),
        ),
        const SizedBox(
          width: 3,
        ),
        Text(
          userId,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          message,
          style: const TextStyle(
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
