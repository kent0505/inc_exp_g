import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/buttons/cuper_button.dart';
import '../../../core/widgets/others/svg_widget.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    super.key,
    required this.title,
    required this.asset,
  });

  final String title;
  final String asset;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CuperButton(
          onPressed: () {
            if (title == 'Income') context.push('/home/add', extra: true);
            if (title == 'Expense') context.push('/home/add', extra: false);
            if (title == 'History') context.push('/home/history');
          },
          child: Container(
            height: 56,
            width: 56,
            decoration: BoxDecoration(
              color: AppColors.main,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 4,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Center(
              child: SvgWidget('assets/$asset.svg'),
            ),
          ),
        ),
        const SizedBox(height: 15),
        Text(
          title,
          style: const TextStyle(
            color: AppColors.main,
            fontSize: 16,
            fontFamily: Fonts.ns600,
          ),
        ),
      ],
    );
  }
}
