import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:system_creator/view/screens/management_screens/branches.dart';

import '../../controller/management_tab_controller .dart';
import '../widget/app_bar.dart';
import '../widget/icon_button.dart';
import '../widget/tap_bar.dart';
import 'management_screens/social_medial.dart';

class CompanyManagement extends StatelessWidget {
  CompanyManagement({super.key, required this.tabBarWidget});
  final TabBarWidget tabBarWidget;
  final ManagementTabController tabController =
      Get.put(ManagementTabController());
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: appBarCustom(
          leading: iconButtonCustom(
              func: () {
                Get.back();
              },
              icon: Icons.arrow_back),
          title: 'صانع التطبيقات',
          centertitle: true,
        ),
        body: tabBarWidget,
        floatingActionButton: Obx(() {
          final selectedTabIndex = tabController.selectedIndex.value;
          // Check if the selected tab index is 0 (or any other index where you want to hide the FAB)
          if (selectedTabIndex == 3 || selectedTabIndex == 2) {
            return const SizedBox
                .shrink(); // Hide the FAB by returning an empty SizedBox
          } else {
            return FloatingActionButton.extended(
              onPressed: () {
                // Add your onPressed logic here
                // This will only be called when the FAB is visible
                SocialMediaBottomSheet().show(context);
              },
              label: const Text('اضافة منصة جديده'),
              icon: const Icon(Icons.add),
            );
          }
        }),
      ),
    );
  }
}
