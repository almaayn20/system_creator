import 'package:flutter/material.dart';

class ListTileProps {
  final Widget title;
  final Widget? subtitle;
  final Widget? leading;
  final bool isThreeLine;
  final VoidCallback? onTap;
  final IconData trailing;

  ListTileProps({
    required this.title,
    this.subtitle,
    this.leading,
    this.isThreeLine = false,
    this.onTap,
    required this.trailing,
  });
}

ListView listViewCustom(List<ListTileProps> listTileProps) {
  return ListView(
    children: [
      for (var props in listTileProps)
        ListTile(
          title: props.title,
          subtitle: props.subtitle,
          leading: props.leading,
          isThreeLine: props.isThreeLine,
          onTap: props.onTap,
          trailing: Icon(props.trailing),
        ),
    ],
  );
}

/*
listViewCustom([
          ListTileProps(
            title: Text('Item 1'),
            trailing: Icons.star,
          ),
          ListTileProps(
            title: Text('Item 2'),
            subtitle: Text('Subtitle for Item 2'),
            leading: Icon(Icons.info),
            isThreeLine: true,
            onTap: () {
              // Handle onTap for Item 2
            },
            trailing: Icons.star_border,
          ),
          // Add more list items as needed
        ]),
*/ 
