import 'package:flutter/material.dart';

Card cardCustom(List<Widget> widgets) {
  return Card(
    elevation: 2.0,
    margin: const EdgeInsets.all(8.0),
    child: Column(
      children: widgets,
      /*  Align(
          alignment: Alignment.topRight,
          child: IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ),*/
    ),
  );
}

/*

****** filled **************
 color: Theme.of(context).colorScheme.surfaceVariant,
              elevation: 0,
              
 ******* outlined ****************

 elevation: 0,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Theme.of(context).colorScheme.outline,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),             
*/