import 'package:flutter/material.dart';
import 'package:front/constants/color_constant.dart';

import 'user_photos.dart';
import 'header_with_seachbox.dart';
import 'trending.dart';
import 'title_with_more_bbtn.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // It will provie us total height  and width of our screen
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small device
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HeaderWithSearchBox(size: size),
          TitleWithMoreBtn(title: "Trending", press: () {}),
          const Trending(),
          TitleWithMoreBtn(title: "Your Photos", press: () {}),
          const UserPhotos(),
          const SizedBox(height: kDefaultPadding),
        ],
      ),
    );
  }
}
