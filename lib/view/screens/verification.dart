import 'package:flutter/material.dart';
import 'package:system_creator/services/size_config.dart';
import 'package:system_creator/view/screens/create_company_first_screen.dart';
import 'package:system_creator/view/widget/text_form_field.dart';
import 'package:system_creator/view/widget/filled_button.dart';
import 'package:system_creator/view/widget/text_button.dart';
import 'package:system_creator/view/widget/icon_button.dart';
import 'package:system_creator/view/widget/form.dart';
import 'package:system_creator/view/widget/app_bar.dart';
import 'package:get/get.dart';

class Verification extends StatelessWidget {
  Verification({Key? key}) : super(key: key);

  TextEditingController verificationController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String? validate(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: appBarCustom(
          leading: iconButtonCustom(func: () {}, icon: Icons.arrow_back),
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
                SizedBox(height: SizeConfig.screenHeight * 0.3),
                Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                      'لقد قمنا بإرسال كود التحقق الى الايميل المدخل أثناء عملية التسجيل :'),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.03),
                formCustom(
                  formKey: _formKey,
                  widgets: [
                    textFormFieldCustom(
                      validate: validate,
                      controller: verificationController,
                      label: 'كود التحقق',
                      hint: 'ادخل كود التحقق',
                      suffix: Icons.verified_user_outlined,
                      kbtype: TextInputType.text,
                      obscure: false,
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.01),
                    SizedBox(
                      width:
                          double.infinity, // Expand to fill the available width
                      child: filledButtonCustom(
                          onPressed: () {
                            Get.to(CreateCompanyFirstScreen());
                          },
                          text: 'تأكيد'),
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.01),
                    Text('0:00'),
                    SizedBox(
                      width:
                          double.infinity, // Expand to fill the available width
                      child: textButtonCustom(
                          func: () {}, text: 'إعادة ارسال الكود'),
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
