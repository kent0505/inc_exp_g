import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/utils.dart';
import '../widgets/add_button.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 8 + getStatusBar(context)),
        Row(
          children: [
            const SizedBox(width: 60),
            Container(
              height: 34,
              width: 34,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(
                  width: 1,
                  color: AppColors.main,
                ),
              ),
            ),
            const Spacer(),
            const Text(
              'Balance',
              style: TextStyle(
                fontSize: 36,
                color: AppColors.main,
                fontFamily: Fonts.ns700,
              ),
            ),
            const SizedBox(width: 34),
            const Spacer(),
            const SizedBox(width: 60),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          height: 116,
          margin: const EdgeInsets.symmetric(horizontal: 60),
          decoration: BoxDecoration(
            color: AppColors.main,
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                blurRadius: 17,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              const SizedBox(height: 15),
              const Center(
                child: Text(
                  'Id: 00001',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: Fonts.ns700,
                  ),
                ),
              ),
              const Spacer(),
              Text(
                formatNumber(35000),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 34,
                  fontFamily: Fonts.ns900,
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const Row(
          children: [
            SizedBox(width: 60),
            AddButton(title: 'Income', asset: 'add1'),
            Spacer(),
            AddButton(title: 'Expense', asset: 'add2'),
            Spacer(),
            AddButton(title: 'History', asset: 'history'),
            SizedBox(width: 60),
          ],
        ),
        const SizedBox(height: 20),
        Expanded(
          child: Container(
            color: AppColors.main,
          ),
        ),
      ],
    );
  }
}
