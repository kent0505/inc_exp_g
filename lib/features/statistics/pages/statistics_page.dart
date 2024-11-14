import 'package:flutter/material.dart';

import '../../../core/widgets/custom_appbar.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomAppbar(title: 'Statistic', back: false),
      ],
    );
  }
}
