import 'package:get/get.dart';

class BranchTabController extends GetxController {
  var selectedIndex = 0.obs;

  void updateTabIndex(int index) {
    selectedIndex.value = index;
  }
}
