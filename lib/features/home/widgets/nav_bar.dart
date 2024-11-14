import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/others/svg_widget.dart';
import '../../../core/widgets/buttons/cuper_button.dart';
import '../../../blocs/navbar/navbar_bloc.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 72,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          color: AppColors.main,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(14),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 7.5,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BlocBuilder<NavbarBloc, NavbarState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 44,
                  child: Center(
                    child: Container(
                      height: 30,
                      width: 146,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 11),
                          if (state is NavbarInitial)
                            const SvgWidget(
                              'assets/tab1.svg',
                              color: AppColors.main,
                            )
                          else if (state is NavbarStatistic)
                            const SvgWidget(
                              'assets/tab2.svg',
                              color: AppColors.main,
                            )
                          else if (state is NavbarLessons)
                            const SvgWidget(
                              'assets/tab3.svg',
                              color: AppColors.main,
                            )
                          else
                            const SvgWidget(
                              'assets/tab4.svg',
                              color: AppColors.main,
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
                if (state is! NavbarInitial)
                  _NavBarButton(
                    id: 1,
                    active: state is NavbarInitial,
                    onPressed: () {
                      context.read<NavbarBloc>().add(ChangePageEvent(index: 0));
                    },
                  ),
                if (state is! NavbarStatistic)
                  _NavBarButton(
                    id: 2,
                    active: state is NavbarStatistic,
                    onPressed: () {
                      context.read<NavbarBloc>().add(ChangePageEvent(index: 1));
                    },
                  ),
                if (state is! NavbarLessons)
                  _NavBarButton(
                    id: 3,
                    active: state is NavbarLessons,
                    onPressed: () {
                      context.read<NavbarBloc>().add(ChangePageEvent(index: 2));
                    },
                  ),
                if (state is! NavbarSettings)
                  _NavBarButton(
                    id: 4,
                    active: state is NavbarSettings,
                    onPressed: () {
                      context.read<NavbarBloc>().add(ChangePageEvent(index: 3));
                    },
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _NavBarButton extends StatelessWidget {
  const _NavBarButton({
    required this.id,
    required this.active,
    required this.onPressed,
  });

  final int id;
  final bool active;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return CuperButton(
      onPressed: onPressed,
      padding: 0,
      child: SizedBox(
        height: 44,
        width: 44,
        child: Center(
          child: SvgWidget('assets/tab$id.svg'),
        ),
      ),
    );
  }
}