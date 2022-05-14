import 'package:flutter/material.dart';

import 'avartar_widget.dart';

class ChatListItem extends StatelessWidget {
  const ChatListItem(
      this.message,
      //this.isMe,
      this.userId,
      //this.time,
      {Key? key})
      : super(key: key);

  final String message;
  final String userId;
  //final String time;
  //final bool isMe;

  @override
  Widget build(BuildContext context) {
    //print(isMe);
    return Row(
      children: [
        AvartarWidget(
          nickName: '',
          imagePath: "assets/images/drawing.png",
          size: const Size.fromWidth(40.0),
        ),
        const SizedBox(
          width: 10,
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
