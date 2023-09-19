import 'package:flutter/material.dart';
import 'package:system_creator/services/size_config.dart';
import 'package:system_creator/view/widget/text_form_field.dart';
import 'package:system_creator/view/widget/filled_button.dart';
import 'package:system_creator/view/widget/icon_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:system_creator/view/widget/form.dart';
import 'package:system_creator/view/widget/app_bar.dart';
import 'package:get/get.dart';

class Signup extends StatelessWidget {
  Signup({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController addressController = TextEditingController();
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
          title: 'رجوع',
          centertitle: false,
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
                SvgPicture.asset(
                  'assets/images/signup.svg', // Use an image asset instead of SvgPicture
                  width: SizeConfig.screenWidth * 0.4,
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: Text('أدخل تفاصيلك بالأسفل :'),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                formCustom(
                  formKey: _formKey,
                  widgets: [
                    textFormFieldCustom(
                      validate: validate,
                      controller: nameController,
                      label: 'الاسم',
                      hint: 'ادخل اسمك',
                      suffix: Icons.person_outlined,
                      kbtype: TextInputType.text,
                      obscure: false,
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.01),
                    textFormFieldCustom(
                      validate: validate,
                      controller: userNameController,
                      label: 'اسم المستخدم',
                      hint: 'ادخل اسم المستخدم',
                      suffix: Icons.star_border,
                      kbtype: TextInputType.text,
                      obscure: false,
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.01),
                    textFormFieldCustom(
                      validate: validate,
                      controller: emailController,
                      label: 'الايميل',
                      hint: 'ادخل ايميلك',
                      suffix: Icons.email_outlined,
                      kbtype: TextInputType.emailAddress,
                      obscure: false,
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.01),
                    textFormFieldCustom(
                      validate: validate,
                      controller: phoneController,
                      label: 'رقم الهاتف',
                      hint: 'ادخل رقم الهاتف',
                      suffix: Icons.phone_android_sharp,
                      kbtype: TextInputType.number,
                      obscure: false,
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.01),
                    textFormFieldCustom(
                      validate: validate,
                      controller: passwordController,
                      label: 'كلمة السر',
                      hint: 'ادخل كلمة السر',
                      suffix: Icons.visibility_off_outlined,
                      kbtype: TextInputType.text,
                      obscure: true,
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.01),
                    textFormFieldCustom(
                      validate: validate,
                      controller: addressController,
                      label: 'العنوان(إختياري)',
                      hint: 'ادخل عنوانك (إختياري)',
                      suffix: Icons.location_on_outlined,
                      kbtype: TextInputType.text,
                      obscure: false,
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.01),
                    SizedBox(
                      width:
                          double.infinity, // Expand to fill the available width
                      child: filledButtonCustom(
                          onPressed: () {},
                          text: 'الذهاب الى التحقق من التسجيل'),
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
