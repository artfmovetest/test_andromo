import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageItem extends StatelessWidget {
  final CachedNetworkImage image;
  final Function tapPreview;
  ImageItem(this.image, this.tapPreview);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => tapPreview(image),
        child: Padding(
            padding: EdgeInsets.all(8),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(18.0), child: image)));
  }
}
