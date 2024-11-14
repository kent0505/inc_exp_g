import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../utils.dart';
import 'no_data.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    super.key,
    required this.image,
    required this.borderRadius,
    this.width,
    this.height,
    this.network = false,
    this.errorImageAsset = '',
  });

  final String image;
  final double borderRadius;
  final double? width;
  final double? height;
  final bool network;
  final String errorImageAsset;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(color: Colors.white),
        child: Image.file(
          File(image),
          fit: BoxFit.cover,
          width: width,
          height: height,
          errorBuilder: (context, error, stackTrace) {
            if (network) {
              return CachedNetworkImage(
                imageUrl: image,
                fit: BoxFit.cover,
                width: width,
                height: height,
                errorWidget: (context, url, error) {
                  logger(error);
                  return const NoData();
                },
              );
            } else {
              return Image.asset(
                image,
                fit: BoxFit.cover,
                width: width,
                height: height,
                errorBuilder: (context, error, stackTrace) {
                  logger(error);
                  if (errorImageAsset.isEmpty) return const NoData();
                  return Image.asset(
                    errorImageAsset,
                    fit: BoxFit.cover,
                    width: width,
                    height: height,
                    errorBuilder: (context, error, stackTrace) {
                      logger(error);
                      return const NoData();
                    },
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
