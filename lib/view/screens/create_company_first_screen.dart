import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:system_creator/services/size_config.dart';
import 'package:system_creator/view/widget/text_form_field.dart';
import 'package:system_creator/view/widget/filled_button.dart';
import 'package:system_creator/view/widget/form.dart';
import 'package:system_creator/view/widget/Button.dart';
import 'package:system_creator/view/widget/drop_down_box.dart';
import 'package:get/get.dart';
import 'package:tuple/tuple.dart';

class CreateCompanyFirstScreen extends StatelessWidget {
  CreateCompanyFirstScreen({Key? key}) : super(key: key);

  TextEditingController companyNameController = TextEditingController();
  TextEditingController ownerCardController = TextEditingController();
  TextEditingController commericalNumberController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController webController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  List<Tuple2<dynamic, String>> bankEntries = const [
    Tuple2(1, 'نوع1'),
    Tuple2(2, 'نوع2'),
    Tuple2(3, 'نوع3'),
  ];
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
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.screenWidth * 0.05,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.09),
                Text('قم بإنشاء تطبيقك الأول'),
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                LinearProgressIndicator(
                  value: 0.33,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.01),
                Text('قم بتعبئة التالي ببيانات شركتك '),
                SizedBox(height: SizeConfig.screenHeight * 0.03),
                formCustom(
                  formKey: _formKey,
                  widgets: [
                    textFormFieldCustom(
                      validate: validate,
                      controller: companyNameController,
                      label: 'اسم الشركة',
                      hint: 'ادخل اسم الشركة',
                      suffix: Icons.house_outlined,
                      kbtype: TextInputType.text,
                      obscure: false,
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.01),
                    SizedBox(
                      width: SizeConfig.screenWidth * 0.9,
                      child: Row(
                        children: [
                          Container(
                            width: SizeConfig.screenWidth * 0.6,
                            child: textFormFieldCustom(
                              validate: validate,
                              controller: ownerCardController,
                              label: 'هوية المالك',
                              hint: 'اضف هوية المالك',
                              suffix: Icons.credit_card,
                              kbtype: TextInputType.number,
                              obscure: false,
                            ),
                          ),
                          elevatedButtonCustom(func: () {}, text: 'إختر صورة'),
                        ],
                      ),
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.01),
                    SizedBox(
                      width: SizeConfig.screenWidth * 0.9,
                      child: Row(
                        children: [
                          Container(
                            width: SizeConfig.screenWidth * 0.6,
                            child: textFormFieldCustom(
                              validate: validate,
                              controller: commericalNumberController,
                              label: 'الرقم التجاري',
                              hint: 'أضف الرقم التجاري',
                              suffix: Icons.card_membership_outlined,
                              kbtype: TextInputType.number,
                              obscure: false,
                            ),
                          ),
                          elevatedButtonCustom(func: () {}, text: 'إختر صورة'),
                        ],
                      ),
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.01),
                    textFormFieldCustom(
                      validate: validate,
                      controller: phoneController,
                      label: 'رقم الهاتف',
                      hint: 'ادخل رقم الهاتف',
                      suffix: Icons.phone_android_outlined,
                      kbtype: TextInputType.number,
                      obscure: false,
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.01),
                    textFormFieldCustom(
                      validate: validate,
                      controller: descriptionController,
                      label: 'وصف الشركة',
                      hint: 'ادخل وصف للشركة',
                      suffix: Icons.text_snippet_outlined,
                      kbtype: TextInputType.text,
                      obscure: false,
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.01),
                    textFormFieldCustom(
                      validate: validate,
                      controller: webController,
                      label: 'صفحة ويب (اختياري)',
                      hint: 'ادخل صفحة ويب (اختياري)',
                      suffix: Icons.view_comfortable_outlined,
                      kbtype: TextInputType.text,
                      obscure: false,
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.01),
                    textFormFieldCustom(
                      validate: validate,
                      controller: addressController,
                      label: 'عنوان الشركة',
                      hint: 'ادخل عنوان الشركة',
                      suffix: Icons.location_on_outlined,
                      kbtype: TextInputType.text,
                      obscure: false,
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.01),
                    DropDownMenuCustom(bankEntries, 'نوع النظام'),
                    SizedBox(
                      width:
                          double.infinity, // Expand to fill the available width
                      child:
                          filledButtonCustom(onPressed: () {}, text: 'التالي'),
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
