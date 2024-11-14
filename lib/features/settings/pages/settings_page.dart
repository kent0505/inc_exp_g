import 'package:flutter/material.dart';

import '../../../core/widgets/texts/text_widget.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TextWidget(
          'Settings',
          fontSize: 20,
        ),
      ],
    );
  }
}
