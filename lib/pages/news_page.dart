import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:styria_flutter_web/constants/route_constants.dart';
import 'package:styria_flutter_web/layouts/main_layout.dart';
import 'package:styria_flutter_web/layouts/news/news_main_layout.dart';
import 'package:styria_flutter_web/shared/providers/mobile_provider.dart';

class NewsPage extends ConsumerWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Use the same provider from MainLayout
    final isMobile = ref.watch(isMobileProvider);

    if (isMobile) {
      return MainLayout(
        isInnerPage: true,
        hideTopNav: true,
        child: Column(
          children: [
            AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => context.go(AppRoute.apps),
              ),
              title: const Text(
                'News',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Expanded(child: NewsMainLayout(showBreadcrumbs: false)),
          ],
        ),
      );
    }

    return MainLayout(
      child: NewsMainLayout(showBreadcrumbs: true),
    );
  }
}
