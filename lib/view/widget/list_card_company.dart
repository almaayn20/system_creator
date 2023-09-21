import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:system_creator/view/widget/tap_bar.dart';

import '../screens/company_features.dart';
import '../screens/company_management.dart';
import 'card.dart';
import 'icon_button.dart';

class CompanyCardListView extends StatelessWidget {
  final List<Map<String, dynamic>> cardDataList;
  final List<TabBarWidget> featuresTabs;
  final List<TabBarWidget> managementTabs;

  CompanyCardListView({
    required this.cardDataList,
    required this.featuresTabs,
    required this.managementTabs,
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
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                iconButtonCustom(
                  func: () {
                    Get.to(CompanyFeatures(tabBarWidget: featuresTabs[index]));
                  },
                  icon: Icons.add,
                ),
                const SizedBox(width: 12.0),
                iconButtonCustom(
                  func: () {
                    Get.to(
                        CompanyManagement(tabBarWidget: managementTabs[index]));
                  },
                  icon: Icons.settings,
                ),
              ],
            ),
          ),
        ]);
      },
    );
  }
}
