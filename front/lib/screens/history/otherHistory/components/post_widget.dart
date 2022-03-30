import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:front/screens/history/otherHistory/components/avartar_widget.dart';
import 'package:get/get.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({Key? key}) : super(key: key);

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AvartarWidget(
            nickName: 'minzzl',
            imagePath: "assets/images/profile.jpeg",
            size: const Size.fromWidth(40.0),
          ),
          GestureDetector(
            onTap: () {},
            child: Image.asset("assets/icons/more_icon.jpeg", width: 20),
          )
        ],
      ),
    );
  }

  Widget _image() {
    return CachedNetworkImage(
      imageUrl: 'https://thumb.mt.co.kr/06/2022/03/2022031414200531127_1.jpg',
    );
  }

  Widget _infoCount() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        children: [
          Row(
            children: [
              Image.asset(
                'assets/icons/like_off_icon.jpeg',
                width: Get.width * 0.06,
              ),
              SizedBox(width: Get.width * 0.02),
              Image.asset(
                'assets/icons/reply_icon.jpeg',
                width: Get.width * 0.06,
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _infoDiscription() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            '9,345 likes',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: Get.height * 0.005,
          ),
          const ExpandableText(
            'Hi guys\nThis photo is my favorite Idol\n Ha Ha \n',
            prefixText: 'minzzl',
            prefixStyle: TextStyle(fontWeight: FontWeight.bold),
            expandText: 'more',
            collapseText: 'briefly',
            maxLines: 3,
            expandOnTextTap: true,
            collapseOnTextTap: true,
            linkColor: Colors.grey,
          )
        ],
      ),
    );
  }

  Widget _replyTextBtn() {
    return GestureDetector(
      onTap: () {},
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Text(
          'vieew all 287 comments',
          style: TextStyle(color: Colors.grey, fontSize: 13),
        ),
      ),
    );
  }

  Widget _dateAgo() {
    return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Text('1 day ago',
            style: TextStyle(color: Colors.grey, fontSize: 13)));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        margin: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _header(),
            SizedBox(
              height: Get.height * 0.02,
            ),
            _image(),
            SizedBox(
              height: Get.height * 0.02,
            ),
            _infoCount(),
            SizedBox(
              height: Get.height * 0.01,
            ),
            _infoDiscription(),
            SizedBox(
              height: Get.height * 0.01,
            ),
            _replyTextBtn(),
            SizedBox(
              height: Get.height * 0.01,
            ),
            _dateAgo(),
          ],
        ));
  }
}