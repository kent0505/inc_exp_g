import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inc_exp_g/core/widgets/others/tab_widget.dart';

import '../../../blocs/inc_exp/inc_exp_bloc.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../widgets/history_card.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          const CustomAppbar(title: 'History'),
          const SizedBox(height: 30),
          BlocBuilder<IncExpBloc, IncExpState>(
            builder: (context, state) {
              if (state is IncExpLoadedState) {
                return Expanded(
                  child: TabWidget(
                    page1: ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 26),
                      children: [
                        const SizedBox(height: 15),
                        ...List.generate(
                          state.models.length,
                          (index) {
                            return HistoryCard(model: state.models[index]);
                          },
                        )
                      ],
                    ),
                    page2: ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 26),
                      children: [
                        const SizedBox(height: 15),
                        ...List.generate(
                          state.models.length,
                          (index) {
                            return HistoryCard(model: state.models[index]);
                          },
                        )
                      ],
                    ),
                    page3: ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 26),
                      children: [
                        const SizedBox(height: 15),
                        ...List.generate(
                          state.models.length,
                          (index) {
                            return HistoryCard(model: state.models[index]);
                          },
                        )
                      ],
                    ),
                    title1: 'Income',
                    title2: 'All',
                    title3: 'Expense',
                  ),
                );
              }

              return Container();
            },
          ),
        ],
      ),
    );
  }
}
