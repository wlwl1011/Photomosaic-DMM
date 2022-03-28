import 'package:flutter/material.dart';
import 'package:front/constants/color_constant.dart';
import 'package:front/screens/history/abstract/new_project/center_next_button.dart';
import 'package:front/screens/history/abstract/new_project/create_project_explain.dart';
import 'package:front/screens/history/abstract/new_project/server_image_explain.dart';
import 'package:front/screens/history/abstract/new_project/top_back_skip_view.dart';
import 'package:front/screens/history/abstract/new_project/user_image_explain.dart';
import 'package:get/get.dart';

class NewProjectScreen extends StatefulWidget {
  NewProjectScreen({Key? key}) : super(key: key);

  @override
  State<NewProjectScreen> createState() => _NewProjectScreenState();
}

class _NewProjectScreenState extends State<NewProjectScreen>
    with TickerProviderStateMixin {
  AnimationController? _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 8));
    _animationController?.animateTo(0.0);
    super.initState();
  }

  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    print(_animationController?.value);
    return Scaffold(
        backgroundColor: kGreyColor,
        body: ClipRect(
          child: Stack(
            children: [
              UserImageExplain(
                animationController: _animationController!,
              ),
              ServerImageExplain(
                animationController: _animationController!,
              ),
              CreateProjectExplain(
                animationController: _animationController!,
              ),
              TopBackSkipView(
                  animationController: _animationController!,
                  onBackClick: _onBackClick,
                  onSkipClick: _onSkipClick),
              CenterNextButton(
                  animationController: _animationController!,
                  onNextClick: _onNextClick),
            ],
          ),
        ));
  }

  void _onSkipClick() {
    _animationController?.animateTo(0.8,
        duration: Duration(milliseconds: 1200));
  }

  void _onBackClick() {
    if (_animationController!.value >= 0 &&
        _animationController!.value <= 0.2) {
      _animationController?.animateTo(0.0);
    } else if (_animationController!.value > 0.2 &&
        _animationController!.value <= 0.4) {
      _animationController?.animateTo(0.2);
    } else if (_animationController!.value > 0.4 &&
        _animationController!.value <= 0.6) {
      _animationController?.animateTo(0.4);
    }
    //아마 여기까지 일듯,,?
    else if (_animationController!.value > 0.6 &&
        _animationController!.value <= 0.8) {
      _animationController?.animateTo(0.6);
    }
    //여기~~
    else if (_animationController!.value > 0.8 &&
        _animationController!.value <= 1.0) {
      _animationController?.animateTo(0.8);
    }
  }

  void _onNextClick() {
    if (_animationController!.value >= 0 &&
        _animationController!.value <= 0.2) {
      _animationController?.animateTo(0.4);
    } else if (_animationController!.value > 0.2 &&
        _animationController!.value <= 0.4) {
      //_animationController?.animateTo(0.6);
      _signUpClick();
    }
    //아마 여기이지 않을까,,

    else if (_animationController!.value > 0.4 &&
        _animationController!.value <= 0.6) {
      _animationController?.animateTo(0.8);
    }
    //여기~~
    else if (_animationController!.value > 0.6 &&
        _animationController!.value <= 0.8) {
      _signUpClick();
    }
  }

  void _signUpClick() {
    Navigator.pop(context);
    //Get.to("선택창()"); 아마 이러면 될듯
  }
}
