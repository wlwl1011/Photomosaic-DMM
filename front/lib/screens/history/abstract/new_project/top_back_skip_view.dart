import 'package:flutter/material.dart';

class TopBackSkipView extends StatelessWidget {
  final AnimationController animationController;
  final VoidCallback onBackClick;
  final VoidCallback onSkipClick;
  const TopBackSkipView(
      {Key? key,
      required this.animationController,
      required this.onBackClick,
      required this.onSkipClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
