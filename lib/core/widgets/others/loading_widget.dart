import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../config/app_colors.dart';
import '../texts/text_widget.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CupertinoActivityIndicator(
        color: AppColors.main,
      ),
    );
  }
}

class LoadingWidget2 extends StatelessWidget {
  const LoadingWidget2({
    super.key,
    required this.loading,
  });

  final bool loading;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 11,
        width: 270,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(23),
          color: Colors.white.withOpacity(0.5),
        ),
        child: Row(
          children: [
            AnimatedContainer(
              duration: const Duration(seconds: 2),
              height: 11,
              width: loading ? 270 : 0,
              decoration: BoxDecoration(
                color: AppColors.main,
                borderRadius: BorderRadius.circular(19),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoadingWidget3 extends StatefulWidget {
  const LoadingWidget3({super.key});

  @override
  State<LoadingWidget3> createState() => _LoadingWidget3State();
}

class _LoadingWidget3State extends State<LoadingWidget3>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RotationTransition(
        turns: controller,
        child: const TextWidget('Loading...', fontSize: 20),
      ),
    );
  }
}
