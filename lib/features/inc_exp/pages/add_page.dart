import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../blocs/button/button_bloc.dart';
import '../../../blocs/inc_exp/inc_exp_bloc.dart';
import '../../../core/config/app_colors.dart';
import '../../../core/models/inc_exp.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/textfields/custom_text_field.dart';
import '../widgets/category_button.dart';
import '../widgets/title_text.dart';

class AddPage extends StatefulWidget {
  const AddPage({
    super.key,
    required this.isIncome,
  });

  final bool isIncome;

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();

  void checkActive() {
    context.read<ButtonBloc>().add(
          CheckButtonActive(
            controllers: [
              controller1.text,
              controller2.text,
              controller3.text,
            ],
          ),
        );
  }

  void onCategory(String value) {
    if (identical(value, controller3.text)) return;
    controller3.text = value;
    checkActive();
  }

  void onNext() {
    context.read<IncExpBloc>().add(
          AddIncExpEvent(
            model: IncExp(
              id: getCurrentTimestamp(),
              amount: int.tryParse(controller1.text) ?? 0,
              title: controller2.text,
              category: controller3.text,
              isIncome: widget.isIncome,
            ),
          ),
        );
    context.pop();
  }

  @override
  void initState() {
    super.initState();
    checkActive();
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Stack(
        children: [
          Container(
            height: 300,
            decoration: const BoxDecoration(
              color: AppColors.main,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(107),
              ),
            ),
          ),
          Column(
            children: [
              CustomAppbar(
                title: widget.isIncome ? 'Add Income' : 'Add Expense',
                white: true,
              ),
              const SizedBox(height: 30),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 18),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(44),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        blurRadius: 22,
                        spreadRadius: 4,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(44),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        const SizedBox(height: 50),
                        const TitleText('Amount'),
                        const SizedBox(height: 8),
                        CustomTextField(
                          controller: controller1,
                          hintText: widget.isIncome
                              ? 'Income amount'
                              : 'Expense amount',
                          number: true,
                          onChanged: checkActive,
                        ),
                        const SizedBox(height: 8),
                        const TitleText('Title'),
                        const SizedBox(height: 8),
                        CustomTextField(
                          controller: controller2,
                          hintText: 'Name title',
                          onChanged: checkActive,
                        ),
                        const SizedBox(height: 8),
                        const TitleText('Category'),
                        const SizedBox(height: 8),
                        BlocBuilder<ButtonBloc, ButtonState>(
                          builder: (context, state) {
                            return Column(
                              children: [
                                ...getCategories(widget.isIncome).map(
                                  (title) {
                                    return CategoryButton(
                                      title: title,
                                      current: controller3.text,
                                      onPressed: onCategory,
                                    );
                                  },
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 34),
              PrimaryButton(
                title: 'Next',
                onPressed: onNext,
              ),
              const SizedBox(height: 55),
            ],
          ),
        ],
      ),
    );
  }
}
