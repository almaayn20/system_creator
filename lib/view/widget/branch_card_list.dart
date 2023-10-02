import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:system_creator/model/api_handler/branch_management.dart';
import 'package:system_creator/view/widget/tap_bar.dart';

import '../screens/branch_management_screen.dart';
import '../screens/company_features.dart';
import '../screens/company_management.dart';
import 'card.dart';
import 'icon_button.dart';

class BranchCardListView extends StatelessWidget {
  final List<Map<String, dynamic>> cardDataList;
  final List<TabBarWidget> tabs;

  BranchCardListView({
    required this.cardDataList,
    required this.tabs,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cardDataList.length,
      itemBuilder: (context, index) {
        Map<String, dynamic> cardData = cardDataList[index];

        return cardCustom([
          ListTile(
            leading: ClipOval(
              child: Image.network(cardData['imageUrl']),
            ),
            title: Text(cardData['title']),
            subtitle: Text(cardData['subtitle']),
            onTap: () {
              // Handle tap on this card
            },
            trailing: iconButtonCustom(
              func: () {
                Get.to(BranchManagementScreen(tabBarWidget: tabs[index]));
              },
              icon: Icons.settings,
            ),
          ),
        ]);
      },
    );
  }
}
