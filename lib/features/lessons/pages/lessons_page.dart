import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/lesson.dart';
import '../../../core/utils.dart';

class LessonsPage extends StatefulWidget {
  const LessonsPage({super.key});

  @override
  State<LessonsPage> createState() => _LessonsPageState();
}

class _LessonsPageState extends State<LessonsPage> {
  int lessonindex = 0;

  void onNext() {
    setState(() {
      if (lessonindex == 4) {
        lessonindex = 0;
      } else {
        lessonindex++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 28 + getStatusBar(context)),
        const Text(
          'Finance Education',
          style: TextStyle(
            color: AppColors.main,
            fontSize: 32,
            fontFamily: Fonts.ns700,
          ),
        ),
        const SizedBox(height: 12),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: [
              const SizedBox(height: 10),
              Center(
                child: Text(
                  'Lesson ${lessonindex + 1}',
                  style: const TextStyle(
                    color: AppColors.main,
                    fontSize: 24,
                    fontFamily: Fonts.ns400,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Center(
                child: Text(
                  lessonsList[lessonindex].title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: AppColors.main,
                    fontSize: 24,
                    fontFamily: Fonts.ns600,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  lessonsList[lessonindex].body,
                  style: const TextStyle(
                    color: AppColors.main,
                    fontSize: 14,
                    fontFamily: Fonts.ns400,
                  ),
                ),
              ),
              const SizedBox(height: 22),
              Center(
                child: Container(
                  height: 48,
                  width: 260,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(33),
                    border: Border.all(
                      width: 2,
                      color: AppColors.main,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 4,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: CupertinoButton(
                    onPressed: onNext,
                    padding: EdgeInsets.zero,
                    child: const Center(
                      child: Text(
                        'Next Lesson',
                        style: TextStyle(
                          color: AppColors.main,
                          fontSize: 24,
                          fontFamily: Fonts.ns600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 22),
            ],
          ),
        ),
        const SizedBox(height: 72),
      ],
    );
  }
}
