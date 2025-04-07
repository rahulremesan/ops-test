import 'package:flutter/material.dart';
import 'package:styria_flutter_web/constants/route_constants.dart';
import 'package:styria_flutter_web/design_system/atoms/breadcrumbs/page_breadcrumbs.dart';
import 'package:styria_flutter_web/design_system/atoms/cards/appstore_card.dart';
import 'package:styria_flutter_web/shared/providers/appstore_provider.dart';

class AppStoreLayout extends StatelessWidget {
  final List<App> apps;
  final bool showBreadcrumbs;

  const AppStoreLayout({
    super.key,
    required this.apps,
    this.showBreadcrumbs = true,
  });

  static const double cardDesktopWidth = 544.0;
  static const double cardHeight = 201.0;
  static const double desktopPadding = 0.0;
  static const double mobilePadding = 0.0;
  static const double mobileBreakpoint = 700.0;

  int _getCardColumns(double screenWidth, bool isMobile) {
    if (isMobile) return 1;

    double availableWidth = screenWidth - (2 * desktopPadding);
    double cardWithSpacing = cardDesktopWidth + 24.0;

    int columns = (availableWidth / cardWithSpacing).floor();
    return columns < 1 ? 1 : columns;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final screenWidth = MediaQuery.of(context).size.width;
          final isMobile = screenWidth < mobileBreakpoint;
          // final cardColumns = _getCardColumns(constraints.maxWidth, isMobile);

          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(isMobile ? 20 : 40,
                  isMobile ? 20 : 20, isMobile ? 20 : 40, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (showBreadcrumbs && !isMobile) ...[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 32.0),
                      child: PageBreadcrumbs(
                        items: [
                          BreadcrumbData(
                            label: 'Apps',
                            link: AppRoute.apps,
                            isActive: true,
                          ),
                          BreadcrumbData(
                            label: 'Appstore',
                            link: AppRoute.appstore,
                            isActive: true,
                          ),
                        ],
                      ),
                    ),
                  ],
                  Align(
                    alignment: Alignment.topLeft,
                    child: Wrap(
                      spacing: 16.0,
                      runSpacing: 20.0,
                      alignment: WrapAlignment.start,
                      children: apps
                          .map((app) => AppCard(
                                app: App(
                                  id: app.id,
                                  title: app.title,
                                  subtitle: app.subtitle,
                                  logo: app.logo,
                                  platformLinks: app.platformLinks,
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
