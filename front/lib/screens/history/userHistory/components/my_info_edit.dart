import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:front/screens/history/otherHistory/components/post_widget.dart';
import 'package:front/screens/history/userHistory/components/radial_progress.dart';
import 'package:front/screens/history/userHistory/components/rounded_image.dart';
import 'package:front/screens/login_register/widgets/my_text_field.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class MyInfoEdit extends StatefulWidget {
  const MyInfoEdit({Key? key}) : super(key: key);

  @override
  State<MyInfoEdit> createState() => _MyInfoEditState();
}

class _MyInfoEditState extends State<MyInfoEdit> {
  Widget _postList() {
    return Column(
      children: List.generate(50, (index) => PostWidget()).toList(),
    );
  }

  var albumImage;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('Edit profile',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w100)),
          actions: <Widget>[
            IconButton(
              icon: SvgPicture.asset(
                "assets/icons/ok.svg",
                color: Colors.white,
              ),
              padding: EdgeInsets.all(16.5),
              onPressed: () {
                //
              },
            )
          ],
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: Get.height * 0.15,
            ),
            const RoundedImage(
              imagePath: "assets/images/profile.jpeg",
              size: Size.fromWidth(70.0),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  child: const Text("Chanege profile photo",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold)),
                  onTap: () async {
                    var picker = ImagePicker();
                    var image =
                        await picker.pickImage(source: ImageSource.gallery);
                  },
                ),
              ],
            ),
            SizedBox(
              height: Get.height * 0.1,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: MyTextField(
                hintText: 'Name',
                inputType: TextInputType.name,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: MyTextField(
                hintText: 'Email',
                inputType: TextInputType.emailAddress,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: MyTextField(
                hintText: 'Phone',
                inputType: TextInputType.phone,
              ),
            ),
          ],
        ));
  }
}
