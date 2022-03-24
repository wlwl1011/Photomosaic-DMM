import 'package:get/get.dart';

class TrendingController extends GetxController {
  var pageIdx = 0.obs;
  var trending = <int>[];
  void changePage(int _pageIdx) {
    trending.add(pageIdx.value);
    pageIdx.value = _pageIdx;
    update();
  }
}
