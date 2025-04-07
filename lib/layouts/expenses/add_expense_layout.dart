import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:styria_flutter_web/constants/route_constants.dart';
import 'package:styria_flutter_web/design_system/atoms/cards/icon_card.dart';
import 'package:styria_flutter_web/design_system/organisms/forms/expense_form.dart';

class AddExpenseLayout extends StatelessWidget {
  const AddExpenseLayout({super.key});

  void handleBackClick(BuildContext context) {
    context.go(AppRoute.expense);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () => handleBackClick(context),
                      child: const IconCard(
                        icon: Icons.arrow_back,
                        text: "Back",
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              const SizedBox(
                width: 688,
                child: ExpenseForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
