import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImage extends StatelessWidget {
  const CachedImage({super.key, required this.imageUrl, this.fit});
  final String imageUrl;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      cacheKey: imageUrl,
      fit: fit,
      imageUrl: imageUrl,
      placeholder: (context, _) => Center(child: CircularProgressIndicator()),
      errorWidget: (context, _, _) => Icon(Icons.info),
    );
  }
}
