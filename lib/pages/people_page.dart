import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:styria_flutter_web/constants/route_constants.dart';
import 'package:styria_flutter_web/layouts/main_layout.dart';
import 'package:styria_flutter_web/layouts/people/people_page_layout.dart';
import 'package:styria_flutter_web/shared/providers/mobile_provider.dart';

class PeoplePage extends ConsumerWidget {
  const PeoplePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMobile = ref.watch(isMobileProvider);

    if (isMobile) {
      return MainLayout(
        hideTopNav: true,
        child: Column(
          children: [
            AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => context.go(AppRoute.apps),
              ),
              title: const Text(
                'Employee Directory',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Expanded(
              child: PeoplePageLayout(showBreadcrumbs: false),
            ),
          ],
        ),
      );
    }

    return MainLayout(
      hideTopNav: false,
      child: PeoplePageLayout(showBreadcrumbs: true),
    );
  }
}
