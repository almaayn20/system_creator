import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/features_tab_controller.dart';
import '../../../services/size_config.dart';
import '../../widget/bottom_sheet.dart';
import '../../widget/branch_card_list.dart';
import '../../widget/filled_button.dart';
import '../../widget/form.dart';
import '../../widget/list_Card.dart';
import '../../widget/text_Form_field.dart';

class Branches extends StatelessWidget {
  const Branches({super.key, required this.branchesList});
  final BranchCardListView branchesList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: branchesList,
      ),
    );
  }
}

class BranchesBottomSheet {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final FeaturesTabController tabController = Get.find();

  Future<void> show(BuildContext context) {
    double spacer = SizeConfig.screenHeight * 0.02;
    return bottomSheetCustom(
        context,
        formCustom(formKey: _formKey, widgets: [
          const Text(
            'إضافة فرع جديد',
          ),
          SizedBox(
            height: spacer,
          ),
          textFormFieldCustom(
            validate: (s) {},
            controller: nameController,
            label: 'الاسم',
            hint: 'ادخل اسم الفرع',
            suffix: Icons.title,
            obscure: false,
            kbtype: TextInputType.text,
          ),
          SizedBox(
            height: spacer,
          ),
          textFormFieldCustom(
            validate: (s) {},
            controller: userNameController,
            label: 'اليوزر',
            hint: 'ادخل يوزر الفرع',
            suffix: Icons.star_outline_outlined,
            obscure: false,
            kbtype: TextInputType.name,
          ),
          SizedBox(
            height: spacer,
          ),
          textFormFieldCustom(
            validate: (s) {},
            controller: userNameController,
            label: 'كلمة المرور',
            hint: 'ادخل كلمة المرور',
            suffix: Icons.password_outlined,
            obscure: false,
            kbtype: TextInputType.name,
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
