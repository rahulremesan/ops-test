import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styria_flutter_web/layouts/expenses/add_expense_layout.dart';
import 'package:styria_flutter_web/layouts/main_layout.dart';

class CreateExpensePage extends ConsumerWidget {
  const CreateExpensePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return  MainLayout(
      child: const Center(
        child: AddExpenseLayout()
      ),
    );
  }
}
