import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styria_flutter_web/constants/route_constants.dart';
import 'package:styria_flutter_web/design_system/atoms/breadcrumbs/page_breadcrumbs.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';
import 'package:styria_flutter_web/shared/providers/mobile_provider.dart';
import 'package:styria_flutter_web/layouts/news/cards_layout.dart';
import 'package:styria_flutter_web/layouts/links/filter_layout.dart';
import 'package:styria_flutter_web/layouts/news/top_layout.dart';
import 'package:styria_flutter_web/shared/providers/mobile_provider.dart';

class NewsMainLayout extends ConsumerWidget {
  bool showBreadcrumbs;
  NewsMainLayout({super.key, this.showBreadcrumbs = true});

  final List<FilterCardProps> filterdata = [
    FilterCardProps(
      heading: 'Location',
      filterData: [
        {'title': 'Current Location', 'status': true},
      ],
      onSelectionChanged: (List<Map<String, dynamic>> selections) {
        print('Categories selections: $selections');
      },
    ),
    FilterCardProps(
      heading: 'Channels',
      filterData: [
        {'title': 'All ', 'status': true},
        {'title': 'World', 'status': false},
        {'title': 'General', 'status': false},
        {'title': 'Ashok leyland', 'status': false},
        {'title': 'Technology', 'status': false},
        {'title': 'Science', 'status': false},
      ],
      onSelectionChanged: (List<Map<String, dynamic>> selections) {
        print('Tags selections: $selections');
      },
    ),
  ];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMobile = ref.watch(isMobileProvider);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;
    return Padding(
      padding:
          EdgeInsets.fromLTRB(isMobile ? 20 : 40, 20, isMobile ? 20 : 40, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showBreadcrumbs && !isMobile) ...[
            TopLayout(
              breadcrumbs: [
                BreadcrumbData(
                  label: 'Apps',
                  link: AppRoute.apps,
                  isActive: true,
                ),
                BreadcrumbData(
                  label: 'News',
                  link: AppRoute.news,
                  isActive: false,
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
          ],
          Text(
            'News',
            style: TextStyle(
              fontFamily: customTypography.h3Bold.fontFamily,
              fontSize: customTypography.h3Bold.fontSize,
              fontWeight: customTypography.h3Bold.fontWeight,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (screenWidth < 800) {
                  return Column(
                    children: [
                      Expanded(
                        child: FilterLayout(filterCardsProps: filterdata),
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        flex: 3,
                        child: SingleChildScrollView(
                          child: CardsLayout(),
                        ),
                      ),
                    ],
                  );
                } else {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          constraints: BoxConstraints(
                            maxHeight: screenHeight,
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                CardsLayout(),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        flex: 1,
                        child: FilterLayout(filterCardsProps: filterdata),
                      ),
                    ],
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
