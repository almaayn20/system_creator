import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:system_creator/view/widget/tap_bar.dart';

import '../screens/company_features.dart';
import '../screens/company_management.dart';
import 'card.dart';
import 'icon_button.dart';

ListView listCard(List<Map<String, dynamic>> cardDataList,
    List<TabBarWidget> featuresTabs, List<TabBarWidget> managementTabs) {
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
              //implement first add,settings features and send them here
              iconButtonCustom(
                  func: () {
                    Get.to(CompanyFeatures(tabBarWidget: featuresTabs[index]));
                  },
                  icon: Icons.add),
              const SizedBox(width: 12.0),
              iconButtonCustom(
                  func: () {
                    Get.to(
                        CompanyManagement(tabBarWidget: managementTabs[index]));
                  },
                  icon: Icons.settings),
            ],
          ),
        ),
      ]);
    },
  );
}
