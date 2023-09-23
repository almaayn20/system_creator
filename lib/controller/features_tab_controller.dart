import 'package:get/get.dart';

class FeaturesTabController extends GetxController {
  var selectedIndex = 0.obs;

  void updateTabIndex(int index) {
    selectedIndex.value = index;
  }
}
