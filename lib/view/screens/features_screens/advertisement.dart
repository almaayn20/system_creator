import 'package:flutter/material.dart';

import '../../widget/list_Card.dart';

class Advertisement extends StatelessWidget {
  const Advertisement({super.key, required this.adsList});
  final CardListView adsList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: adsList,
      ),
    );
  }
}
