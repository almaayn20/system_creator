import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

import '../../../../services/size_config.dart';
import '../../../widget/bottom_sheet.dart';
import '../../../widget/drop_down_box.dart';
import '../../../widget/filled_button.dart';
import '../../../widget/form.dart';
import '../../../widget/list_Card.dart';
import '../../../widget/text_Form_field.dart';

class Banks extends StatelessWidget {
  const Banks({super.key, required this.banksList});
  final CardListView banksList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: banksList,
      ),
    );
  }
}

class BanksBottomSheet {
  final _formKey = GlobalKey<FormState>();
  TextEditingController accountNumberController = TextEditingController();

  List<Tuple2<dynamic, String>> banksEntries = const [
    Tuple2(1, 'التضامن'),
    Tuple2(2, 'الكريمي'),
    Tuple2(2, 'اليمن والكويت'),
  ];

  Future<void> show(BuildContext context) {
    double spacer = SizeConfig.screenHeight * 0.02;
    return bottomSheetCustom(
        context,
        formCustom(formKey: _formKey, widgets: [
          const Text(
            'إضافة بنك جديد جديدة',
          ),
          SizedBox(
            height: spacer,
          ),
          DropDownMenuCustom(banksEntries, 'المنصات'),
          SizedBox(
            height: spacer,
          ),
          textFormFieldCustom(
            validate: (s) {},
            controller: accountNumberController,
            label: 'رقم الحساب',
            hint: 'ادخل رقم الحساب',
            suffix: Icons.account_box,
            obscure: false,
            kbtype: TextInputType.url,
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
