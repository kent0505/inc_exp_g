import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/utils.dart';
import '../../core/config/app_colors.dart';
import '../../core/widgets/buttons/primary_button.dart';
import '../../core/widgets/custom_scaffold.dart';
import '../../core/widgets/texts/text_widget.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({super.key});

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  int index = 1;

  String getTitle() {
    if (index == 1) return '';
    return '';
  }

  String getDescription() {
    if (index == 1) return '';
    return '';
  }

  void onNext() async {
    if (index == 2) {
      await saveOnboard().then((value) {
        if (mounted) {
          context.go('/home');
        }
      });
    } else {
      setState(() {
        index++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextWidget(
            getTitle(),
            fontSize: 30,
            fontFamily: Fonts.ns700,
          ),
          TextWidget(
            getDescription(),
            fontSize: 30,
            fontFamily: Fonts.ns400,
          ),
          PrimaryButton(
            title: 'Go Home',
            onPressed: onNext,
          ),
        ],
      ),
    );
  }
}
