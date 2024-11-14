import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/utils.dart';
import '../../core/config/app_colors.dart';
import '../../core/widgets/buttons/primary_button.dart';
import '../../core/widgets/others/svg_widget.dart';

class OnboardPage extends StatelessWidget {
  const OnboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: getStatusBar(context)),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'An app to manage your finances. We are sure you will find it useful!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.main,
                fontSize: 32,
                fontFamily: Fonts.ns700,
              ),
            ),
          ),
          const Spacer(),
          const SvgWidget('assets/onboard1.svg'),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 52),
            child: Text(
              'Use all the features, start monitoring your finances, share your stats with friends',
              textAlign: TextAlign.center,
              style: TextStyle(
                height: 1.8,
                color: AppColors.main,
                fontSize: 18,
                fontFamily: Fonts.ns300,
              ),
            ),
          ),
          const SizedBox(height: 30),
          PrimaryButton(
            title: 'Continue',
            onPressed: () {
              context.push('/onboard/profile');
            },
          ),
          const SizedBox(height: 55),
        ],
      ),
    );
  }
}
