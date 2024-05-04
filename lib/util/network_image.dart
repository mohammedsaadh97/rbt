import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PNetworkImage extends StatelessWidget {
  final String image;
  final BoxFit? fit;
  final double? width, height;
  const PNetworkImage(this.image, {Key? key, this.fit, this.height, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width,
      height: height,
      imageUrl: image,
      fit: fit,
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          SizedBox(
              height: 60.0,
              width: 60.0,
              child: Center(child: CircularProgressIndicator(value: downloadProgress.progress,color: Colors.redAccent,))),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );

/*
      FadeInImage(image: NetworkImage(image,), placeholder: AssetImage('assets/logo.png'), fit: fit,
      width: width,
      height: height,);*/

  }
}
