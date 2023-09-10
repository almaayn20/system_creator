import 'package:flutter/material.dart';

SizedBox cardCustom(List<Widget> widgets) {
  return SizedBox(
    child: Card(
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 5, 5, 10),
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
      ),
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