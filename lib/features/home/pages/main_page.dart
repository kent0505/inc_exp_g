import 'package:flutter/material.dart';
import 'package:inc_exp_g/features/home/widgets/add_button.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/utils.dart';

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
        const Row(
          children: [
            SizedBox(width: 60),
            Spacer(),
            Text(
              'Balance',
              style: TextStyle(
                fontSize: 36,
                color: AppColors.main,
                fontFamily: Fonts.ns700,
              ),
            ),
            Spacer(),
            SizedBox(width: 60),
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
          child: const Column(
            children: [
              SizedBox(height: 15),
              Center(
                child: Text(
                  'Id: 00001',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: Fonts.ns700,
                  ),
                ),
              ),
              Spacer(),
              Text(
                '\$ 35 866.00',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 34,
                  fontFamily: Fonts.ns900,
                ),
              ),
              Spacer(),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const Row(
          children: [
            SizedBox(width: 60),
            AddButton(
              title: 'Income',
              asset: 'add1',
            ),
            Spacer(),
            AddButton(
              title: 'Expense',
              asset: 'add2',
            ),
            Spacer(),
            AddButton(
              title: 'History',
              asset: 'history',
            ),
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
