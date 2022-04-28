import 'package:flutter/material.dart';
import 'package:front/screens/history/otherHistory/components/avartar_widget.dart';
import 'package:front/screens/history/otherHistory/components/post_widget.dart';

class CommentScreen extends StatelessWidget {
  const CommentScreen({Key? key}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('Comment',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w100)),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            _newRecentlyActiveView(),
            const SizedBox(
              height: 15,
            ),
          ],
        )));
  }
}
