import 'package:flutter_svg/flutter_svg.dart';
import 'package:front/constants/color_constant.dart';
import 'package:front/screens/history/userHistory/components/my_info.dart';
import 'package:flutter/material.dart';
import 'package:front/screens/history/userHistory/components/my_info_edit.dart';
import 'package:get/get.dart';
import 'package:front/constants/constatns.dart';

class UserHistoryPage extends StatefulWidget {
  @override
  State<UserHistoryPage> createState() => _UserHistoryPageState();
}

class _UserHistoryPageState extends State<UserHistoryPage>
    with SingleTickerProviderStateMixin {
  late TransformationController controller;
  TapDownDetails? tapDownDetails;

  late AnimationController animationController;
  Animation<Matrix4>? animation;

  @override
  void initState() {
    super.initState();
    controller = TransformationController();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    animationController.dispose();
    super.dispose();
  }

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
            _tabView(),
          ],
        ),
      ),
    );
  }

  final items = [
    'https://ifh.cc/g/fnQ7MR.png',
    'https://ifh.cc/g/dfsTDy.png',
    'https://ifh.cc/g/gkj6Jt.jpg',
  ];

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

  Widget _tabView() {
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
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];
          return GestureDetector(
            child: Image.network(
                'http://$serverAdr/api/v1/object?pid=${items[index][0]}',
                headers: const {
                  "uid": "tmpuid",
                },
                fit: BoxFit.fill),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return Scaffold(
                    appBar: AppBar(
                      elevation: 0,
                      backgroundColor: Colors.black,
                      actions: <Widget>[
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.delete_rounded,
                            color: kHotpink,
                          ),
                        ),
                      ],
                    ),
                    backgroundColor: Colors.black,
                    body: Container(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: GestureDetector(
                            child: InteractiveViewer(
                              clipBehavior: Clip.none,
                              transformationController: controller,
                              panEnabled: false,
                              scaleEnabled: false,
                              child: AspectRatio(
                                  aspectRatio: 1,
                                  child: Image.network(item, fit: BoxFit.fill)),
                            ),
                            onDoubleTapDown: (details) =>
                                tapDownDetails = details,
                            onDoubleTap: () {
                              final position = tapDownDetails!.localPosition;

                              final double scale = 3;
                              final x = -position.dx * (scale - 1);
                              final y = -position.dy * (scale - 1);
                              final zoomed = Matrix4.identity()
                                ..translate(x, y)
                                ..scale(scale);
                              final value = controller.value.isIdentity()
                                  ? zoomed
                                  : Matrix4.identity();
                              controller.value = value;
                            }),
                      ),
                    ),
                  );
                }),
              );
            },
          );

          // Navigator.of(context).push(
          //   MaterialPageRoute(builder: (context) {
          //     return Scaffold(
          //       appBar: AppBar(
          //         backgroundColor: Colors.white,
          //       ),
          //       backgroundColor: Colors.white,
          //       body: const Text(
          //         'Image',
          //         style: TextStyle(
          //           color: Colors.black,
          //           fontSize: 14,
          //           fontWeight: FontWeight.bold,
          //         ),
          //       ),
          //     );
          //   }),
          // );
        });
  }
}
