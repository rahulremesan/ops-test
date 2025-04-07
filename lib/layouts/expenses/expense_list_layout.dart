import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:styria_flutter_web/constants/route_constants.dart';
import 'package:styria_flutter_web/design_system/atoms/breadcrumbs/page_breadcrumbs.dart';
import 'package:styria_flutter_web/design_system/atoms/buttons/primary_button.dart';
import 'package:styria_flutter_web/design_system/atoms/tabs/tabs.dart';
import 'package:styria_flutter_web/design_system/molecules/cards/expense_card.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class ExpenseListLayout extends ConsumerWidget {
  final bool showBreadcrumbs;

  const ExpenseListLayout({
    super.key,
    this.showBreadcrumbs = true,
  });
  List<Map<String, dynamic>> _generateExpenseData() {
    return List.generate(7, (index) {
      bool isTeamLunch = index % 2 == 0;
      return {
        'iconData': [
          {
            'icon': Icons.calendar_today,
            'text': isTeamLunch ? '14 Nov 2024' : '12 Nov 2024',
          },
          {
            'icon': Icons.attach_money,
            'text': isTeamLunch ? 'INR 2800/-' : 'INR 12000/-',
          },
          {
            'icon': Icons.business,
            'text': 'Kronos',
          },
          {
            'icon': Icons.person,
            'text': 'Jinesh Sumedhan',
          },
        ],
        'buttonText': 'More Info',
        'projectStatus': 'Pending',
        'projectTitle': isTeamLunch ? 'Team lunch expenses' : 'Travel expenses',
      };
    });
  }

  List<Map<String, dynamic>> _generateExpenseDataOne() {
    return List.generate(3, (index) {
      bool isTeamLunch = index % 2 == 0;
      return {
        'iconData': [
          {
            'icon': Icons.calendar_today,
            'text': isTeamLunch ? '14 Nov 2024' : '12 Nov 2024',
          },
          {
            'icon': Icons.attach_money,
            'text': isTeamLunch ? 'INR 2800/-' : 'INR 12000/-',
          },
          {
            'icon': Icons.business,
            'text': 'Kronos',
          },
          {
            'icon': Icons.person,
            'text': 'Jinesh Sumedhan',
          },
        ],
        'buttonText': 'More Info',
        'projectStatus': 'Approved',
        'projectTitle': isTeamLunch ? 'Team lunch expenses' : 'Travel expenses',
      };
    });
  }

  List<Map<String, dynamic>> _generateExpenseDataTwo() {
    return List.generate(9, (index) {
      bool isTeamLunch = index % 2 == 0;
      return {
        'iconData': [
          {
            'icon': Icons.calendar_today,
            'text': isTeamLunch ? '14 Nov 2024' : '12 Nov 2024',
          },
          {
            'icon': Icons.attach_money,
            'text': isTeamLunch ? 'INR 2800/-' : 'INR 12000/-',
          },
          {
            'icon': Icons.business,
            'text': 'Kronos',
          },
          {
            'icon': Icons.person,
            'text': 'Jinesh Sumedhan',
          },
        ],
        'buttonText': 'More Info',
        'projectStatus': 'Rejected',
        'projectTitle': isTeamLunch ? 'Team lunch expenses' : 'Travel expenses',
      };
    });
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expenseData = _generateExpenseData();
    final expenseDataOne = _generateExpenseDataOne();
    final expenseDataTwo = _generateExpenseDataTwo();

    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    return Padding(
      padding: isMobile
          ? const EdgeInsets.fromLTRB(0, 0, 0, 0)
          : const EdgeInsets.fromLTRB(40, 20, 40, 20),
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.bleachedSilk,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (showBreadcrumbs && !isMobile) ...[
              PageBreadcrumbs(items: [
                BreadcrumbData(
                  label: 'Apps',
                  link: AppRoute.apps,
                  isActive: true,
                ),
                BreadcrumbData(
                  label: 'Expense Reporting',
                  link: AppRoute.expense,
                  isActive: false,
                )
              ]),
              const SizedBox(
                height: 24,
              ),
            ],
            Text(
              'Expense Reporting',
              style: TextStyle(
                fontFamily: customTypography.h3Bold.fontFamily,
                fontSize: customTypography.h3Bold.fontSize,
                fontWeight: customTypography.h3Bold.fontWeight,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            if (screenWidth < 500)
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: SizedBox(
                  width: double.infinity,
                  child: PrimaryButton(
                    onPressed: () {},
                    buttonText: 'Add Expense',
                  ),
                ),
              ),
            Expanded(
              child: Stack(children: [
                Tabs(
                  tabTitles: const ['Approval pending', 'Approved', 'Rejected'],
                  tabViews: [
                    SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: isMobile ? 0 : 20,
                            right: isMobile ? 0 : 20,
                            top: 16,
                            bottom: 16),
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            int crossAxisCount;
                            if (constraints.maxWidth > 1200) {
                              crossAxisCount = 4;
                            } else if (constraints.maxWidth > 900) {
                              crossAxisCount = 3;
                            } else if (constraints.maxWidth > 600) {
                              crossAxisCount = 2;
                            } else {
                              crossAxisCount = 1;
                            }

                            return GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: crossAxisCount,
                                crossAxisSpacing: 16.0,
                                mainAxisSpacing: 16.0,
                                mainAxisExtent: screenWidth > 500 ? 360 : 376,
                              ),
                              itemCount: expenseData.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                final data = expenseData[index];
                                return ExpenseCard(
                                  iconData: data['iconData'],
                                  onPressed: () {
                                    context.go(AppRoute.expenseDetails);
                                  },
                                  buttonText: data['buttonText'],
                                  projectStatus: data['projectStatus'],
                                  projectTitle: data['projectTitle'],
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: isMobile ? 20 : 0,
                            right: 20,
                            top: 16,
                            bottom: 16),
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            int crossAxisCount;
                            if (constraints.maxWidth > 1200) {
                              crossAxisCount = 4;
                            } else if (constraints.maxWidth > 900) {
                              crossAxisCount = 3;
                            } else if (constraints.maxWidth > 600) {
                              crossAxisCount = 2;
                            } else {
                              crossAxisCount = 1;
                            }

                            return GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: crossAxisCount,
                                crossAxisSpacing: 16.0,
                                mainAxisSpacing: 16.0,
                                mainAxisExtent: screenWidth > 500 ? 360 : 376,
                              ),
                              itemCount: expenseDataOne.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                final data = expenseDataOne[index];
                                return ExpenseCard(
                                  iconData: data['iconData'],
                                  onPressed: () {},
                                  buttonText: data['buttonText'],
                                  projectStatus: data['projectStatus'],
                                  projectTitle: data['projectTitle'],
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: isMobile ? 20 : 0,
                            right: 20,
                            top: 16,
                            bottom: 16),
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            int crossAxisCount;
                            if (constraints.maxWidth > 1200) {
                              crossAxisCount = 4;
                            } else if (constraints.maxWidth > 900) {
                              crossAxisCount = 3;
                            } else if (constraints.maxWidth > 600) {
                              crossAxisCount = 2;
                            } else {
                              crossAxisCount = 1;
                            }

                            return GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: crossAxisCount,
                                crossAxisSpacing: 16.0,
                                mainAxisSpacing: 16.0,
                                mainAxisExtent: screenWidth > 500 ? 360 : 376,
                              ),
                              itemCount: expenseDataTwo.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                final data = expenseDataTwo[index];
                                return ExpenseCard(
                                  iconData: data['iconData'],
                                  onPressed: () {},
                                  buttonText: data['buttonText'],
                                  projectStatus: data['projectStatus'],
                                  projectTitle: data['projectTitle'],
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                if (screenWidth > 500)
                  Positioned(
                    top: 10,
                    right: 20,
                    child: PrimaryButton(
                      onPressed: () {
                        context.go(
                          AppRoute.createExpense,
                        );
                      },
                      buttonText: 'Add Expense',
                    ),
                  ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
