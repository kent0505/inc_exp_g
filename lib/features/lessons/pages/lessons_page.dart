import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/utils.dart';

class LessonsPage extends StatelessWidget {
  const LessonsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 28 + getStatusBar(context)),
        const Text(
          'Finance Education',
          style: TextStyle(
            color: AppColors.main,
            fontSize: 32,
            fontFamily: Fonts.ns700,
          ),
        ),
        const SizedBox(height: 12),
        Expanded(
          child: ListView(
            children: const [],
          ),
        ),
        const SizedBox(height: 72),
      ],
    );
  }
}
