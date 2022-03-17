import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

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
    return MasonryGridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 12,
      itemCount: items.length,
      itemBuilder: (ctx, idx) => getImage(idx),

      // children: [for (var i = 0; i < items.length; i++) getImage(i)],
    );
  }

  Widget getImage(int idx) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        child: Image.network(
          'http://${Uri.base.host}:${Uri.base.port}/api/v1/object?pid=${items[idx]["pid"]}',
          headers: {
            "uid": "tmpuid",
          },
          // headers: {"uid": items[idx]["uid"]!},
        ),
      ),
    );
  }
}
