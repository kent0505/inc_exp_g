import 'package:flutter/material.dart';

import '../../../core/widgets/texts/text_widget.dart';

class LessonsPage extends StatelessWidget {
  const LessonsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TextWidget(
          'Lessons',
          fontSize: 20,
        ),
      ],
    );
  }
}
