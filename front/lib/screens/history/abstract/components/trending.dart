import 'package:flutter/material.dart';
//import 'package:front/screens/history/details/details_screen.dart';
import 'package:front/constants/color_constant.dart';
import 'package:get/get.dart';

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
            image: "assets/images/image_1.png",
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
            image: "assets/images/image_2.png",
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
            image: "assets/images/image_3.png",
            title: "Daily life",
            press: () {},
          ),
          Container(
            margin: const EdgeInsets.only(
              right: kDefaultPadding,
            ),
            child: TrendingPhoto(
              image: "assets/images/image_4.png",
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
        ],
      ),
    );
  }
}
