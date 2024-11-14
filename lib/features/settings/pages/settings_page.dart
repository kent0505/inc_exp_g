import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/buttons/cuper_button.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/others/svg_widget.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppbar(title: 'Settings', back: false),
        const Spacer(),
        _SettingsButton(
          id: 1,
          title: 'Profile',
          onPressed: () {
            context.push('/home/profile');
          },
        ),
        const SizedBox(height: 16),
        _SettingsButton(
          id: 2,
          title: 'Share with friends',
          onPressed: () {},
        ),
        const SizedBox(height: 16),
        _SettingsButton(
          id: 3,
          title: 'Privacy Policy',
          onPressed: () {},
        ),
        const SizedBox(height: 16),
        _SettingsButton(
          id: 4,
          title: 'Support page',
          onPressed: () {},
        ),
        const SizedBox(height: 16),
        _SettingsButton(
          id: 5,
          title: 'Terms of use',
          onPressed: () {},
        ),
        const SizedBox(height: 16),
        _SettingsButton(
          id: 6,
          title: 'Subscription info',
          onPressed: () {},
        ),
        const Spacer(),
      ],
    );
  }
}

class _SettingsButton extends StatelessWidget {
  const _SettingsButton({
    required this.id,
    required this.title,
    required this.onPressed,
  });

  final int id;
  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 32),
      height: 45,
      decoration: BoxDecoration(
        color: AppColors.main,
        borderRadius: BorderRadius.circular(10),
      ),
      child: CuperButton(
        onPressed: onPressed,
        child: Row(
          children: [
            const SizedBox(width: 12),
            SvgWidget('assets/s$id.svg'),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: Fonts.ns400,
                ),
              ),
            ),
            const Icon(
              Icons.chevron_right,
              color: Colors.white,
            ),
            const SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}
