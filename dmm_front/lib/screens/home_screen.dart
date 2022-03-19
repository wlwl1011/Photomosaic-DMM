import 'package:dmm_front/components/card_layout_grid.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dmm_front/constants/color_constant.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import '../controller/main_controller.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ImagePicker _picker = ImagePicker();

  Future getImageFromGallery(MainController controller) async {
    var image =
        await ImagePicker.platform.pickImage(source: ImageSource.gallery);

    if (image == null || image.path == null) return null;

    controller.Upload(image);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.only(left: 25, top: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Hi, Minji', //로그인 화면에서 사용자 정보 받아와서 처리하면 될 듯
                      style: GoogleFonts.openSans(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: kGreyColor),
                    ),
                    Text(
                      'Make your Diary',
                      style: GoogleFonts.openSans(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: kBlackColor),
                    ),
                  ],
                )),
            Container(
              height: 39,
              margin: const EdgeInsets.only(left: 25, right: 25, top: 18),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: kLightGreyColor),
              child: Stack(
                children: <Widget>[
                  TextField(
                    maxLengthEnforced: true,
                    style: GoogleFonts.openSans(
                        fontSize: 12,
                        color: kBlackColor,
                        fontWeight: FontWeight.w600),
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(
                            left: 19, right: 50, bottom: 8),
                        border: InputBorder.none,
                        hintText: 'Search Library..',
                        hintStyle: GoogleFonts.openSans(
                            fontSize: 12,
                            color: kGreyColor,
                            fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, top: 25),
              child: Text(
                'Yor History',
                style: GoogleFonts.openSans(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: kBlackColor),
              ),
            ),
            Container(
              height: 150, //향후 사진을 resize하여 해당 크기로 맞추면 좋을 듯함.
              margin: const EdgeInsets.only(left: 25, right: 25, top: 18),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  color: kLightGreyColor),
              child: GetBuilder<MainController>(
                builder: (controller) {
                  print("Build!!");
                  return CardLayoutGrid(
                      crossAxisCount: 2, items: controller.list);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: GetBuilder(
        builder: (MainController controller) {
          return FloatingActionButton(
            onPressed: () => {getImageFromGallery(controller)},
            tooltip: 'upload',
            child: const Icon(Icons.add),
          );
        },
      ),
    );
  }
}
