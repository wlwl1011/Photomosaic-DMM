import 'package:flutter/material.dart';
import 'package:front/constants/color_constant.dart';

class PrologNewProject extends StatefulWidget {
  PrologNewProject({Key? key}) : super(key: key);

  @override
  State<PrologNewProject> createState() => _PrologNewProjectState();
}

class _PrologNewProjectState extends State<PrologNewProject> {
  late Size size;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    size = MediaQuery.of(context).size;
  }

  Widget _newProjectBodyWidget() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          //colorFilter:
          //    ColorFilter.mode(Colors.black.withOpacity(1), BlendMode.dstATop),
          image: AssetImage(
              'assets/images/prolog_new_project_background_image.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Using User's Photos",
            style: TextStyle(
                fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Padding(
            padding: EdgeInsets.only(left: 64, right: 64, top: 16),
            child: Text(
              "You can create Photomosaic image by using your photos,",
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: Text(
              "but you must need at least ###photos",
              style: TextStyle(
                color: kBottomIcon,
                //color: Colors.white,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.double,
              ),
            ),
          ),
          Container(
            constraints: BoxConstraints(maxHeight: 180, maxWidth: 180),
            child: Image.asset(
              'assets/images/user_ex_image.png',
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _newProjectBodyWidget(),
    );
  }
}
