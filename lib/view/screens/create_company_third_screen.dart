import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:system_creator/services/size_config.dart';
import 'package:system_creator/view/screens/compaines.dart';
import 'package:system_creator/view/widget/filled_button.dart';
import 'package:system_creator/view/widget/form.dart';
import 'package:system_creator/view/widget/drop_down_box.dart';
import 'package:system_creator/view/widget/full_screen_dialog.dart';
import 'package:system_creator/view/widget/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:tuple/tuple.dart';

import '../widget/app_bar.dart';

class CreateCompanyThirdScreen extends StatelessWidget {
  CreateCompanyThirdScreen({Key? key}) : super(key: key);

  final List<Tuple2<dynamic, String>> themeEntries = const [
    Tuple2(1, 'مظهر 1'),
    Tuple2(2, 'مظهر 2'),
    Tuple2(3, 'مظهر 3'),
  ];

  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80',

    // 'assets/images/1.png',
    // 'assets/images/2.png',
    // 'assets/images/3.png',
  ];
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context)
        .textTheme
        .apply(displayColor: Theme.of(context).colorScheme.onSurface);
    SizeConfig().init(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: appBarCustom(
          title: 'صانع التطبيقات',
          centertitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.screenWidth * 0.05,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                Text(
                  'قم بإنشاء تطبيقك الأول',
                  style: textTheme.headlineSmall!,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.03),
                const LinearProgressIndicator(
                  value: 1.0,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.03),
                Text(
                  'إختر مظهر لتطبيقك',
                  style: textTheme.bodyLarge!,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.03),
                Container(
                  alignment: Alignment.centerRight,
                  child: const Text(
                    'ملاحظة: لا يمكنك تغير مظهر التطبيق مجانا لاحقا',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                formCustom(
                  formKey: _formKey,
                  widgets: [
                    SizedBox(height: SizeConfig.screenHeight * 0.01),
                    DropDownMenuCustom(themeEntries, 'إختر مظهر'),
                    SizedBox(height: SizeConfig.screenHeight * 0.01),
                    SizedBox(
                      width:
                          double.infinity, // Expand to fill the available width
                      child: filledButtonCustom(
                          onPressed: () {
                            openFullscreenDialog(
                                context,
                                'معاينة المظهر',
                                carouselSliderCustom(
                                    imageList: imgList,
                                    useNetworkImage: true,
                                    ratio: 0.6));
                          },
                          text: 'معاينة'),
                    ),
                    SizedBox(
                      width:
                          double.infinity, // Expand to fill the available width
                      child: filledButtonCustom(
                          onPressed: () {
                            Get.to(Companies());
                          },
                          text: 'تأكيد'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
