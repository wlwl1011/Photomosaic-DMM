import 'package:flutter/material.dart';
import 'package:front/constants/color_constant.dart';

class ZoomIn extends StatefulWidget {
  const ZoomIn({Key? key, required this.item}) : super(key: key);
  final String item;
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

  @override
  Widget build(BuildContext context) {
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
