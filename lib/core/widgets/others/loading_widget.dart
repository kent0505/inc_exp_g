import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../config/app_colors.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CupertinoActivityIndicator(
        color: AppColors.main,
      ),
    );
  }
}

class LoadingWidget2 extends StatelessWidget {
  const LoadingWidget2({
    super.key,
    required this.loading,
  });

  final bool loading;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 11,
        width: 270,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(23),
          color: Colors.white.withOpacity(0.5),
        ),
        child: Row(
          children: [
            AnimatedContainer(
              duration: const Duration(seconds: 2),
              height: 11,
              width: loading ? 270 : 0,
              decoration: BoxDecoration(
                color: AppColors.main,
                borderRadius: BorderRadius.circular(19),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
