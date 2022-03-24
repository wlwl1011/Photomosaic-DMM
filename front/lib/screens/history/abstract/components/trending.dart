import 'package:flutter/material.dart';
import 'package:front/screens/history/details/details_screen.dart';

import 'package:front/constants/color_constant.dart';

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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DetailsScreen(),
                ),
              );
            },
          ),
          TrendingPhoto(
            image: "assets/images/image_2.jpg",
            title: "My favorite",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DetailsScreen(),
                ),
              );
            },
          ),
          TrendingPhoto(
            image: "assets/images/image_3.jpg",
            title: "Daily life",
            press: () {},
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
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(
        left: kDefaultPadding,
        top: kDefaultPadding / 2,
        bottom: kDefaultPadding * 2.5,
      ),
      width: size.width * 0.4,
      child: Column(
        children: <Widget>[
          Image.asset(image),
          Container(
            padding: const EdgeInsets.all(kDefaultPadding / 2),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 10),
                  blurRadius: 50,
                  color: kMainColor.withOpacity(0.23),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: [
                    RichText(
                      textAlign: TextAlign.end,
                      text: TextSpan(
                          text: "$title".toUpperCase(),
                          style: Theme.of(context).textTheme.button),
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
