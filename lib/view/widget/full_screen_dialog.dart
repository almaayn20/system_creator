import 'package:flutter/material.dart';

void openFullscreenDialog(BuildContext context, String title) {
  showDialog<void>(
    context: context,
    builder: (context) => Dialog.fullscreen(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Scaffold(
          appBar: AppBar(
            title: Text(title),
            centerTitle: false,
            leading: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          body: null,
          // implement carousel_slider
        ),
      ),
    ),
  );
}
