import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styria_flutter_web/layouts/expenses/expense_more_info.dart';
import 'package:styria_flutter_web/layouts/main_layout.dart';

class ExpenseDetailsPage extends ConsumerWidget {
  const ExpenseDetailsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MainLayout(
      child: const Center(child: ExpenseMoreInfo()),
    );
  }
}
