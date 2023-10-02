import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

import '../../../../services/size_config.dart';
import '../../../widget/bottom_sheet.dart';
import '../../../widget/drop_down_box.dart';
import '../../../widget/filled_button.dart';
import '../../../widget/form.dart';
import '../../../widget/list_Card.dart';
import '../../../widget/text_Form_field.dart';

class Managers extends StatelessWidget {
  const Managers({super.key, required this.managersList});
  final CardListView managersList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: managersList,
      ),
    );
  }
}

class ManagersBottomSheet {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  List<Tuple2<dynamic, String>> branchesEntries = const [
    Tuple2(1, 'الفرع 1'),
    Tuple2(2, 'الفرع 2'),
    Tuple2(2, 'الفرع 3'),
  ];

  Future<void> show(BuildContext context) {
    double spacer = SizeConfig.screenHeight * 0.02;
    return bottomSheetCustom(
        context,
        formCustom(formKey: _formKey, widgets: [
          const Text(
            'إضافة مدير جديد',
          ),
          SizedBox(
            height: spacer,
          ),
          textFormFieldCustom(
            validate: (t) {},
            controller: nameController,
            label: 'الاسم',
            hint: 'ادخل اسمك',
            suffix: Icons.person_outlined,
            kbtype: TextInputType.text,
            obscure: false,
          ),
          SizedBox(
            height: spacer,
          ),
          textFormFieldCustom(
            validate: (t) {},
            controller: userNameController,
            label: 'اسم المستخدم',
            hint: 'ادخل اسم المستخدم',
            suffix: Icons.star_border,
            kbtype: TextInputType.text,
            obscure: false,
          ),
          SizedBox(
            height: spacer,
          ),
          textFormFieldCustom(
            validate: (t) {},
            controller: passwordController,
            label: 'كلمة السر',
            hint: 'ادخل كلمة السر',
            suffix: Icons.password_outlined,
            kbtype: TextInputType.visiblePassword,
            obscure: true,
          ),
          SizedBox(
            height: spacer,
          ),
          DropDownMenuCustom(
            branchesEntries,
            'الفرع',
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
