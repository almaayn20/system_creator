import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

class DropDownMenuCustom extends StatelessWidget {
  final List<Tuple2<dynamic, String>> entries;
  final TextEditingController colorController = TextEditingController();
  final String label;
  // final IconData icon;

  DropDownMenuCustom(this.entries, this.label, {super.key});

  List<DropdownMenuEntry> assign() {
    List<DropdownMenuEntry> customEntries = [];
    for (final entry in entries) {
      customEntries
          .add(DropdownMenuEntry(value: entry.item1, label: entry.item2));
    }
    return customEntries;
  }

  DropdownMenu dropDownMenu() {
    return DropdownMenu(
      //     trailingIcon: Icon(icon),
      controller: colorController,
      label: Text(label),
      dropdownMenuEntries: assign(),
      onSelected: (val) {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return dropDownMenu();
  }
}

// الاستدعاء
/*            
List<Tuple2<dynamic, String>> bankEntries = const [
    Tuple2(1, 'الكريمي'),
    Tuple2(2, 'التضامن'),
    Tuple2(2, 'البنك التجاري'),
  ];
DropDownMenuCustom(bankEntries, "Banks"),
 */