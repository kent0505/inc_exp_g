import 'package:flutter/material.dart';

import '../../../core/widgets/texts/text_widget.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TextWidget(
          'Statistics',
          fontSize: 20,
        ),
      ],
    );
  }
}
