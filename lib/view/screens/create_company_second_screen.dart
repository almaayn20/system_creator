import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:system_creator/services/size_config.dart';
import 'package:system_creator/view/screens/create_company_third_screen.dart';
import 'package:system_creator/view/widget/text_form_field.dart';
import 'package:system_creator/view/widget/filled_button.dart';
import 'package:system_creator/view/widget/form.dart';
import 'package:system_creator/view/widget/Button.dart';

import '../../controller/image_picker_controller.dart';
import '../widget/app_bar.dart';

class CreateCompanySecondScreen extends StatelessWidget {
  final ImagePickerController imageController = ImagePickerController();

  TextEditingController applicationNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final textTheme = Theme.of(context)
        .textTheme
        .apply(displayColor: Theme.of(context).colorScheme.onSurface);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
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
                  value: 0.66,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.03),
                Text(
                  'قم بتعبئة التالي ببيانات التطبيق ',
                  style: textTheme.bodyLarge!,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.03),
                Container(
                  alignment: Alignment.centerRight,
                  child: const Text(
                    'ملاحظة: لا يمكنك تغير هذه البيانات مجاناً لاحقا',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                formCustom(
                  formKey: _formKey,
                  widgets: [
                    textFormFieldCustom(
                      validate: (s) {},
                      controller: applicationNameController,
                      label: 'اسم التطبيق',
                      hint: 'ادخل اسم التطبيق',
                      suffix: Icons.phonelink_setup_outlined,
                      kbtype: TextInputType.text,
                      obscure: false,
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.03),
                    const Text('شعار التطبيق'),
                    SizedBox(height: SizeConfig.screenHeight * 0.01),
                    ClipOval(
                      child: Obx(() {
                        final selectedImage =
                            imageController.selectedImage.value;
                        return selectedImage == null
                            ? Container(
                                width: 100,
                                height: 100,
                                color: Colors.grey,
                                child: const Icon(
                                  Icons.photo,
                                  size: 50,
                                  color: Colors.white,
                                ),
                              )
                            : Image.file(
                                selectedImage,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              );
                      }),
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.01),
                    elevatedButtonCustom(
                        func: () async {
                          await imageController.pickImage(context);
                        },
                        text: 'إختر صورة'),
                    SizedBox(height: SizeConfig.screenHeight * 0.01),
                    SizedBox(
                      width: double.infinity,
                      child: filledButtonCustom(
                          onPressed: () {
                            Get.to(() => CreateCompanyThirdScreen());
                          },
                          text: 'التالي'),
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.01),
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
