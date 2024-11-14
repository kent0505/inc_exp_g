import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/inc_exp/inc_exp_bloc.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/others/tab_widget.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppbar(title: 'Statistic', back: false),
        const SizedBox(height: 30),
        BlocBuilder<IncExpBloc, IncExpState>(
          builder: (context, state) {
            if (state is IncExpLoadedState) {
              return Expanded(
                child: TabWidget(
                  titles: const ['Day', 'Week', 'Month'],
                  pages: const [
                    Text('1'),
                    Text('2'),
                    Text('3'),
                  ],
                ),
              );
            }

            return Container();
          },
        ),
      ],
    );
  }
}
