import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../config/app_colors.dart';
import '../utils.dart';
import 'buttons/cuper_button.dart';
import 'others/svg_widget.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    super.key,
    required this.title,
    this.white = false,
    this.back = true,
    this.onDelete,
  });

  final String title;
  final bool white;
  final bool back;
  final void Function()? onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.only(top: 24 + getStatusBar(context)),
      child: Row(
        children: [
          if (back) ...[
            const SizedBox(width: 16),
            CuperButton(
              onPressed: () {
                context.pop();
              },
              child: SizedBox(
                height: 44,
                width: 44,
                child: Center(
                  child: SvgWidget(
                    'assets/back.svg',
                    color: white ? Colors.white : null,
                  ),
                ),
              ),
            ),
          ],
          Expanded(
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  color: white ? Colors.white : AppColors.main,
                  fontSize: 36,
                  fontFamily: Fonts.ns700,
                ),
              ),
            ),
          ),
          if (back) ...[
            if (onDelete != null) ...[
              CuperButton(
                onPressed: onDelete,
                child: const SizedBox(
                  height: 44,
                  width: 44,
                  child: Center(
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
            ] else
              const SizedBox(width: 60),
          ],
        ],
      ),
    );
  }
}
