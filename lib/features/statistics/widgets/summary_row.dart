import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';

class SummaryRow extends StatelessWidget {
  const SummaryRow({
    super.key,
    required this.label,
    required this.value,
  });

  final String label, value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 240,
      child: Row(
        children: [
          SizedBox(
            width: 126,
            child: Text(
              label,
              style: const TextStyle(
                color: AppColors.main,
                fontSize: 18,
                fontFamily: Fonts.ns400,
              ),
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(
              color: AppColors.main,
              fontSize: 22,
              fontFamily: Fonts.ns900,
            ),
          ),
        ],
      ),
    );
  }
}
