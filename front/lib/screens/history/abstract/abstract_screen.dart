import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:front/constants/color_constant.dart';
import 'package:front/controller/history_controller.dart';
import 'package:front/screens/history/abstract/components/header_with_seachbox.dart';
import 'package:front/screens/history/abstract/components/title_with_more_bbtn.dart';
import 'package:front/screens/history/abstract/components/trending.dart';
import 'package:front/screens/history/abstract/components/user_photos.dart';
import 'package:front/screens/history/components/my_bottom_nav_bar.dart';
import 'package:get/get.dart';

class AbstractScreen extends StatelessWidget {
  AbstractScreen({Key? key}) : super(key: key) {
    Get.put(HistoryPageController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(context),
      bottomNavigationBar: buildBottomNav(context),
      // bottomNavigationBar: BottomNavigationBar(items: []),
    );
  }

  Widget buildBody(BuildContext context) {
    // It will provie us total height  and width of our screen

    // it enable scrolling on small device
    return GetBuilder<HistoryPageController>(builder: (controller) {
      switch (controller.pageIdx.value) {
        case 0:
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const HeaderWithSearchBox(),
                TitleWithMoreBtn(title: "Trending", press: () {}),
                const Trending(),
                TitleWithMoreBtn(title: "Your Photos", press: () {}),
                const UserPhotos(),
                const SizedBox(height: kDefaultPadding),
              ],
            ),
          );
        default:
          return const Placeholder();
      }
    });
  }

  Widget buildBottomNav(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: kDefaultPadding * 2,
        right: kDefaultPadding * 2,
        bottom: kDefaultPadding,
      ),
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -10),
            blurRadius: 35,
            color: kMainColor.withOpacity(0.38),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GetBuilder<HistoryPageController>(builder: (controller) {
            return IconButton(
              icon: SvgPicture.asset(
                "assets/icons/flower.svg",
                color:
                    controller.pageIdx.value == 0 ? Colors.black : Colors.blue,
              ),
              onPressed: () {
                controller.changePage(0);
              },
            );
          }),
          GetBuilder<HistoryPageController>(builder: (controller) {
            return IconButton(
              icon: SvgPicture.asset(
                "assets/icons/flower.svg",
                color:
                    controller.pageIdx.value == 1 ? Colors.black : Colors.blue,
              ),
              onPressed: () {
                controller.changePage(1);
              },
            );
          }),
          GetBuilder<HistoryPageController>(builder: (controller) {
            return IconButton(
              icon: SvgPicture.asset(
                "assets/icons/flower.svg",
                color:
                    controller.pageIdx.value == 2 ? Colors.black : Colors.blue,
              ),
              onPressed: () {
                controller.changePage(2);
              },
            );
          }),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Text('History'),
      centerTitle: true,
      elevation: 0,
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.add_box_outlined),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.favorite),
          onPressed: () {},
        ),
      ],
    );
  }
}
