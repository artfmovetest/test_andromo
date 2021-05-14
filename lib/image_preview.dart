import 'package:flutter/material.dart';
import 'photo_screen.dart';

class ImagePreview extends StatelessWidget {
  final dynamic image;
  ImagePreview(this.image);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.share),
            onPressed: () => showDialog(
                context: context,
                builder: (ctx) =>
                    AlertDialog(title: Text('Shared succesfully'), actions: [
                      TextButton(
                          child: Text('Ok'),
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                          }),
                    ])),
          ),
          backgroundColor: Colors.black26,
          body: Center(child: Hero(tag: image.imageUrl, child: image))),
    );
  }
}
