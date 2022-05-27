import 'package:firebase_auth/firebase_auth.dart';
import 'package:front/constants/color_constant.dart';
import 'package:front/constants/constatns.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:front/controller/main_controller.dart';
import 'package:front/screens/history/userHistory/components/zoom_in.dart';
import 'package:get/get.dart';

import 'package:image_picker/image_picker.dart';

class CardLayoutGrid extends StatelessWidget {
  const CardLayoutGrid({
    Key? key,
    required this.crossAxisCount,
    required this.items,
  }) : super(key: key);
  final int crossAxisCount;
  final List<dynamic> items;

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1,
        mainAxisSpacing: 1,
        crossAxisSpacing: 1,
      ),
      itemBuilder: (ctx, idx) {
        return GestureDetector(
            child: GetBuilder<MainController>(builder: (ctrl) {
          return Image.network(
            'http://$serverAdr/api/v1/object?pid=${items[idx]["pid"]}&uid=${ctrl.uid}',

            fit: BoxFit.fill,
            // headers: {"uid": items[idx]["uid"]!},
          );
        }), onTap: () {
          Get.to(() => GetBuilder<MainController>(builder: (ctrl) {
                return ZoomIn(
                    item:
                        'http://$serverAdr/api/v1/object?pid=${items[idx]["pid"]}&uid=${ctrl.uid}');
              }));
        });
      },

      // children: [for (var i = 0; i < items.length; i++) getImage(i)],
    );
  }

  Widget getImage(int idx) {
    final user = FirebaseAuth.instance.currentUser;
    return GetBuilder<MainController>(builder: (ctrl) {
      return Image.network(
        'http://$serverAdr/api/v1/object?pid=${items[idx]["pid"]}&uid={ctrl.user!.uid}',

        fit: BoxFit.fill,
        // headers: {"uid": items[idx]["uid"]!},
      );
    });
  }
}
