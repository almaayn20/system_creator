import 'package:flutter/material.dart';
import 'package:system_creator/services/size_config.dart';
import 'package:system_creator/view/screens/settings.dart';
import 'package:system_creator/view/widget/filled_butto.dart';
import 'package:system_creator/view/widget/form.dart';
import 'package:system_creator/view/widget/text_button.dart';
import 'package:system_creator/view/widget/text_field.dart';
import 'package:system_creator/view/widget/Button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class login extends StatelessWidget {
  login({Key? key}) : super(key: key);

  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    Settings();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.screenWidth * 0.05,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.06),
                SvgPicture.asset(
                  'assets/images/login.svg', // Use an image asset instead of SvgPicture
                  width: SizeConfig.screenWidth * 0.8,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.06),
                formCustom(
                  formKey: _formKey,
                  widgets: [
                    textFieldCustom(
                      controller: controller,
                      label: 'الايميل',
                      hint: 'ادخل ايميلك',
                      suffix: Icons.email_outlined,
                      kbtype: TextInputType.emailAddress,
                      obscure: false,
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.01),
                    textFieldCustom(
                      controller: controller2,
                      label: 'كلمة السر',
                      hint: 'ادخل كلمة السر',
                      suffix: Icons.visibility_outlined,
                      kbtype: TextInputType.text,
                      obscure: true,
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.01),
                    SizedBox(
                      width:
                          double.infinity, // Expand to fill the available width
                      child: customFilledButton(() {}, 'تسجيل الدخول'),
                    ),
                    SizedBox(
                      width:
                          double.infinity, // Expand to fill the available width
                      child: textButtonCustom(
                          func: () {}, text: 'نسيت كلمة السر؟'),
                    ),
                  ],
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.1),
                SizedBox(
                  width: double.infinity,
                  child: elevatedButtonCustom(
                    func: () {
                      Get.to(Settings());
                    },
                    text: 'إنشاء حساب',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
