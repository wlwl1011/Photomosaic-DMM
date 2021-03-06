import 'package:get/get.dart';

class HistoryPageController extends GetxController {
  var pageIdx = 0.obs;
  var history = <int>[];
  void changePage(int _pageIdx) {
    history.add(pageIdx.value);
    pageIdx.value = _pageIdx;
    update();
  }
}
