import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styria_flutter_web/layouts/main_layout.dart';

class OrganisationPage extends ConsumerWidget {
  const OrganisationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MainLayout(
      child: Center(
        child: Text(
          'Welcome to the Organisation Page',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
