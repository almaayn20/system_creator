import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:system_creator/services/size_config.dart';
import 'package:system_creator/view/widget/text_button.dart';
import 'package:system_creator/view/widget/text_field.dart';
import 'package:system_creator/view/widget/Button.dart';
import 'package:system_creator/view/widget/text_button.dart';
import 'package:system_creator/view/widget/icon_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../services/theme_Services.dart';
import '../widget/app_bar.dart';
import '../widget/list_view.dart';

class signup extends StatelessWidget {
  signup({super.key});

  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: appBarCustom(
          leading: iconButtonCustom(func: () {}, icon: Icons.arrow_back),
          title: 'رجوع',
          centertitle: false,
        ),
        body: ListView(children: [
          SvgPicture.asset(
            'assets/images/login.svg',
            width: double.infinity,
            height: 200,
            matchTextDirection: true,
          ),

          Container(
            margin: EdgeInsets.all(tinySpacing),
            alignment: Alignment.centerRight,
            child: Text('أدخل تفاصيلك بالأسفل :'),
          ),

          Container(
            margin: EdgeInsets.all(tinySpacing),
            child: textFieldCustom(
              controller: controller,
              label: 'الاسم',
              hint: 'ادخل اسمك',
              suffix: Icons.person_outlined,
              kbtype: TextInputType.text,
              obscure: false,
            ),
          ),

          Container(
            margin: EdgeInsets.all(tinySpacing),
            child: textFieldCustom(
              controller: controller,
              label: 'اسم المستخدم',
              hint: 'ادخل اسم المستخدم',
              suffix: Icons.star_border,
              kbtype: TextInputType.text,
              obscure: false,
            ),
          ),

          Container(
            margin: EdgeInsets.all(tinySpacing),
            child: textFieldCustom(
              controller: controller,
              label: 'الايميل',
              hint: 'ادخل ايميلك',
              suffix: Icons.email_outlined,
              kbtype: TextInputType.emailAddress,
              obscure: false,
            ),
          ),

          Container(
            margin: EdgeInsets.all(tinySpacing),
            child: textFieldCustom(
              controller: controller,
              label: 'رقم الهاتف',
              hint: 'ادخل رقم الهاتف',
              suffix: Icons.phone_android_sharp,
              kbtype: TextInputType.number,
              obscure: false,
            ),
          ),

          Container(
            margin: EdgeInsets.all(tinySpacing),
            child: textFieldCustom(
              controller: controller2,
              label: 'كلمة السر',
              hint: 'ادخل كلمة السر',
              suffix: Icons.visibility_off_outlined,
              kbtype: TextInputType.text,
              obscure: true,
            ),
          ),

          Container(
            margin: EdgeInsets.all(tinySpacing),
            child: textFieldCustom(
              controller: controller,
              label: 'الاسم',
              hint: 'ادخل اسمك',
              suffix: Icons.location_on_outlined,
              kbtype: TextInputType.text,
              obscure: false,
            ),
          ),

          Container(
            margin: EdgeInsets.all(tinySpacing),
            child: elevatedButtonCustom(
                func: () {}, text: 'الذهاب الى التحقق من التسجيل'),
          ),
          // SvgPicture.asset("assets/images/login.svg",width: 200,height: 200,matchTextDirection: true,),
        ]),
      ),
    );
  }
}
