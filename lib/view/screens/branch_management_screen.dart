import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/branch_tab_controller.dart';
import '../../controller/features_tab_controller.dart';
import '../widget/app_bar.dart';

import '../widget/icon_button.dart';
import '../widget/tap_bar.dart';
import 'features_screens/notifications.dart';
import 'management_screens/branch_management_screens/banks.dart';
import 'management_screens/branch_management_screens/managers.dart';

class BranchManagementScreen extends StatelessWidget {
  BranchManagementScreen({super.key, required this.tabBarWidget});
  final TabBarWidget tabBarWidget;
  final BranchTabController tabController = Get.find();

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
          if (selectedTabIndex == 2) {
            return const SizedBox.shrink();
          } else {
            return FloatingActionButton.extended(
              onPressed: () {
                tabController.selectedIndex.value == 0
                    ? ManagersBottomSheet().show(context)
                    : BanksBottomSheet().show(context);
              },
              label: tabController.selectedIndex.value == 0
                  ? const Text('اضافة مدير جديد')
                  : const Text('اضافة بنك جديد'),
              icon: const Icon(Icons.add),
            );
          }
        }),
      ),
    );
  }
}
