import 'package:flutter/material.dart';

class ResponsiveContainer extends StatelessWidget {
  final List<Widget> children;

  const ResponsiveContainer({Key? key, required this.children})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use Flexible widgets to wrap the children.
    return Container(
      child: Column(
        children: [
          for (Widget child in children)
            Flexible(
              child: child,
            ),
        ],
      ),
    );
  }
}
