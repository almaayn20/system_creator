import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:system_creator/view/widget/tap_bar.dart';

import '../screens/company_features.dart';
import '../screens/company_management.dart';
import 'card.dart';
import 'icon_button.dart';

class CardListView extends StatelessWidget {
  final List<Map<String, dynamic>> cardDataList;

  CardListView({
    required this.cardDataList,
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
          ),
        ]);
      },
    );
  }
}
