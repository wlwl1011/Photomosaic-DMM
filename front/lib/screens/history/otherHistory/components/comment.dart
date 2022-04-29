import 'package:flutter/material.dart';
import 'package:front/screens/history/otherHistory/components/avartar_widget.dart';
import 'package:front/screens/history/otherHistory/components/message.dart';
import 'package:front/screens/history/otherHistory/components/new_message.dart';
//import 'package:firebase_auth/firebase_auth.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({Key? key}) : super(key: key);

  @override
  _CommentScreenState createState() => _CommentScreenState();
}

Widget _activeditemOne() {
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
      const Expanded(
        child: Text.rich(
          TextSpan(
              text: 'galaxy_steam',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: " Wow.. It's really beautiful...",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ]),
        ),
      ),
    ],
  );
}

Widget _newRecentlyActiveView() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _activeditemOne(),
        const SizedBox(
          height: 10,
        ),
        _activeditemOne(),
        const SizedBox(
          height: 10,
        ),
        _activeditemOne(),
        const SizedBox(
          height: 10,
        ),
        _activeditemOne(),
        const SizedBox(
          height: 10,
        ),
      ],
    ),
  );
}

class _CommentScreenState extends State<CommentScreen> {
  //final _authentication = FirebaseAuth.instance;
  //User? loggedUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getCurrentUser();
  }

  /* void getCurrentUser() {
    try {
      final user = _authentication.currentUser;
      if (user != null) {
        loggedUser = user;
        print(loggedUser!.email);
      }
    } catch (e) {
      print(e);
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Comments',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w100)),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            _newRecentlyActiveView(),
            Expanded(
              child: Messages(),
            ),
            NewMessage(),
          ],
        ),
      ),
    );
  }
}
