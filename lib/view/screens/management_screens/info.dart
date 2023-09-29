import 'package:flutter/material.dart';
import 'package:system_creator/view/widget/bottom_sheet.dart';

import '../../../services/size_config.dart';
import '../../widget/filled_button.dart';
import '../../widget/form.dart';
import '../../widget/text_Form_field.dart';

class Info extends StatelessWidget {
  Info({super.key});

  TextEditingController phoneController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController webController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double spacer = SizeConfig.screenHeight * 0.02;

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.screenWidth * 0.05,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: SizeConfig.screenHeight * 0.03),
            infoForm(spacer, true, GlobalKey<FormState>()),
            SizedBox(
              width: double.infinity, // Expand to fill the available width
              child: filledButtonCustom(
                  onPressed: () {
                    bottomSheetCustom(context,
                        infoForm(spacer, false, GlobalKey<FormState>()));
                  },
                  text: 'تعديل'),
            ),
            //    SizedBox(height: spacer),
          ],
        ),
      ),
    );
  }

  Form infoForm(double spacer, bool readOnly, GlobalKey<FormState> formKey) {
    return formCustom(
      formKey: formKey,
      widgets: [
        const Text(
          'بيانات شركتك',
        ),
        SizedBox(
          height: spacer,
        ),
        textFormFieldCustom(
          validate: (s) {},
          controller: phoneController,
          label: 'رقم الهاتف',
          hint: 'ادخل رقم الهاتف',
          suffix: Icons.phone_android_outlined,
          kbtype: TextInputType.phone,
          obscure: false,
          readonly: readOnly,
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
          readonly: readOnly,
        ),
        SizedBox(height: spacer),
        textFormFieldCustom(
          validate: (s) {},
          controller: webController,
          label: 'صفحة ويب (اختياري)',
          hint: 'ادخل صفحة ويب (اختياري)',
          suffix: Icons.view_comfortable_outlined,
          kbtype: TextInputType.text,
          obscure: false,
          readonly: readOnly,
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
          readonly: readOnly,
        ),
        SizedBox(height: spacer),
        readOnly == false
            ? SizedBox(
                width: double.infinity, // Expand to fill the available width
                child: filledButtonCustom(onPressed: () {}, text: 'تعديل'),
              )
            : SizedBox(height: spacer),
        //   SizedBox(height: spacer),
      ],
    );
  }
}
