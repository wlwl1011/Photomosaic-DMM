import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:front/constants/color_constant.dart';
import 'package:front/screens/newProject/create_new_project.dart';
import 'package:get/get.dart';

class PrologNewProject extends StatefulWidget {
  PrologNewProject({Key? key}) : super(key: key);

  @override
  State<PrologNewProject> createState() => _PrologNewProjectState();
}

class _PrologNewProjectState extends State<PrologNewProject> {
  int _current = 0;

  Widget _userExplain() {
    return Container(
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
              "but you must need at least 1000 photos", //사진 개수는 차후 수정
              style: TextStyle(
                fontSize: 11,
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

  Widget _serverExplain() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            constraints: BoxConstraints(maxHeight: 180, maxWidth: 180),
            child: Image.asset(
              'assets/images/server_ex_image.png',
              fit: BoxFit.contain,
            ),
          ),
          Text(
            "Using Photos on the Server",
            style: TextStyle(
                fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Padding(
            padding: EdgeInsets.only(left: 64, right: 64, top: 16, bottom: 16),
            child: Text(
              "You can create a photomosaic image by using photos on the server",
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _createsExplain() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Let's Create",
            style: TextStyle(
                fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 64,
              right: 64,
              top: 16,
            ),
            child: Text(
              "Shall we go make a new photo mosaic?",
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            constraints: BoxConstraints(maxHeight: 180, maxWidth: 180),
            child: Image.asset(
              'assets/images/drawing.png',
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
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
          Container(
            child: CarouselSlider(
              items: [_userExplain(), _serverExplain(), _createsExplain()],
              //carouselController: _controller,
              options: CarouselOptions(
                  height: MediaQuery.of(context).size.height - 300,
                  initialPage: 0,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 2.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return GestureDetector(
                  child: Container(
                    width: 8.0,
                    height: 8.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 6.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (_current == index
                            ? kHotpink
                            : kBottomIcon.withOpacity(0.8))),
                  ),
                );
              }).toList(),
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {
              Get.to(CreateNewProject());
            },
            icon: Icon(
              Icons.photo,
            ),
            label: Text("Create Photomosaic"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _newProjectBodyWidget(),
    );
  }
}
