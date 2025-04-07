import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styria_flutter_web/constants/route_constants.dart';
import 'package:styria_flutter_web/design_system/atoms/breadcrumbs/page_breadcrumbs.dart';
import 'package:styria_flutter_web/design_system/atoms/buttons/primary_button.dart';
import 'package:styria_flutter_web/design_system/atoms/buttons/tertiary_button.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';
import 'package:styria_flutter_web/shared/providers/links_page_provider.dart';
import 'package:styria_flutter_web/shared/providers/mobile_provider.dart';

class TopLayout extends ConsumerWidget {
  final bool showBreadcrumbs;

  const TopLayout({
    super.key,
    this.showBreadcrumbs = true,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;
    final isDialogOpen = ref.watch(dialogBoxState);
    final isMobile = ref.watch(isMobileProvider);

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!isMobile && showBreadcrumbs) ...[
                PageBreadcrumbs(
                  items: [
                    BreadcrumbData(
                      label: 'Apps',
                      link: AppRoute.apps,
                      isActive: true,
                    ),
                    BreadcrumbData(
                      label: 'Links',
                      link: AppRoute.links,
                      isActive: false,
                    ),
                  ],
                ),
                const SizedBox(height: 24),
              ],
              Text(
                'Links',
                style: TextStyle(
                  fontFamily: customTypography.h3Bold.fontFamily,
                  fontSize: customTypography.h3Bold.fontSize,
                  fontWeight: customTypography.h3Bold.fontWeight,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TertiaryButton(buttonText: "Add Category", onPressed: () {}),
                  const SizedBox(width: 10),
                  PrimaryButton(
                      buttonText: "Add Link",
                      onPressed: () {
                        ref.read(dialogBoxState.notifier).state = !isDialogOpen;
                      }),
                ],
              ),
            ],
          );
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PageBreadcrumbs(
                items: [
                  BreadcrumbData(
                    label: 'Apps',
                    link: AppRoute.apps,
                    isActive: true,
                  ),
                  BreadcrumbData(
                    label: 'Links',
                    link: AppRoute.links,
                    isActive: false,
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Links',
                    style: TextStyle(
                      fontFamily: customTypography.h3Bold.fontFamily,
                      fontSize: customTypography.h3Bold.fontSize,
                      fontWeight: customTypography.h3Bold.fontWeight,
                    ),
                  ),
                  Row(
                    children: [
                      TertiaryButton(
                          buttonText: "Add Category", onPressed: () {}),
                      const SizedBox(width: 20),
                      PrimaryButton(
                          buttonText: "Add Link",
                          onPressed: () {
                            ref.read(dialogBoxState.notifier).state =
                                !isDialogOpen;
                          }),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
            ],
          );
        }
      },
    );
  }
}
