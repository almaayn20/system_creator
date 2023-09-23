import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/features_tab_controller.dart';
import '../widget/app_bar.dart';

import '../widget/icon_button.dart';
import '../widget/tap_bar.dart';
import 'features_screens/advertisement.dart';
import 'features_screens/notifications.dart';

class CompanyFeatures extends StatelessWidget {
  CompanyFeatures({super.key, required this.tabBarWidget});
  final TabBarWidget tabBarWidget;
  final FeaturesTabController tabController = Get.find();

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
          return FloatingActionButton.extended(
            onPressed: () {
              tabController.selectedIndex.value == 0
                  ? AdvertisementBottomSheet().show(context)
                  : NotificationsBottomSheet().show(context);
            },
            label: tabController.selectedIndex.value == 0
                ? const Text('اضافة إعلان جديد')
                : const Text('اضافة إشعار جديد'),
            icon: const Icon(Icons.add),
          );
        }),
      ),
    );
  }
}
