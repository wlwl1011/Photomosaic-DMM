import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HistoryPageController extends GetxController {
  var pageIdx = 0.obs;
  var history = <int>[];
  void changePage(int _pageIdx) {
    history.add(pageIdx.value);
    pageIdx.value = _pageIdx;
    update();
  }
}
