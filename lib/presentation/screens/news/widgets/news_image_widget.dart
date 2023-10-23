import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsImageWidget extends StatelessWidget {
  final double? width, height;
  final String imgUrl;

  const NewsImageWidget({super.key, this.width, this.height, required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        imageUrl: imgUrl,
        imageBuilder: (context, imageProvider) => Padding(
              padding: _imagePaddingSize,
              child: ClipRRect(
                borderRadius: _imageBorderRadius,
                child: Container(
                  width: width,
                  height: height,
                  decoration: BoxDecoration(color: _imageBackgroundColor, image: DecorationImage(image: imageProvider, fit: BoxFit.cover)),
                ),
              ),
            ),
        progressIndicatorBuilder: (context, url, downloadProgress) => _buildProgressIndicator,
        errorWidget: (context, url, error) => _buildErrorWidget);
  }

  EdgeInsetsGeometry get _imagePaddingSize => const EdgeInsetsDirectional.only(end: 14);

  BorderRadiusGeometry get _imageBorderRadius => BorderRadius.circular(15.0);

  Color get _imageBackgroundColor => Colors.black.withOpacity(0.08);

  Widget get _buildProgressIndicator => Padding(
        padding: _imagePaddingSize,
        child: ClipRRect(
          borderRadius: _imageBorderRadius,
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: _imageBackgroundColor,
            ),
            child: const CupertinoActivityIndicator(),
          ),
        ),
      );

  Widget get _buildErrorWidget => Padding(
        padding: _imagePaddingSize,
        child: ClipRRect(
          borderRadius: _imageBorderRadius,
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: _imageBackgroundColor,
            ),
            child: const Icon(Icons.error),
          ),
        ),
      );
}
