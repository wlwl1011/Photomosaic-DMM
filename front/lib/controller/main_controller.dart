import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:front/constants/constatns.dart';
import 'package:get/state_manager.dart';
import 'package:image_picker/image_picker.dart';

class MainController extends GetxController {
  var list = [].obs;

  void loadList() async {
    var dio = Dio();
    print("http://$serverAdr/api/v1/objectList");

    var resp = await dio.get(
      "http://$serverAdr/api/v1/objectList",
      options: Options(
        headers: {"uid": "tmpuid"},
      ),
    );
    print(resp.data);
    list.value = resp.data;
    update();
    // jsonDecode(source)
  }

  MainController() {
    loadList();
  }

  Upload(var imageFile) async {
    print("Upload");
    print(imageFile);
    print(imageFile.path);
    String fileName = imageFile.path.split('/').last;

    FormData data = FormData.fromMap({
      "files": await MultipartFile.fromFile(
        imageFile.path,
        filename: fileName,
      ),
    });

    Dio dio = new Dio();

    dio.post("http://$serverAdr/api/v1/upload", data: data).then((response) {
      print(response);
      loadList();
    }).catchError((error) => print(error));
  }

  Future<bool> Delete(String imageUrl, VoidCallback callback) async {
    print("Delete");
    print(imageUrl);
    var idx = imageUrl.lastIndexOf("pid=");
    var pid = imageUrl.substring(idx + 4);

    if (pid.isEmpty) {
      return false;
    }

    var uid = "tmpuid";

    Dio dio = new Dio();
    dio.delete("http://$serverAdr/api/v1/delete",
        queryParameters: <String, dynamic>{
          "pid": pid,
        }).then(
      (response) {
        print(response);
        callback();
        loadList();
      },
    ).catchError((error) => print(error));

    return true;
    // String fileName = imageFile.path.split('/').last;

    // FormData data = FormData.fromMap({
    //   "files": await MultipartFile.fromFile(
    //     imageFile.path,
    //     filename: fileName,
    //   ),
    // });
  }
}
