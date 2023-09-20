import 'package:flutter/material.dart';

import '../widget/app_bar.dart';
import '../widget/icon_button.dart';
import '../widget/tap_bar.dart';

class CompanyFeatures extends StatelessWidget {
  CompanyFeatures({super.key, required this.tabBarWidget});
  final TabBarWidget tabBarWidget;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: appBarCustom(
          leading: iconButtonCustom(func: () {}, icon: Icons.arrow_back),
          title: 'صانع التطبيقات',
          centertitle: true,
        ),
        body: tabBarWidget,
      ),
    );
  }
}
