import 'package:dio/dio.dart';
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

  Delete(var imageFile) async {
    print("Delete");
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
}
