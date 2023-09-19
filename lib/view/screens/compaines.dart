import 'package:flutter/material.dart';
import 'package:system_creator/services/size_config.dart';
import 'package:system_creator/view/screens/login.dart';
import 'package:system_creator/view/screens/settings.dart';
import 'package:get/get.dart';
import 'package:system_creator/view/widget/card.dart';

import '../widget/app_bar.dart';
import '../widget/icon_button.dart';
import '../widget/list_view.dart';

class Companies extends StatelessWidget {
  Companies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Settings();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: appBarCustom(
          leading: iconButtonCustom(
              func: () {}, icon: Icons.account_circle_outlined),
          actions: [
            iconButtonCustom(
                func: () {
                  Get.to(Settings());
                },
                icon: Icons.settings),
          ],
          title: 'صانع التطيبقات',
          centertitle: true,
        ),
        body: ListView(children: [
          cardCustom([
            ListTile(
              leading: ClipOval(
                  child: Image.network(
                      'https://upload.wikimedia.org/wikipedia/sco/thumb/b/bf/KFC_logo.svg/2048px-KFC_logo.svg.png')),
              title: const Text('مطاعم الدار'),
              subtitle: const Text('2 فروع'),
              onTap: () {
                // Handle tap on this card
              },
              trailing: Row(
                mainAxisSize:
                    MainAxisSize.min, // Ensure icons don't take up extra space
                children: [
                  iconButtonCustom(func: () {}, icon: Icons.add),
                  const SizedBox(width: 12.0), // Add spacing between the icons
                  iconButtonCustom(func: () {}, icon: Icons.settings),
                ],
              ),
            ),
          ]),
        ]),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Get.to(Login()); //change this when completing add company screen
          },
          label: const Text('اضافة شركة جديدة'),
          icon: const Icon(Icons.add),
        ),
      ),
    );
  }
}
