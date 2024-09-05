import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tuple/tuple.dart';

import '../../../controller/features_tab_controller.dart';
import '../../../services/size_config.dart';
import '../../widget/bottom_sheet.dart';
import '../../widget/drop_down_box.dart';
import '../../widget/filled_button.dart';
import '../../widget/form.dart';
import '../../widget/list_Card.dart';
import '../../widget/text_Form_field.dart';

class SocialMedia extends StatelessWidget {
  const SocialMedia({super.key, required this.socialMediaList});
  final CardListView socialMediaList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: socialMediaList,
      ),
    );
  }
}

class SocialMediaBottomSheet {
  final _formKey = GlobalKey<FormState>();
  TextEditingController urlController = TextEditingController();

  final FeaturesTabController tabController = Get.find();

  List<Tuple2<dynamic, String>> socialMediaEntries = const [
    Tuple2(1, 'فيس بوك'),
    Tuple2(2, 'تويتر'),
    Tuple2(2, 'يوتيوب'),
  ];

  Future<void> show(BuildContext context) {
    double spacer = SizeConfig.screenHeight * 0.02;
    return bottomSheetCustom(
        context,
        formCustom(formKey: _formKey, widgets: [
          const Text(
            'إضافة منصة جديدة',
          ),
          SizedBox(
            height: spacer,
          ),
          DropDownMenuCustom(socialMediaEntries, 'المنصات'),
          SizedBox(
            height: spacer,
          ),
          textFormFieldCustom(
            validate: (s) {},
            controller: urlController,
            label: 'رابط الحساب',
            hint: 'ادخل رابط الحساب',
            suffix: Icons.link_outlined,
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
