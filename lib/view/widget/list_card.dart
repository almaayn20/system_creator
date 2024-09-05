import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:system_creator/view/widget/alert_dialog.dart';
import 'package:system_creator/view/widget/tap_bar.dart';
import 'package:system_creator/view/widget/text_button.dart';

import '../screens/company_features.dart';
import '../screens/company_management.dart';
import '../screens/features_screens/advertisement.dart';
import 'card.dart';
import 'icon_button.dart';

class CardListView extends StatelessWidget {
  final List<Map<String, dynamic>> cardDataList;

  CardListView({
    required this.cardDataList,
  });

  @override
  Widget build(BuildContext context) {
    Future<bool> confirmDeletion() async {
      return await showDialog(
        context: context,
        builder: (context) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: AlertDialog(
              title: const Text('حذف العنصر'),
              content: const Text('?هل أنت متأكد بحذف هذا العنصر'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: const Text('إلغاء'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: const Text('حذف'),
                ),
              ],
            ),
          );
        },
      );
    }

    return ListView.builder(
      itemCount: cardDataList.length,
      itemBuilder: (context, index) {
        Map<String, dynamic> cardData = cardDataList[index];

        return Dismissible(
          key: Key(index.toString()),
          //     direction: DismissDirection.endToStart,
          confirmDismiss: (direction) async {
            if (direction == DismissDirection.startToEnd) {
              AdvertisementBottomSheet().show(context);
              return false;
            } else if (direction == DismissDirection.endToStart) {
              bool confirmed = await confirmDeletion();
              if (confirmed) {
                return true;
              }
            }
          },
          background: Container(
            padding: const EdgeInsets.all(13),
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                colors: [
                  Colors.red,
                  Get.isDarkMode
                      ? Theme.of(context).colorScheme.onPrimary
                      : Theme.of(context).colorScheme.primary,
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'تعديل',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  'حذف',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          child: cardCustom([
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
          ]),
        );
      },
    );
  }
}
