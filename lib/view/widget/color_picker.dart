import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '../../services/theme_Services.dart';

ElevatedButton colorPickerCustom(
    BuildContext context, Color currentColor, Function(Color) changeColor) {
  return ElevatedButton(
    onPressed: () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('اختر لون'),
            content: SingleChildScrollView(
              child: ColorPicker(
                pickerColor: currentColor,
                onColorChanged: changeColor,
                pickerAreaHeightPercent: 0.8,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  //   ThemeServices().changeThemeColor(1);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    },
    child: const Text('Pick a color'),
  );
}
