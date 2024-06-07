import 'package:cached_network_image/cached_network_image.dart';
import 'package:cocktail/constants/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:simple_shadow/simple_shadow.dart';

class ImageShadow extends StatelessWidget {
  const ImageShadow({
    required this.image,
    required this.imgDefault,
    super.key,
  });

  final String image;
  final String imgDefault;

  @override
  Widget build(BuildContext context) {
    return SimpleShadow(
      opacity: 0.5,
      color: Colors.black,
      offset: const Offset(5, -3),
      sigma: 3,
      child: CachedNetworkImage(
        imageUrl: image,
        imageBuilder: (context, imageProvider) => Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(image: imageProvider),
          ),
        ),
        placeholder: (context, url) => Center(
          child: Image.asset(
            imgDefault,
            color: Colors.black,
            width: 100,
          ),
        ),
        errorWidget: (context, url, error) => Image.asset(
          imgDefault,
          color: Colors.black,
        ),
      ),
    );
  }
}
