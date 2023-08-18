import 'package:flutter/material.dart';

Future<void> bottomSheet(BuildContext context, double bottomSheetHeight,
    List<Widget> bottomSheetWidgets) {
  List<Widget> widgets = <Widget>[];
  widgets = bottomSheetWidgets;

  return showModalBottomSheet<void>(
    showDragHandle: true,
    context: context,
    constraints: const BoxConstraints(maxWidth: 640),
    builder: (context) {
      return SizedBox(
        height: bottomSheetHeight,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 18.0),
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: widgets,
          ),
        ),
      );
    },
  );
}
