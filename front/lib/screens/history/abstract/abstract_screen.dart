import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:front/constants/color_constant.dart';
import 'package:front/controller/history_controller.dart';
import 'package:front/screens/history/abstract/components/header_with_seachbox.dart';
import 'package:front/screens/history/abstract/new_project/new_project_home.dart';
import 'package:front/screens/history/abstract/profile.dart';
import 'package:front/screens/history/abstract/components/title_with_more_bbtn.dart';
import 'package:front/screens/history/abstract/components/trending.dart';
import 'package:front/screens/history/abstract/components/user_photos.dart';
import 'package:get/get.dart';

import 'components/user_photos_more.dart';

class AbstractScreen extends StatelessWidget {
  AbstractScreen({Key? key}) : super(key: key) {
    Get.put(HistoryPageController());
  }

  final Images = [
    'https://ifh.cc/g/fnQ7MR.png',
    'https://ifh.cc/g/dfsTDy.png',
    'https://ifh.cc/g/gkj6Jt.jpg',
  ];

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
          return Column(
            children: [
              const HeaderWithSearchBox(),
              CarouselSlider.builder(
                options: CarouselOptions(
                  height: 300,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 2),
                ),
                itemCount: Images.length,
                itemBuilder: (context, index, realIndex) {
                  final urlImage = Images[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 1),
                    color: Colors.grey,
                    child: Image.network(urlImage, fit: BoxFit.cover),
                  );
                },
              ),
            ],
          );

        /*SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const HeaderWithSearchBox(),
                TitleWithMoreBtn(title: "Trending", press: () {}),
                const Trending(),
                TitleWithMoreBtn(
                    title: "Your Photos",
                    press: () {
                      Get.to(() => const UserPhotosMore());
                    }),
                const UserPhotos(),
                const SizedBox(height: kDefaultPadding),
              ],
            ),
          );*/

        case 1:
          return NewProjectHome(); //새 프로젝트 만들기 홈으로 이동

        case 2:
          return ProfilePage();

        default:
          return const Placeholder();
      }
    });
  }

  Widget buildBottomNav(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: kDefaultPadding / 1.5,
        left: kDefaultPadding * 2,
        right: kDefaultPadding * 2,
        bottom: kDefaultPadding / 1.5,
      ),
      height: Get.height * 0.08,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GetBuilder<HistoryPageController>(builder: (controller) {
            return IconButton(
              icon: SvgPicture.asset(
                "assets/icons/flower.svg",
                color:
                    controller.pageIdx.value == 0 ? kMainColor : Colors.black,
              ),
              onPressed: () {
                controller.changePage(0);
              },
            );
          }),
          GetBuilder<HistoryPageController>(builder: (controller) {
            return IconButton(
              icon: SvgPicture.asset(
                "assets/icons/add.svg",
                color:
                    controller.pageIdx.value == 1 ? kMainColor : Colors.black,
              ),
              onPressed: () {
                controller.changePage(1);
              },
            );
          }),
          GetBuilder<HistoryPageController>(builder: (controller) {
            return IconButton(
              icon: SvgPicture.asset(
                "assets/icons/user-icon.svg",
                color:
                    controller.pageIdx.value == 2 ? kMainColor : Colors.black,
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
      title: const Text('Photomosaic',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w100)),
      centerTitle: true,
      elevation: 0,
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/heart_off.svg",
            color: Colors.white,
          ),
          padding: EdgeInsets.all(15.0),
          onPressed: () {},
        )
      ],
    );
  }
}
