import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/color_constant.dart';

class MyPasswordField extends StatelessWidget {
  const MyPasswordField({
    Key? key,
    required this.isPasswordVisible,
    required this.onTap,
    required this.controller,
  }) : super(key: key);

  final bool isPasswordVisible;
  final Function onTap;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: Get.width * 0.7,
        height: Get.height * 0.06,
        child: TextField(
          controller: controller,
          style: kBodyText.copyWith(
            color: Colors.black,
          ),
          obscureText: isPasswordVisible,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            suffixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: IconButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: onTap as void Function()?,
                icon: Icon(
                  isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                ),
              ),
            ),
            contentPadding: EdgeInsets.all(10),
            hintText: 'Password',
            hintStyle: kBodyText4,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
