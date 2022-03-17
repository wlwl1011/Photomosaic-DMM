import 'package:dio/dio.dart';
import 'package:get/state_manager.dart';
import 'package:image_picker/image_picker.dart';

class MainController extends GetxController {
  var list = [].obs;

  void loadList() async {
    var dio = Dio();
    print("http://${Uri.base.host}:${Uri.base.port}/api/v1/objectList");
    var resp = await dio.get(
      "http://${Uri.base.host}:${Uri.base.port}/api/v1/objectList",
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

  Upload(PickedFile imageFile) async {
    String fileName = imageFile.path.split('/').last;

    FormData data = FormData.fromMap({
      "file": await MultipartFile.fromFile(
        imageFile.path,
        filename: fileName,
      ),
    });

    Dio dio = new Dio();

    dio
        .post("http://${Uri.base.host}:${Uri.base.port}/api/v1/upload",
            data: data)
        .then((response) => print(response))
        .catchError((error) => print(error));
  }
}
