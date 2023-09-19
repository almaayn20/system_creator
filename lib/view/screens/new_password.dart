import 'package:flutter/material.dart';
import 'package:system_creator/services/size_config.dart';
import 'package:system_creator/view/widget/text_form_field.dart';
import 'package:system_creator/view/widget/filled_button.dart';
import 'package:system_creator/view/widget/icon_button.dart';
import 'package:system_creator/view/widget/form.dart';
import 'package:system_creator/view/widget/app_bar.dart';
import 'package:get/get.dart';

class NewPassword extends StatelessWidget {
  NewPassword({Key? key}) : super(key: key);

  TextEditingController newPasswordController = TextEditingController();
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
        appBar: appBarCustom(
          leading: iconButtonCustom(func: () {}, icon: Icons.arrow_back),
          title: 'صانع التطيبقات',
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
                  child: Text('أدخل كلمة السر الجديدة :'),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.03),
                formCustom(
                  formKey: _formKey,
                  widgets: [
                    textFormFieldCustom(
                      validate: validate,
                      controller: newPasswordController,
                      label: 'كلمة السر الجديدة',
                      hint: 'ادخل كلمة السر الجديدة',
                      suffix: Icons.visibility_off_outlined,
                      kbtype: TextInputType.text,
                      obscure: true,
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.01),
                    SizedBox(
                      width:
                          double.infinity, // Expand to fill the available width
                      child:
                          filledButtonCustom(onPressed: () {}, text: 'تأكيد'),
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
