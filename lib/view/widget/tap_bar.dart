import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tuple/tuple.dart';
import 'package:system_creator/controller/features_tab_controller.dart';

import '../../controller/branch_tab_controller.dart';
import '../../controller/management_tab_controller .dart';

class TabBarWidget extends StatelessWidget {
  final List<Widget> tabViews;
  final List<Tuple2<String, IconData>> tabs;
  final FeaturesTabController featuresTabController = Get.find();
  final ManagementTabController managementTabController = Get.find();
  final BranchTabController branchTabController = Get.find();
  final String callerScreen;

  TabBarWidget(
      {required this.tabs, required this.tabViews, required this.callerScreen});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Column(
        children: [
          TabBar(
            // isScrollable: true,
            tabs: [
              for (var tab in tabs)
                Tab(
                  text: tab.item1,
                  icon: Icon(tab.item2),
                  iconMargin: const EdgeInsets.only(bottom: 0.0),
                ),
            ],
            onTap: (value) {
              if (callerScreen == 'features') {
                featuresTabController.updateTabIndex(value);
              } else if (callerScreen == 'management') {
                managementTabController.updateTabIndex(value);
              } else {
                branchTabController.updateTabIndex(value);
              }
            },
          ),
          Expanded(
            child: TabBarView(
              children: tabViews,
            ),
          ),
        ],
      ),
    );
  }
}


//الاستدعاء
/*

 List<Tuple2<String, IconData>> tabsTitles = const [
    Tuple2('DOGS', Icons.favorite),
    Tuple2('CATS', Icons.music_note),
    Tuple2('BIRDS', Icons.search),
  ];

  body: TabBarWidget(
          tabController: _tabController,
          tabs: tabsTitles,
          tabViews: [
            page(context),
            page2(context),
            page(context),
          ],
        ),
*/