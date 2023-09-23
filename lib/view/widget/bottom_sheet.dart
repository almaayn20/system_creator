import 'package:flutter/material.dart';

Future<void> bottomSheetCustom(
    BuildContext context, Widget bottomSheetWidgets) {
  Widget widgets = bottomSheetWidgets;

  return showModalBottomSheet<void>(
    showDragHandle: true,
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    constraints: const BoxConstraints(maxWidth: 640),
    builder: (context) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 25.0, horizontal: 18.0),
              child: widgets,
            ),
          ),
        ),
      );
    },
  );
}
// ListView(
//               shrinkWrap: true,
//               scrollDirection: Axis.vertical,
//               children: widgets,
//             ),