import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:front/constants/color_constant.dart';
import 'package:front/controller/heart_controller.dart';
import 'package:front/screens/history/otherHistory/components/avartar_widget.dart';
import 'package:front/screens/history/otherHistory/components/comment.dart';
import 'package:get/get.dart';

class PostWidget extends StatelessWidget {
  final String photoUrl;
  final String text;
  //final String time;

  final int heart;
  final String userId;
  final String userPhotoUrl;

  const PostWidget(
      this.photoUrl,
      this.text,
      //this.time,
      this.heart,

      //this.isMe,
      this.userId,
      this.userPhotoUrl,
      {Key? key})
      : super(key: key);

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AvartarWidget(
            nickName: userId,
            imagePath: userPhotoUrl,
            size: const Size.fromWidth(40.0),
          ),
          GestureDetector(
            onTap: () {},
            child: SvgPicture.asset(
              "assets/icons/more.svg",
              width: Get.width * 0.05,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }

  Widget _image() {
    return CachedNetworkImage(
      imageUrl: photoUrl,
    );
  }

  Widget _infoCount() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Row(
        children: [
          Row(
            children: [
              GetBuilder<HeartController>(builder: (controller) {
                if (controller.pageIdx.value == 1) {
                  return IconButton(
                    icon: SvgPicture.asset('assets/icons/heart_on.svg',
                        width: Get.width * 0.06, color: Colors.red),
                    onPressed: () {
                      controller.changeColor(1);
                    },
                  );
                } else {
                  return IconButton(
                    icon: SvgPicture.asset('assets/icons/heart_off.svg',
                        width: Get.width * 0.06, color: Colors.black),
                    onPressed: () {
                      controller.changeColor(1);
                    },
                  );
                }
              }),
              GestureDetector(
                child: SvgPicture.asset(
                  'assets/icons/reply_icon.svg',
                  width: Get.width * 0.06,
                  color: Colors.black,
                ),
                onTap: () {
                  Get.to(() => const CommentScreen());
                },
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
          Text(
            heart.toString() + " likes",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: Get.height * 0.005,
          ),
          ExpandableText(
            text,
            prefixText: userId,
            prefixStyle: const TextStyle(fontWeight: FontWeight.bold),
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
          'view all 287 comments',
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
              height: Get.height * 0.005,
            ),
            _infoCount(),
            // SizedBox(
            //   height: Get.height * 0.005,
            // ),
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
