import 'package:flutter_svg/flutter_svg.dart';
import 'package:front/constants/color_constant.dart';
import 'package:front/controller/main_controller.dart';
import 'package:front/screens/history/userHistory/components/card_layout_grid.dart';
import 'package:front/screens/history/userHistory/components/my_info.dart';
import 'package:flutter/material.dart';
import 'package:front/screens/history/userHistory/components/my_info_edit.dart';
import 'package:get/get.dart';
import 'package:front/constants/constatns.dart';
import 'package:image_picker/image_picker.dart';

class UserHistoryPage extends StatelessWidget {
  const UserHistoryPage({
    Key? key,
  }) : super(key: key);
  //final ImagePicker _picker = ImagePicker();
  // Future getImageFromGallery(MainController controller) async {
  //   var image =
  //       await ImagePicker.platform.pickImage(source: ImageSource.gallery);
  //   if (image == null || image.path == null) return null;
  //   controller.Upload(image);
  // }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const MyInfo(),
            SizedBox(
              height: Get.height * 0.04,
            ),
            _editButton(),
            SizedBox(
              height: Get.height * 0.1,
            ),
            buildAlbum(context),
          ],
        ),
      ),
    );
  }
}

Widget _editButton() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30.0),
    child: Row(
      children: [
        Expanded(
            child: GestureDetector(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                border: Border.all(
                  color: const Color(0xffdedede),
                )),
            child: const Text(
              'Edit profile',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          onTap: () {
            Get.to(() => const MyInfoEdit());
          },
        ))
      ],
    ),
  );
}

Widget buildAlbum(BuildContext context) {
  return GetBuilder<MainController>(
    builder: (controller) {
      print("Build!!");
      return CardLayoutGrid(crossAxisCount: 3, items: controller.list);
    },
  );
}
