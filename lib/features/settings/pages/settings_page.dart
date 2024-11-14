import 'package:flutter/material.dart';

import '../../../core/widgets/custom_appbar.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomAppbar(title: 'Settings', back: false),
      ],
    );
  }
}
