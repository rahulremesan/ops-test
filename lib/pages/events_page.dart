import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:styria_flutter_web/constants/route_constants.dart';
import 'package:styria_flutter_web/layouts/events/events_list_layout.dart';
import 'package:styria_flutter_web/layouts/main_layout.dart';
import 'package:styria_flutter_web/shared/providers/mobile_provider.dart';

class EventsPage extends ConsumerWidget {
  const EventsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMobile = ref.watch(isMobileProvider);

    if (isMobile) {
      return MainLayout(
        isInnerPage: true,
        hideTopNav: true, // This will hide top nav only on mobile
        child: Column(
          children: [
            AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => context.go(AppRoute.apps),
              ),
              title: const Text(
                'Events',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Expanded(child: EventsListLayout(showBreadcrumbs: false)),
          ],
        ),
      );
    }
    return  MainLayout(
      child: const Center(child: EventsListLayout()),
    );
  }
}
