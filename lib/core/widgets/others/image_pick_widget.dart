import 'dart:io';

import 'package:flutter/material.dart';

import '../../config/app_colors.dart';
import '../buttons/cuper_button.dart';
import 'svg_widget.dart';

class ImagePickWidget extends StatelessWidget {
  const ImagePickWidget({
    super.key,
    required this.imagePath,
    required this.onPressed,
  });

  final String imagePath;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 168,
      width: 168,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: Border.all(
          width: 4,
          color: AppColors.main,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 20,
            spreadRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: CuperButton(
        onPressed: onPressed,
        child: Center(
          child: imagePath.isEmpty
              ? const SvgWidget(
                  'assets/s1.svg',
                  color: AppColors.main,
                  height: 96,
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(84),
                  child: Image.file(
                    File(imagePath),
                    height: 160,
                    width: 160,
                    fit: BoxFit.cover,
                  ),
                ),
        ),
      ),
    );
  }
}
