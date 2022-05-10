import 'package:front/constants/color_constant.dart';
import 'package:front/constants/constatns.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
            child: Image.network(
              'http://$serverAdr/api/v1/object?pid=${items[idx]["pid"]}',
              headers: const {
                "uid": "tmpuid",
              },
              fit: BoxFit.fill,
              // headers: {"uid": items[idx]["uid"]!},
            ),
            onTap: () {
              Get.to(() => ZoomIn(
                  item:
                      'http://$serverAdr/api/v1/object?pid=${items[idx]["pid"]}'));
            });
      },

      // children: [for (var i = 0; i < items.length; i++) getImage(i)],
    );
  }

  Widget getImage(int idx) {
    return Image.network(
      'http://$serverAdr/api/v1/object?pid=${items[idx]["pid"]}',
      headers: const {
        "uid": "tmpuid",
      },
      fit: BoxFit.fill,
      // headers: {"uid": items[idx]["uid"]!},
    );
  }
}
