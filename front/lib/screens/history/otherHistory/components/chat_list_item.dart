import 'package:flutter/material.dart';

import 'avartar_widget.dart';

class ChatListItem extends StatelessWidget {
  const ChatListItem(
      this.message,
      //this.isMe,
      this.userId,
      {Key? key})
      : super(key: key);

  final String message;
  final String userId;
  //final bool isMe;

  @override
  Widget build(BuildContext context) {
    print("Hiii");
    print(message);
    print(userId);
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
