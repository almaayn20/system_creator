import 'package:flutter/material.dart';
import 'package:system_creator/controller/management_tab_controller%20.dart';
import 'package:system_creator/main.dart';
import 'package:system_creator/services/size_config.dart';
import 'package:system_creator/view/screens/create_company_first_screen.dart';
import 'package:system_creator/view/screens/features_screens/advertisement.dart';
import 'package:system_creator/view/screens/features_screens/notifications.dart';
import 'package:system_creator/view/screens/login.dart';
import 'package:system_creator/view/screens/management_screens/branch_management_screens/banks.dart';
import 'package:system_creator/view/screens/management_screens/branch_management_screens/buessiness_hours.dart';
import 'package:system_creator/view/screens/management_screens/branch_management_screens/managers.dart';
import 'package:system_creator/view/screens/management_screens/branches.dart';
import 'package:system_creator/view/screens/management_screens/info.dart';
import 'package:system_creator/view/screens/management_screens/social_medial.dart';
import 'package:system_creator/view/screens/management_screens/updates.dart';
import 'package:system_creator/view/screens/settings.dart';
import 'package:get/get.dart';
import 'package:system_creator/view/widget/card.dart';
import 'package:tuple/tuple.dart';

import '../../controller/branch_tab_controller.dart';
import '../../controller/features_tab_controller.dart';
import '../widget/app_bar.dart';
import '../widget/branch_card_list.dart';
import '../widget/icon_button.dart';
import '../widget/list_Card.dart';
import '../widget/list_card_company.dart';
import '../widget/list_view.dart';
import '../widget/tap_bar.dart';

class Companies extends StatelessWidget {
  Companies({Key? key}) : super(key: key);
  final FeaturesTabController tabController = Get.put(FeaturesTabController());
  final ManagementTabController tabController2 =
      Get.put(ManagementTabController());
  final BranchTabController branchTabController =
      Get.put(BranchTabController());

  List<Map<String, dynamic>> cardDataList = [
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

  List<Map<String, dynamic>> branches = [
    {
      'imageUrl':
          'https://upload.wikimedia.org/wikipedia/sco/thumb/b/bf/KFC_logo.svg/2048px-KFC_logo.svg.png',
      'title': 'الفرع 1',
      'subtitle': ' ',
    },
    {
      'imageUrl':
          'https://upload.wikimedia.org/wikipedia/sco/thumb/b/bf/KFC_logo.svg/2048px-KFC_logo.svg.png',
      'title': 'الفرع 2',
      'subtitle': ' ',
    },
    // Add more data objects here...
  ];

  List<Map<String, dynamic>> socialMedial = [
    {
      'imageUrl':
          'https://upload.wikimedia.org/wikipedia/sco/thumb/b/bf/KFC_logo.svg/2048px-KFC_logo.svg.png',
      'title': 'فيسبوك',
      'subtitle': 'http://www.',
    },
    {
      'imageUrl':
          'https://upload.wikimedia.org/wikipedia/sco/thumb/b/bf/KFC_logo.svg/2048px-KFC_logo.svg.png',
      'title': 'يوتيوب',
      'subtitle': 'http://www.',
    },
    // Add more data objects here...
  ];

  List<Map<String, dynamic>> notificatios = [
    {
      'imageUrl':
          'https://upload.wikimedia.org/wikipedia/sco/thumb/b/bf/KFC_logo.svg/2048px-KFC_logo.svg.png',
      'title': 'العنوان : عروض خاصة',
      'body': 'المحتوى : تصفح الآن قائمة عروضنا بمناسبة الشهر الكريم',
    },

    {
      'imageUrl':
          'https://upload.wikimedia.org/wikipedia/sco/thumb/b/bf/KFC_logo.svg/2048px-KFC_logo.svg.png',
      'title': 'العنوان : عروض خاصة',
      'body': 'المحتوى : تصفح الآن قائمة عروضنا بمناسبة الشهر الكريم',
    },
    // Add more data objects here...
  ];

  List<Map<String, dynamic>> managers = [
    {
      'imageUrl':
          'https://upload.wikimedia.org/wikipedia/sco/thumb/b/bf/KFC_logo.svg/2048px-KFC_logo.svg.png',
      'title': 'محمد سعيد',
      'body': 'mohammed123',
    },

    {
      'imageUrl':
          'https://upload.wikimedia.org/wikipedia/sco/thumb/b/bf/KFC_logo.svg/2048px-KFC_logo.svg.png',
      'title': 'محمد سعيد',
      'body': 'mohammed123',
    },
    // Add more data objects here...
  ];

  List<Map<String, dynamic>> banks = [
    {
      'imageUrl':
          'https://upload.wikimedia.org/wikipedia/sco/thumb/b/bf/KFC_logo.svg/2048px-KFC_logo.svg.png',
      'title': 'بنك التضامن',
      'body': '12056423',
    },

    {
      'imageUrl':
          'https://upload.wikimedia.org/wikipedia/sco/thumb/b/bf/KFC_logo.svg/2048px-KFC_logo.svg.png',
      'title': 'بنك التضامن',
      'body': '12056423',
    },
    // Add more data objects here...
  ];

  List<Tuple2<String, IconData>> featuresTabsTitles = const [
    Tuple2('الإعلانات', Icons.add_a_photo_outlined),
    Tuple2('الإشعارات', Icons.notification_add_outlined),
  ];

  List<Tuple2<String, IconData>> managementTabsTitles = const [
    Tuple2('الفروع', Icons.segment_outlined),
    Tuple2('التواصل الإجتماعي', Icons.phone_android_outlined),
    Tuple2('التفاصيل', Icons.info_outline),
    Tuple2('التحديثات', Icons.update_outlined),
  ];

  List<Tuple2<String, IconData>> branchTabsTitles = const [
    Tuple2('المدراء', Icons.manage_accounts_outlined),
    Tuple2('البنوك', Icons.balance_outlined),
    Tuple2('ساعات العمل', Icons.timeline_outlined),
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context)
        .textTheme
        .apply(displayColor: Theme.of(context).colorScheme.onSurface);
    SizeConfig().init(context);
    final fea = [
      TabBarWidget(
        tabs: featuresTabsTitles,
        tabViews: [
          Advertisement(
            adsList: CardListView(
              cardDataList: ads,
            ),
          ),
          Notifications(
            notificationsList: CardListView(
              cardDataList: ads,
            ),
          ),
        ],
        callerScreen: 'features',
      ),
    ];

    final manag = [
      TabBarWidget(
        tabs: managementTabsTitles,
        tabViews: [
          Branches(
            branchesList: BranchCardListView(
              cardDataList: branches,
              tabs: [
                TabBarWidget(
                    tabs: branchTabsTitles,
                    tabViews: [
                      Managers(
                        managersList: CardListView(
                          cardDataList: ads,
                        ),
                      ),
                      Banks(
                        banksList: CardListView(
                          cardDataList: ads,
                        ),
                      ),
                      BuessinessHours(
                        from: '8:00',
                        to: '9:00',
                      ),
                    ],
                    callerScreen: 'branch')
              ],
            ),
          ),
          SocialMedia(
            socialMediaList: CardListView(
              cardDataList: socialMedial,
            ),
          ),
          Info(),
          Updates(),
        ],
        callerScreen: 'management',
      ),
    ];

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
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
                managementTabs: manag,
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
