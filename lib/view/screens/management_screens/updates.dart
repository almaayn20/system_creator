import 'package:flutter/material.dart';
import 'package:system_creator/view/widget/filled_button.dart';

import '../../widget/card.dart';

class Updates extends StatelessWidget {
  Updates({super.key});

  List<String> s = ['1-اضافة الاعلانات', '2-اضافة الشات ', '3-', '4-'];

  List<Widget> features = [];

  void organizeFeatures(BuildContext context) {
    features.clear();
    for (String f in s) {
      features.add(
        Text(
          f,
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width *
                0.04, // Responsive text size
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    organizeFeatures(context);
    return ListView(children: [
      Card(
        margin: EdgeInsets.all(
            MediaQuery.of(context).size.width * 0.03), // Responsive margin
        elevation: 2.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width *
                  0.04), // Responsive padding
              child: Row(
                children: [
                  Text(
                    'V2.0 - ',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width *
                          0.05, // Responsive text size
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                  ),
                  Text(
                    'تحديث جديد',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width *
                          0.05, // Responsive text size
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width *
                  0.04), // Responsive padding
              child: Text(
                'المزايا الجديده والتحسينات :',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width *
                      0.045, // Responsive text size
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width *
                  0.04), // Responsive padding
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: features,
              ),
            ),
            Container(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.all(MediaQuery.of(context).size.width *
                    0.04), // Responsive padding
                child: filledButtonCustom(
                  onPressed: () {},
                  text: 'تحديث',
                ),
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
