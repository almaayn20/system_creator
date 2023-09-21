import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:system_creator/view/widget/button.dart';
import 'package:system_creator/view/widget/filled_button.dart';
import 'package:system_creator/view/widget/form.dart';

import '../../controller/image_picker_controller.dart';
import '../widget/app_bar.dart';
import '../widget/bottom_sheet.dart';
import '../widget/date_picker.dart';
import '../widget/icon_button.dart';
import '../widget/tap_bar.dart';
import '../widget/text_Form_field.dart';

class CompanyFeatures extends StatelessWidget {
  CompanyFeatures({super.key, required this.tabBarWidget});
  final TabBarWidget tabBarWidget;
  final _formKey = GlobalKey<FormState>();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  var showDatePickerInstance = ShowDatePickerCustome();
  final ImagePickerController imageController = ImagePickerController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: appBarCustom(
          leading: iconButtonCustom(
              func: () {
                Get.back();
              },
              icon: Icons.arrow_back),
          title: 'صانع التطبيقات',
          centertitle: true,
        ),
        body: tabBarWidget,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            AdsBottomSheet(context);
          },
          label: const Text('اضافة اعلان جديد'),
          icon: const Icon(Icons.add),
        ),
      ),
    );
  }

  Future<void> AdsBottomSheet(BuildContext context) {
    double spacer = 20;
    return bottomSheetCustom(context, 800.0, [
      formCustom(formKey: _formKey, widgets: [
        const Text(
          'قم بتعبئة التالي ببيانات الإعلان ',
        ),
        SizedBox(
          height: spacer,
        ),
        textFormFieldCustom(
          validate: (s) {},
          controller: startDateController,
          label: 'تاريخ بدء الاعلان',
          hint: 'ادخل تاريخ بدء الاعلان',
          suffix: Icons.calendar_month_outlined,
          obscure: false,
          onTab: () async {
            var selectedDate =
                await showDatePickerInstance.show(context: context);
            if (selectedDate != null) {
              showDatePickerInstance.selectedDate = selectedDate;
              startDateController.text = showDatePickerInstance.selectedDate !=
                      null
                  ? '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}'
                  : '';
            }
          },
          kbtype: TextInputType.name,
        ),
        SizedBox(
          height: spacer,
        ),
        textFormFieldCustom(
          validate: (s) {},
          controller: endDateController,
          label: 'تاريخ انتهاء الاعلان',
          hint: 'ادخل تاريخ انتهاء الاعلان',
          suffix: Icons.calendar_month_outlined,
          obscure: false,
          onTab: () async {
            var selectedDate =
                await showDatePickerInstance.show(context: context);
            if (selectedDate != null) {
              showDatePickerInstance.selectedDate = selectedDate;
              endDateController.text = showDatePickerInstance.selectedDate !=
                      null
                  ? '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}'
                  : '';
            }
          },
          kbtype: TextInputType.name,
        ),
        SizedBox(
          height: spacer,
        ),
        const Text(
          'اضغط لاختيار صورة الاعلان',
        ),
        SizedBox(
          height: spacer,
        ),
        GestureDetector(
          onTap: () async => await imageController.pickImage(context),
          child: Obx(() {
            final selectedImage = imageController.selectedImage.value;
            return selectedImage == null
                ? Container(
                    width: double.infinity,
                    height: 300,
                    color: Colors.grey,
                    child: const Icon(
                      Icons.add_a_photo,
                      size: 50,
                      color: Colors.white,
                    ),
                  )
                : Image.file(
                    selectedImage,
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                  );
          }),
        ),
        SizedBox(
          height: spacer,
        ),
        SizedBox(
            width: double.infinity,
            child: filledButtonCustom(onPressed: () {}, text: 'اضافة')),
        SizedBox(
            width: double.infinity,
            child: FilledButton(
                onPressed: () {},
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.red)),
                child: const Text('حذف'))),
      ])
    ]);
  }
}
