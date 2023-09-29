import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/features_tab_controller.dart';
import '../../../controller/image_picker_controller.dart';
import '../../../services/size_config.dart';
import '../../widget/bottom_sheet.dart';
import '../../widget/filled_button.dart';
import '../../widget/form.dart';
import '../../widget/list_Card.dart';
import '../../widget/text_Form_field.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key, required this.notificationsList});
  final CardListView notificationsList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: notificationsList,
      ),
    );
  }
}

class NotificationsBottomSheet {
  final _formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  final ImagePickerController imageController = ImagePickerController();
  final FeaturesTabController tabController = Get.find();

  Future<void> show(BuildContext context) {
    double spacer = SizeConfig.screenHeight * 0.02;
    return bottomSheetCustom(
        context,
        formCustom(formKey: _formKey, widgets: [
          const Text(
            'قم بتعبئة التالي ببيانات الإشعار ',
          ),
          SizedBox(
            height: spacer,
          ),
          textFormFieldCustom(
            validate: (s) {},
            controller: titleController,
            label: 'العنوان',
            hint: 'ادخل عنوان الإشعار',
            suffix: Icons.title_outlined,
            obscure: false,
            kbtype: TextInputType.text,
          ),
          SizedBox(
            height: spacer,
          ),
          textFormFieldCustom(
            validate: (s) {},
            controller: bodyController,
            label: 'المحتوى',
            hint: 'ادخل محتوى الإشعار',
            suffix: Icons.text_increase_outlined,
            obscure: false,
            kbtype: TextInputType.name,
          ),
          SizedBox(
            height: spacer,
          ),
          const Text(
            'اضغط لاختيار ايقونة الاعلان',
          ),
          SizedBox(
            height: spacer,
          ),
          GestureDetector(
            onTap: () async => await imageController.pickImage(context),
            child: ClipOval(
              child: Obx(() {
                final selectedImage = imageController.selectedImage.value;
                return selectedImage == null
                    ? Container(
                        width: 100,
                        height: 100,
                        color: Colors.grey,
                        child: const Icon(
                          Icons.add_a_photo,
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
