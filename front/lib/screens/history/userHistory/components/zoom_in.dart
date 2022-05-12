import 'dart:io';

import 'package:flutter/material.dart';
import 'package:front/constants/color_constant.dart';
import 'package:front/controller/main_controller.dart';
import 'package:get/get.dart';

class ZoomIn extends StatefulWidget {
  ZoomIn({Key? key, this.item}) : super(key: key);
  var item;
  @override
  State<ZoomIn> createState() => _ZoomInState();
}

class _ZoomInState extends State<ZoomIn> with SingleTickerProviderStateMixin {
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

  Widget deleteImage(BuildContext context) {
    //File deleteImage = widget.item;
    return GetBuilder<MainController>(
      builder: (controller) {
        print("Build!!");
        return IconButton(
          onPressed: () => {controller.Delete(widget.item)},
          icon: const Icon(
            Icons.delete_rounded,
            color: kHotpink,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    print("Zoom in");
    print(widget.item);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        actions: <Widget>[
          deleteImage(context),
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
                    child: Image.network(widget.item, fit: BoxFit.fill)),
              ),
              onDoubleTapDown: (details) => tapDownDetails = details,
              onDoubleTap: () {
                final position = tapDownDetails!.localPosition;

                final double scale = 3;
                final x = -position.dx * (scale - 1);
                final y = -position.dy * (scale - 1);
                final zoomed = Matrix4.identity()
                  ..translate(x, y)
                  ..scale(scale);
                final value =
                    controller.value.isIdentity() ? zoomed : Matrix4.identity();
                controller.value = value;
              }),
        ),
      ),
    );
  }
}
