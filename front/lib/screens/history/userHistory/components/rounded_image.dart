import 'package:flutter/material.dart';

class RoundedImage extends StatelessWidget {
  final String imagePath;
  final Size size;

  RoundedImage({
    Key? key,
    required this.imagePath,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.asset(
        imagePath,
        width: size.width,
        height: size.width,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
