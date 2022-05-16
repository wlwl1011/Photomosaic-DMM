import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:front/constants/constatns.dart';
import 'package:get/state_manager.dart';

class MainController extends GetxController {
  var list = [].obs;

  void loadList() async {
    var dio = Dio();

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

  Future<void> Save(String pid) async {
    Dio dio = Dio();

    var body = <String, dynamic>{
      "pid": pid,
      "uid": "tmpuid",
    };

    await dio
        .put("http://$serverAdr/api/v1/photomosaic/save",
            options: Options(
              headers: {
                "content-type": "application/json",
              },
            ),
            data: jsonEncode(body))
        .then((response) {
      loadList();
    }).catchError((error) => print(error));
  }

  Future<String> Upload(var imageFile) async {
    print(imageFile);
    print(imageFile.path);
    String fileName = imageFile.path.split('/').last;

    FormData data = FormData.fromMap({
      "files": await MultipartFile.fromFile(
        imageFile.path,
        filename: fileName,
      ),
    });

    Dio dio = Dio();

    var resp = await dio
        .post("http://$serverAdr/api/v1/photomosaic/create", data: data)
        .then((response) {
      loadList();
      return response;
    }).catchError((error) => print(error));

    if (resp.statusCode == 201) {
      return resp.data as String;
    } else {
      return "error";
    }
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

    Dio dio = Dio();
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
