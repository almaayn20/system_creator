import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:system_creator/view/widget/date_picker.dart';

import '../../../controller/features_tab_controller.dart';
import '../../../controller/image_picker_controller.dart';
import '../../../services/size_config.dart';
import '../../widget/bottom_sheet.dart';
import '../../widget/filled_button.dart';
import '../../widget/form.dart';
import '../../widget/list_Card.dart';
import '../../widget/text_Form_field.dart';

class Advertisement extends StatelessWidget {
  const Advertisement({super.key, required this.adsList});
  final CardListView adsList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: adsList,
      ),
    );
  }
}

class AdvertisementBottomSheet {
  final _formKey = GlobalKey<FormState>();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  var showDatePickerInstance = ShowDatePickerCustome();
  final ImagePickerController imageController = ImagePickerController();
  final FeaturesTabController tabController = Get.find();

  Future<void> show(BuildContext context) {
    double spacer = SizeConfig.screenHeight * 0.02;
    return bottomSheetCustom(
        context,
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
            readonly: true,
            onTab: () async {
              var selectedDate =
                  await showDatePickerInstance.show(context: context);
              if (selectedDate != null) {
                showDatePickerInstance.selectedDate = selectedDate;
                startDateController.text = showDatePickerInstance
                            .selectedDate !=
                        null
                    ? '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}'
                    : '';
              }
            },
            kbtype: TextInputType.datetime,
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
            readonly: true,
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
            kbtype: TextInputType.datetime,
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
        ]));
  }
}
