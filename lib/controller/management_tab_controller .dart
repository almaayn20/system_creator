import 'package:get/get.dart';

class ManagementTabController extends GetxController {
  var selectedIndex = 0.obs;

  void updateTabIndex(int index) {
    selectedIndex.value = index;
  }
}
