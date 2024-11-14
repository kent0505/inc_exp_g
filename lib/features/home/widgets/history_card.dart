import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/inc_exp.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/buttons/cuper_button.dart';
import '../../../core/widgets/others/svg_widget.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({
    super.key,
    required this.model,
  });

  final IncExp model;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 74,
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: AppColors.main,
        borderRadius: BorderRadius.circular(10),
      ),
      child: CuperButton(
        onPressed: () {
          context.push('/home/edit', extra: model);
        },
        child: Row(
          children: [
            const SizedBox(width: 18),
            SvgWidget(
              model.isIncome ? 'assets/income.svg' : 'assets/expense.svg',
            ),
            const SizedBox(width: 9),
            SvgWidget(
              getCategoryAsset(model.category),
              color: Colors.white,
              height: 36,
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    model.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: Fonts.ns400,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      Container(
                        height: 20,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          model.category,
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.74),
                            fontSize: 14,
                            fontFamily: Fonts.ns400,
                          ),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Container(
                        height: 20,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          model.isIncome ? 'Income' : 'Expense',
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.74),
                            fontSize: 14,
                            fontFamily: Fonts.ns400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Text(
              '\$${model.amount}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontFamily: Fonts.ns400,
              ),
            ),
            const SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}
