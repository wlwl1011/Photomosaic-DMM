import 'package:flutter/material.dart';
import 'package:front/screens/history/activity/components/small_story.dart';

import 'package:front/screens/history/otherHistory/components/avartar_widget.dart';
import 'package:front/screens/history/otherHistory/components/post_widget.dart';
import 'package:get/get.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({Key? key}) : super(key: key);

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
                    text: " liked your story.",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  TextSpan(
                    text: " 22h",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 13,
                      color: Colors.black54,
                    ),
                  ),
                ]),
          ),
        ),
        SmallStoryWidget(
          nickName: '',
          imagePath: "assets/images/image_1.png",
          size: const Size.fromWidth(40.0),
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
          const Text('Today',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              )),
          const SizedBox(
            height: 15,
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
          _activeditemOne(),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Widget _newRecentlyThisWeekView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text('This Week',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              )),
          const SizedBox(
            height: 15,
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

  Widget _newRecentlyThisMonthView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text('This Month',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              )),
          const SizedBox(
            height: 15,
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
          title: const Text('Activity',
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
            _newRecentlyThisWeekView(),
            const SizedBox(
              height: 15,
            ),
            _newRecentlyThisMonthView(),
            const SizedBox(
              height: 15,
            ),
          ],
        )));
  }
}
