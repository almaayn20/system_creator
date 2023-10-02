import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

import '../../../../services/size_config.dart';
import '../../../widget/bottom_sheet.dart';
import '../../../widget/filled_button.dart';
import '../../../widget/form.dart';
import '../../../widget/text_Form_field.dart';
import '../../../widget/time_picker.dart';

class BuessinessHours extends StatelessWidget {
  const BuessinessHours({
    Key? key,
    required this.from,
    required this.to,
  }) : super(key: key);

  final String from;
  final String to;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'ساعات العمل',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    EditBussinessHoursBottomSheet().show(context);
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'من: $from',
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          Text(
            'إلى: $to',
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

class EditBussinessHoursBottomSheet {
  final _formKey = GlobalKey<FormState>();
  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();
  ShowTimePickerCustom stpc = ShowTimePickerCustom();

  Future<void> show(BuildContext context) {
    double spacer = SizeConfig.screenHeight * 0.02;
    return bottomSheetCustom(
        context,
        formCustom(formKey: _formKey, widgets: [
          const Text(
            'تعديل ساعات العمل',
          ),
          SizedBox(
            height: spacer,
          ),
          textFormFieldCustom(
            validate: (s) {},
            controller: fromController,
            label: 'من',
            hint: 'من',
            suffix: Icons.timelapse_outlined,
            obscure: false,
            readonly: true,
            onTab: () async {
              var selectedTime = await stpc.show(context);
              if (selectedTime != null) {
                stpc.selectedTime = selectedTime;
                fromController.text = stpc.selectedTime != null
                    ? '${selectedTime.hour}:${selectedTime.minute}'
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
            controller: toController,
            label: 'إلى',
            hint: 'إلى',
            suffix: Icons.timelapse_outlined,
            obscure: false,
            readonly: true,
            onTab: () async {
              var selectedTime = await stpc.show(context);
              if (selectedTime != null) {
                stpc.selectedTime = selectedTime;
                toController.text = stpc.selectedTime != null
                    ? '${selectedTime.hour}:${selectedTime.minute}'
                    : '';
              }
            },
            kbtype: TextInputType.datetime,
          ),
          SizedBox(
            height: spacer,
          ),
          SizedBox(
              width: double.infinity,
              child: filledButtonCustom(onPressed: () {}, text: 'تعديل')),
        ]));
  }
}
