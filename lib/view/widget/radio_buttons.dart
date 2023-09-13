import 'package:flutter/material.dart';

class Radios extends StatelessWidget {
  final List<String> options;
  final ValueNotifier<int> selectedOptionIndex;
  final Function(int) onOptionSelected;

  Radios({
    Key? key,
    required this.options,
    required this.onOptionSelected,
    int defaultSelectedIndex = 0,
  })  : selectedOptionIndex = ValueNotifier<int>(defaultSelectedIndex),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: options.asMap().entries.map((entry) {
        final index = entry.key;
        final option = entry.value;

        return ValueListenableBuilder<int>(
          valueListenable: selectedOptionIndex,
          builder: (context, value, _) {
            return RadioListTile<int>(
              title: Text(option),
              value: index,
              groupValue: value,
              onChanged: (int? newValue) {
                if (newValue != null) {
                  selectedOptionIndex.value = newValue;
                  onOptionSelected(newValue + 1);
                }
              },
            );
          },
        );
      }).toList(),
    );
  }
}
