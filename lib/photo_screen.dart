import 'package:flutter/material.dart';
import 'images.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'image_item.dart';
import 'image_preview.dart';

class PhotoScreen extends StatefulWidget {
  PhotoScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PhotoScreenState createState() => new _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {
  List<CachedNetworkImage> verticalData = [];

  final int increment = 6;
  bool isPreview = false;
  CachedNetworkImage previewImage;

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    _loadMore();
    super.initState();
  }

  void showPreview(image) {
    Navigator.of(context, rootNavigator: false).push(PageRouteBuilder(
        opaque: false, pageBuilder: (_, __, ___) => ImagePreview(image)));
  }

  Future _loadMore() fdgdfasync {
    if (verticalData.length == images.length) {
      _refreshController.loadNoData();
    } else {
      verticalData.addAll(List.generate(
          (images.length - verticalData.length) > increment
              ? increment
              : (images.length - verticalData.length), (index) {
        return CachedNetworkImage(
          imageUrl: images[verticalData.length + index],
          fit: BoxFit.cover,
          placeholder: (context, url) =>
              Image.asset('assets/images/loading.png'),
          errorWidget: (context, url, error) => Icon(Icons.error),
        );
      }));

      setState(() {});
      _refreshController.loadComplete();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Andromo test'),
        ),
        body: Stack(children: [
          SmartRefresher(
            controller: _refreshController,
            onLoading: _loadMore,
            enablePullDown: false,
            enablePullUp: true,
            child: GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: verticalData.length,
              itemBuilder: (context, i) => Hero(
                tag: verticalData[i].imageUrl,
                child: ImageItem(verticalData[i], showPreview),
              ),
            ),
          ),
        ]));
  }
}
