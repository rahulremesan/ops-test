import 'package:flutter/material.dart';
import 'package:flutter_breadcrumb/flutter_breadcrumb.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';
import 'package:go_router/go_router.dart';

class PageBreadcrumbs extends StatelessWidget {
  final List<BreadcrumbData> items;

  const PageBreadcrumbs({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    return BreadCrumb(
      items: items.map((item) {
        return BreadCrumbItem(
          content: MouseRegion(
            cursor: item.isActive
                ? SystemMouseCursors.click
                : SystemMouseCursors.basic,
            child: GestureDetector(
              onTap: item.isActive ? () => context.go(item.link) : null,
              child: Text(
                item.label,
                style: TextStyle(
                  fontFamily: customTypography.body3Regular.fontFamily,
                  fontSize: customTypography.body3Regular.fontSize,
                  fontWeight: customTypography.body3Regular.fontWeight,
                  letterSpacing: 0,
                  color: item.isActive
                      ? AppColors.neutral_300
                      : AppColors.brandBlue,
                ),
              ),
            ),
          ),
        );
      }).toList(),
      divider: const Padding(
          padding: EdgeInsets.fromLTRB(4.0, 0, 4.0, 0),
          child: Icon(
            Icons.chevron_right,
            size: 16,
          )),
    );
  }
}


class BreadcrumbData {
  final String label;
  final String link;
  final bool isActive;

  BreadcrumbData({
    required this.label,
    required this.link,
    this.isActive = false,
  });
}
