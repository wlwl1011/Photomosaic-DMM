import 'package:flutter/material.dart';

class UserImageExplain extends StatefulWidget {
  final AnimationController animationController;
  const UserImageExplain({Key? key, required this.animationController})
      : super(key: key);

  _UserImageExplainState createState() => _UserImageExplainState();
}

class _UserImageExplainState extends State<UserImageExplain> {
  @override
  Widget build(BuildContext context) {
    final _firstHalfAnimation =
        Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0)).animate(
      CurvedAnimation(
        parent: widget.animationController,
        curve: Interval(
          0.0,
          0.2,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );

    final _secondHalfAnimation =
        Tween<Offset>(begin: Offset(0, 0), end: Offset(-1, 0)).animate(
      CurvedAnimation(
        parent: widget.animationController,
        curve: Interval(
          0.2,
          0.4,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );

    final _textAnimation =
        Tween<Offset>(begin: Offset(0, 0), end: Offset(-2, 0)).animate(
      CurvedAnimation(
        parent: widget.animationController,
        curve: Interval(
          0.2,
          0.4,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );

    final _imageAnimation =
        Tween<Offset>(begin: Offset(0, 0), end: Offset(-4, 0)).animate(
      CurvedAnimation(
        parent: widget.animationController,
        curve: Interval(
          0.2,
          0.4,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );

    final _userImageExplainAnimation =
        Tween<Offset>(begin: Offset(0, -2), end: Offset(0, 0)).animate(
      CurvedAnimation(
        parent: widget.animationController,
        curve: Interval(
          0.2,
          0.4,
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );

    return SlideTransition(
      position: _firstHalfAnimation,
      child: SlideTransition(
        position: _secondHalfAnimation,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 100),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SlideTransition(
              position: _userImageExplainAnimation,
              child: Text(
                "Using User Photos",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
            ),
            SlideTransition(
              position: _textAnimation,
              child: Padding(
                padding:
                    EdgeInsets.only(left: 64, right: 64, top: 16, bottom: 16),
                child: Text(
                  "You can create Photomosaic image by using your photos",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SlideTransition(
              position: _imageAnimation,
              child: Container(
                  constraints: BoxConstraints(maxWidth: 350, maxHeight: 350),
                  child: Image.asset(
                    "assets/images/userImageExplain.png",
                    fit: BoxFit.contain,
                  )),
            ),
          ]),
        ),
      ),
    );
  }
}
