import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  final _authentication = FirebaseAuth.instance;
  User? loggedUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _authentication.currentUser;
      if (user != null) {
        loggedUser = user;
        print(loggedUser!.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('COMMENTS',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w200)),
          centerTitle: true,
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('chats/mmPK8w7wnaej8SAAWOQ8/message')
              .snapshots(), //새로운 밸류 값을 가져와준다.
          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            final docs = snapshot.data!.docs;
            return ListView.builder(
              itemCount: docs.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    docs[index]['text'],
                    style: TextStyle(fontSize: 20.0),
                  ),
                );
              },
            );
          },
        ));
  }
}
