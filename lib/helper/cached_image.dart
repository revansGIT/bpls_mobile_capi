import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Widget? placeholder;
  final Widget? errorWidget;
  final Duration fadeInDuration;
  final Duration fadeOutDuration;
  final bool useOldImageOnUrlChange;

  const CustomCachedNetworkImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit,
    this.placeholder,
    this.errorWidget,
    this.fadeInDuration = const Duration(milliseconds: 500),
    this.fadeOutDuration = const Duration(milliseconds: 500),
    this.useOldImageOnUrlChange = false,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit,
      placeholder: (context, url) => placeholder ?? _buildPlaceholder(),
      errorWidget: (context, url, error) => errorWidget ?? _buildErrorWidget(),
      fadeInDuration: fadeInDuration,
      fadeOutDuration: fadeOutDuration,
      useOldImageOnUrlChange: useOldImageOnUrlChange,
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      color: Colors.grey[300],
      child: const Center(
        child: Icon(
          Icons.image,
          color: Colors.grey,
          size: 48,
        ),
      ),
    );
  }

  Widget _buildErrorWidget() {
    return Container(
      color: Colors.red[100],
      child: const Center(
        child: Icon(
          Icons.error,
          color: Colors.red,
          size: 48,
        ),
      ),
    );
  }
}
