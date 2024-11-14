import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/app_colors.dart';
import '../../../blocs/button/button_bloc.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ButtonBloc, ButtonState>(
      builder: (context, state) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: 48,
          width: 260,
          decoration: BoxDecoration(
            color: state is ButtonInitial ? AppColors.main : Colors.white,
            borderRadius: BorderRadius.circular(33),
            border: state is ButtonInactive
                ? Border.all(
                    width: 2,
                    color: AppColors.main,
                  )
                : null,
            boxShadow: [
              if (state is ButtonInactive)
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 4,
                  offset: const Offset(0, 4),
                ),
            ],
          ),
          child: CupertinoButton(
            onPressed: state is ButtonInitial ? onPressed : null,
            padding: EdgeInsets.zero,
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  color: state is ButtonInitial ? Colors.white : AppColors.main,
                  fontSize: 24,
                  fontFamily: Fonts.ns600,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
