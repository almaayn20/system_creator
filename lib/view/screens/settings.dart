import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:system_creator/services/size_config.dart';
import 'package:system_creator/view/widget/alert_dialog.dart';
import 'package:system_creator/view/widget/radio_buttons.dart';
import 'package:system_creator/view/widget/text_button.dart';

import '../../services/theme_Services.dart';
import '../widget/app_bar.dart';
import '../widget/list_view.dart';

class Settings extends StatelessWidget {
  Settings({super.key});

  final List<String> themeModes = [
    'الوضع النهاري',
    'الوضع الليلي',
    'استخدم ثيم الجهاز'
  ];
  int themeMode = 1;
  int themeColor = 1;

  void getThemeConfig() {
    themeMode = ThemeServices().loadThemeFromBox();
    themeColor = ThemeServices().loadColorFromBox();
  }

  final List<String> themeColors = [
    'اللون الافتراضي',
    'Indigo',
    'Blue',
    'Teal',
    'Green',
    'Yellow',
    'Orange',
    'Deep Orange',
    'Pink'
  ];

  int selectedThemeModeIndex = 1; // Store the selected theme mode index
  int selectedThemeColorIndex = 1; // Store the selected theme color index

  void handleThemeModeSelected(int index) {
    // Update the selected theme mode index when a radio button is selected
    selectedThemeModeIndex = index;
  }

  void handleThemeColorSelected(int index) {
    // Update the selected theme color index when a radio button is selected
    selectedThemeColorIndex = index;
  }

  void changeThemeButton(BuildContext context) {
    getThemeConfig();
    alertDialogCustom(
      context: context,
      title: 'تغيير ثيم التطبيق',
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('تغيير المظهر'),
            colDivider,
            Radios(
              options: themeModes,
              onOptionSelected: handleThemeModeSelected,
              defaultSelectedIndex: themeMode - 1, // Set the default index
            ),
            const Divider(),
            const Text('تغيير اللون'),
            colDivider,
            Radios(
              options: themeColors,
              onOptionSelected: handleThemeColorSelected,
              defaultSelectedIndex: themeColor - 1, // Set the default index
            ),
          ],
        ),
      ),
      actions: [
        textButtonCustom(
          func: () {
            ThemeServices().changeTheme(
                selectedThemeModeIndex, selectedThemeColorIndex, context);
            Navigator.of(context).pop();
          },
          text: 'تغيير',
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: appBarCustom(
          title: 'صانع التطبيقات',
          centertitle: true,
        ),
        body: ListView(
          children: listTileCustom([
            ListTileProps(
              title: const Text('تغيير الثيم'),
              leading: Icons.color_lens_outlined,
              onTap: () {
                changeThemeButton(context);
              },
            ),
            ListTileProps(
              title: const Text('سياسة الخصوصية'),
              leading: Icons.privacy_tip_outlined,
              onTap: () {},
            ),
            ListTileProps(
              title: const Text('طلب ميزات مخصصه'),
              leading: Icons.star_border_outlined,
              onTap: () {},
            ),
            ListTileProps(
              title: const Text('الدعم الفني'),
              leading: Icons.support_agent_outlined,
              onTap: () {},
            ),
            ListTileProps(
              title: const Text('حول'),
              leading: Icons.info_outline,
              onTap: () {},
            ),
            ListTileProps(
              title: const Text('مشاركة المنصة'),
              leading: Icons.share_outlined,
              onTap: () {},
            ),
          ], [
            0,
            1,
            4
          ]),
        ),
      ),
    );
  }
}
