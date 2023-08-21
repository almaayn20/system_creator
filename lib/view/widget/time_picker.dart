import 'package:flutter/material.dart';

class ShowTimePickerCustom {
  TimeOfDay? selectedTime;

  Future<TimeOfDay?> show(BuildContext context) {
    return showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            alwaysUse24HourFormat: true,
          ),
          child: child!,
        );
      },
    );
  }
}
