import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styria_flutter_web/constants/route_constants.dart';
import 'package:styria_flutter_web/design_system/atoms/breadcrumbs/page_breadcrumbs.dart';
import 'package:styria_flutter_web/layouts/links/filter_layout.dart';
import 'package:styria_flutter_web/layouts/people/people_card_layout.dart';

class PeoplePageLayout extends ConsumerWidget {
  final bool showBreadcrumbs;

  PeoplePageLayout({
    super.key,
    this.showBreadcrumbs = true,
  });

  final List<FilterCardProps> filterdata = [
    FilterCardProps(
      heading: 'Department',
      filterData: [
        {'title': 'All', 'status': true},
        {'title': 'NXT', 'status': false},
        {'title': 'Digital', 'status': false},
        {'title': 'Enterprise consulting', 'status': false},
        {'title': 'Sweden', 'status': false},
        {'title': 'Finland', 'status': false},
      ],
      onSelectionChanged: (List<Map<String, dynamic>> selections) {
        print('Categories selections: $selections');
      },
    ),
    FilterCardProps(
      heading: 'Team',
      filterData: [
        {'title': 'All', 'status': true},
        {'title': 'Analytics', 'status': false},
        {'title': 'BI', 'status': false},
        {'title': 'Biztalk', 'status': false},
        {'title': 'Business', 'status': false},
        {'title': 'CMS', 'status': false},
        {'title': 'Data science', 'status': false},
        {'title': 'DBA', 'status': false},
      ],
      onSelectionChanged: (List<Map<String, dynamic>> selections) {
        print('Tags selections: $selections');
      },
    ),
    FilterCardProps(
      heading: 'Skills',
      filterData: [
        {'title': 'All', 'status': true},
        {'title': 'Client interaction', 'status': false},
        {'title': 'Customer service', 'status': false},
        {'title': 'XD', 'status': false},
        {'title': 'Responsive', 'status': false},
        {'title': 'UI Design', 'status': false},
        {'title': 'Operations management', 'status': false},
        {'title': 'Operations management', 'status': false},
        {'title': 'Research', 'status': false},
      ],
      onSelectionChanged: (List<Map<String, dynamic>> selections) {
        print('Tags selections: $selections');
      },
    ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Padding(
      padding: EdgeInsets.fromLTRB(
          isMobile ? 20 : 40, 20, isMobile ? 20 : 40, isMobile ? 0 : 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showBreadcrumbs && !isMobile) ...[
            PageBreadcrumbs(
              items: [
                BreadcrumbData(
                    label: 'Apps', link: AppRoute.apps, isActive: true),
                BreadcrumbData(
                    label: 'Employee Directory',
                    link: AppRoute.people,
                    isActive: false),
              ],
            ),
            const SizedBox(height: 32),
          ],
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (screenWidth < 800) {
                  return Column(
                    children: [
                      // PageBreadcrumbs(
                      //   items: [
                      //     BreadcrumbData(label: 'Apps', link: AppRoute.apps, isActive: true),
                      //     BreadcrumbData(
                      //         label: 'Employee Dictionary', link: AppRoute.people, isActive: false),
                      //   ],
                      // ),
                      Expanded(
                        child: FilterLayout(filterCardsProps: filterdata),
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        flex: 3,
                        child: SingleChildScrollView(
                          child: PeopleCardLayout(),
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
                                PeopleCardLayout(),
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
