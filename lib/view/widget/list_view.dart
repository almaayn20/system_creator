// LstView(LstTiles),

// var LstTiles = [
//   (text: Text('DOGS'), icon: Icon(Icons.settings_outlined)),
//   (text: Text('CATS'), icon: Icon(Icons.music_note)),
//   (text: Text('BIRDS'), icon: Icon(Icons.favorite)),
// ];

import 'package:flutter/material.dart';

ListView listView(listTile) {
  return ListView(
    children: [
      for (var lst in listTile)
        ListTile(
          title: lst.text,
          trailing: lst.icon,
        ),
    ],
  );
}
