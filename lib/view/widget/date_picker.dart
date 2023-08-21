import 'package:flutter/material.dart';

//طريقة الاستدعاء نعرف كائن من الكلاس كمتغير عام
//  var showDatePickerInstance =
//                           ShowDatePickerCustome(); // Create an instance
//                       var selectedDate =
//                           await showDatePickerInstance.show(context: context);

//                       if (selectedDate != null) {
//                         showDatePickerInstance.selectedDate = selectedDate;
//                         print(showDatePickerInstance.selectedDate);
//                       }

class ShowDatePickerCustome {
  DateTime? selectedDate;
  final DateTime _firstDate = DateTime(DateTime.now().year - 60);
  final DateTime _lastDate = DateTime(DateTime.now().year + 1);

  Future<DateTime?> show(
      {required BuildContext context,
      DateTime? firstDate,
      DateTime? lastDate}) {
    return showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: firstDate ?? _firstDate,
      lastDate: lastDate ?? _lastDate,
    );
  }
}
