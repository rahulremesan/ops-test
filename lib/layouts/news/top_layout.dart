import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styria_flutter_web/design_system/atoms/breadcrumbs/page_breadcrumbs.dart';

class TopLayout extends ConsumerWidget {
  final List<BreadcrumbData> breadcrumbs;

  const TopLayout({
    super.key,
    required this.breadcrumbs, 
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PageBreadcrumbs(items: breadcrumbs),
            ],
          );
        } else {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PageBreadcrumbs(items: breadcrumbs),
            ],
          );
        }
      },
    );
  }
}
