import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:system_creator/controller/image_picker_controller.dart';
import 'package:system_creator/services/size_config.dart';
import 'package:system_creator/view/screens/create_company_second_screen.dart';
import 'package:system_creator/view/widget/text_form_field.dart';
import 'package:system_creator/view/widget/filled_button.dart';
import 'package:system_creator/view/widget/form.dart';
import 'package:system_creator/view/widget/Button.dart';
import 'package:system_creator/view/widget/drop_down_box.dart';
import 'package:get/get.dart';
import 'package:tuple/tuple.dart';

import '../widget/app_bar.dart';
import '../widget/icon_button.dart';

class CreateCompanyFirstScreen extends StatelessWidget {
  CreateCompanyFirstScreen({Key? key}) : super(key: key);

  final ImagePickerController imageController1 = ImagePickerController();
  final ImagePickerController imageController2 = ImagePickerController();

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

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double spacer = SizeConfig.screenHeight * 0.02;
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
                Text(
                  'قم بإنشاء تطبيقك الأول',
                  style: textTheme.headlineSmall!,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                const LinearProgressIndicator(
                  value: 0.33,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.01),
                Text(
                  'قم بتعبئة التالي ببيانات شركتك ',
                  style: textTheme.bodyLarge!,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.03),
                formCustom(
                  formKey: _formKey,
                  widgets: [
                    textFormFieldCustom(
                      validate: (s) {},
                      controller: companyNameController,
                      label: 'اسم الشركة',
                      hint: 'ادخل اسم الشركة',
                      suffix: Icons.house_outlined,
                      kbtype: TextInputType.text,
                      obscure: false,
                    ),
                    SizedBox(height: spacer),
                    SizedBox(
                      width: SizeConfig.screenWidth * 0.9,
                      child: Row(
                        children: [
                          ClipOval(
                            child: Obx(() {
                              final selectedImage =
                                  imageController1.selectedImage.value;
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
                          Expanded(
                            child: elevatedButtonCustom(
                                func: () async {
                                  await imageController1.pickImage(context);
                                },
                                text: 'اختر صورة الهوية'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: spacer),
                    SizedBox(
                      width: SizeConfig.screenWidth * 0.9,
                      child: Row(
                        children: [
                          ClipOval(
                            child: Obx(() {
                              final selectedImage =
                                  imageController2.selectedImage.value;
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
                          Expanded(
                            child: elevatedButtonCustom(
                                func: () async {
                                  await imageController2.pickImage(context);
                                },
                                text: 'إختر صورة السجل التجاري'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: spacer),
                    textFormFieldCustom(
                      validate: (s) {},
                      controller: phoneController,
                      label: 'رقم الهاتف',
                      hint: 'ادخل رقم الهاتف',
                      suffix: Icons.phone_android_outlined,
                      kbtype: TextInputType.phone,
                      obscure: false,
                    ),
                    SizedBox(height: spacer),
                    textFormFieldCustom(
                      validate: (s) {},
                      controller: descriptionController,
                      label: 'وصف الشركة',
                      hint: 'ادخل وصف للشركة',
                      suffix: Icons.text_snippet_outlined,
                      kbtype: TextInputType.multiline,
                      obscure: false,
                    ),
                    SizedBox(height: spacer),
                    textFormFieldCustom(
                      validate: (s) {},
                      controller: webController,
                      label: 'صفحة الويب (اختياري)',
                      hint: 'ادخل رابط صفحة الويب (اختياري)',
                      suffix: Icons.view_comfortable_outlined,
                      kbtype: TextInputType.text,
                      obscure: false,
                    ),
                    SizedBox(height: spacer),
                    textFormFieldCustom(
                      validate: (s) {},
                      controller: addressController,
                      label: 'عنوان الشركة',
                      hint: 'ادخل عنوان الشركة',
                      suffix: Icons.location_on_outlined,
                      kbtype: TextInputType.streetAddress,
                      obscure: false,
                    ),
                    SizedBox(height: spacer),
                    DropDownMenuCustom(bankEntries, 'نوع النظام'),
                    SizedBox(height: spacer),
                    SizedBox(
                      width:
                          double.infinity, // Expand to fill the available width
                      child: filledButtonCustom(
                          onPressed: () {
                            Get.to(CreateCompanySecondScreen());
                          },
                          text: 'التالي'),
                    ),
                    SizedBox(height: spacer),
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
