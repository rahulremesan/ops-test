import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:styria_flutter_web/constants/route_constants.dart';
import 'package:styria_flutter_web/constants/route_constants.dart';
import 'package:styria_flutter_web/layouts/app_store/app_store_layout.dart';
import 'package:styria_flutter_web/layouts/main_layout.dart';
import 'package:styria_flutter_web/shared/providers/appstore_provider.dart';
import 'package:styria_flutter_web/shared/providers/mobile_provider.dart';

class AppStorePage extends ConsumerWidget {
  const AppStorePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appData = ref.watch(appDataProvider);
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
                'App Store',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Expanded(
              child: appData.when(
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                error: (error, stack) => Center(
                  child: Text('Error: $error'),
                ),
                data: (apps) => AppStoreLayout(
                  apps: apps,
                  showBreadcrumbs: false,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return MainLayout(
      child: appData.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
        data: (apps) => AppStoreLayout(
          apps: apps,
        ),
      ),
    );
  }
}
