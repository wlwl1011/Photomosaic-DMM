import 'package:flutter/material.dart';
import 'package:front/controller/trending_controller.dart';
import 'package:front/screens/history/abstract/components/image_data.dart';
//import 'package:front/screens/history/details/details_screen.dart';
import 'package:front/constants/color_constant.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:flutter_svg/svg.dart';

class Trending extends StatelessWidget {
  const Trending({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          TrendingPhoto(
            image: "assets/images/image_1.jpg",
            title: "Magazine Cover",
            press: () {
              /* Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DetailsScreen(),
                ),
              );*/
            },
          ),
          TrendingPhoto(
            image: "assets/images/image_2.jpg",
            title: "My favorite",
            press: () {
              /*Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DetailsScreen(),
                ),
              );*/
            },
          ),
          TrendingPhoto(
            image: "assets/images/image_3.jpg",
            title: "Daily life",
            press: () {},
          ),
          Container(
            margin: const EdgeInsets.only(
              right: kDefaultPadding,
            ),
            child: TrendingPhoto(
              image: "assets/images/image_4.jpeg",
              title: "Daily life",
              press: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class TrendingPhoto extends StatelessWidget {
  const TrendingPhoto({
    Key? key,
    required this.image,
    required this.title,
    required this.press,
  }) : super(key: key);

  final String image, title;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: kDefaultPadding,
        top: kDefaultPadding / 2,
        bottom: kDefaultPadding * 2.5,
      ),
      width: Get.width * 0.4,
      child: Column(
        children: <Widget>[
          GestureDetector(onTap: press, child: Image.asset(image)),
          Container(
            // padding: const EdgeInsets.only(left: kDefaultPadding, top: ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 5),
                  blurRadius: 30,
                  color: kMainColor.withOpacity(0.3),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: ImageData(IconPath.likeOff),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: ImageData(IconPath.reply),
                      onPressed: () {
                        //controller.changePage(0);
                      },
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
