import 'package:flutter/material.dart';
import 'package:system_creator/main.dart';
import 'package:system_creator/services/size_config.dart';
import 'package:system_creator/view/screens/create_company_first_screen.dart';
import 'package:system_creator/view/screens/features_screens/advertisement.dart';
import 'package:system_creator/view/screens/login.dart';
import 'package:system_creator/view/screens/settings.dart';
import 'package:get/get.dart';
import 'package:system_creator/view/widget/card.dart';
import 'package:tuple/tuple.dart';

import '../widget/app_bar.dart';
import '../widget/icon_button.dart';
import '../widget/list_Card.dart';
import '../widget/list_card_company.dart';
import '../widget/list_view.dart';
import '../widget/tap_bar.dart';

class Companies extends StatelessWidget {
  Companies({Key? key}) : super(key: key);

  List<Map<String, dynamic>> cardDataList = [
    {
      'imageUrl':
          'https://upload.wikimedia.org/wikipedia/sco/thumb/b/bf/KFC_logo.svg/2048px-KFC_logo.svg.png',
      'title': 'مطاعم الدار',
      'subtitle': '2 فروع',
    },
    {
      'imageUrl':
          'https://upload.wikimedia.org/wikipedia/sco/thumb/b/bf/KFC_logo.svg/2048px-KFC_logo.svg.png',
      'title': 'مطاعم الدار',
      'subtitle': '2 فروع',
    },
    // Add more data objects here...
  ];

  List<Map<String, dynamic>> ads = [
    {
      'imageUrl':
          'https://upload.wikimedia.org/wikipedia/sco/thumb/b/bf/KFC_logo.svg/2048px-KFC_logo.svg.png',
      'title': 'تاريخ البدء : 21/9/2023',
      'subtitle': 'تاريخ الإنتهاء : 28/9/2023',
    },
    {
      'imageUrl':
          'https://upload.wikimedia.org/wikipedia/sco/thumb/b/bf/KFC_logo.svg/2048px-KFC_logo.svg.png',
      'title': 'تاريخ البدء : 21/9/2023',
      'subtitle': 'تاريخ الإنتهاء : 28/9/2023',
    },
    // Add more data objects here...
  ];

  List<Tuple2<String, IconData>> tabsTitles = const [
    Tuple2('الإعلانات', Icons.add_a_photo_outlined),
    Tuple2('الإشعارات', Icons.notification_add_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context)
        .textTheme
        .apply(displayColor: Theme.of(context).colorScheme.onSurface);
    SizeConfig().init(context);
    Settings();
    final fea = [
      TabBarWidget(
        tabs: tabsTitles,
        tabViews: [
          Advertisement(
            adsList: CardListView(
              cardDataList: ads,
            ),
          ),
          Scaffold(),
        ],
      ),
    ];
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
          title: 'صانع التطبيقات',
          centertitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text('شركــاتي', style: textTheme.bodyLarge),
              Expanded(
                  child: CompanyCardListView(
                cardDataList: cardDataList,
                featuresTabs: fea,
                managementTabs: fea,
              )),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Get.to(() => CreateCompanyFirstScreen());
          },
          label: const Text('اضافة شركة جديدة'),
          icon: const Icon(Icons.add),
        ),
      ),
    );
  }
}
