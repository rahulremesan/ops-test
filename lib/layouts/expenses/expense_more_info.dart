import 'package:flutter/material.dart';
import 'package:styria_flutter_web/constants/route_constants.dart';
import 'package:styria_flutter_web/design_system/atoms/breadcrumbs/page_breadcrumbs.dart';
import 'package:styria_flutter_web/design_system/organisms/cards/expense_card_two.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';

class ExpenseMoreInfo extends StatelessWidget {
  const ExpenseMoreInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.bleachedSilk,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PageBreadcrumbs(items: [
              BreadcrumbData(
                label: 'Apps',
                link: AppRoute.apps,
                isActive: true,
              ),
              BreadcrumbData(
                label: 'Expense',
                link: AppRoute.expense,
                isActive: true,
              ),
              BreadcrumbData(
                label: 'Approval Pending',
                link: AppRoute.expense,
                isActive: true,
              ),
              BreadcrumbData(
                label: 'Team Lunch Expenses',
                link: AppRoute.expenseDetails,
                isActive: false,
              )
            ]),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: ExpenseCardTwo(
                    iconData: const [
                      {
                        'icon': Icons.attach_money,
                        'text': 'INR 2800/-',
                      },
                      {
                        'icon': Icons.calendar_month_outlined,
                        'text': '14 Nov 2024',
                      },
                      {
                        'icon': Icons.folder_outlined,
                        'text': 'Kronos',
                      },
                      {
                        'icon': Icons.person_outline,
                        'text': 'Jinesh Sumedhan',
                      },
                    ],
                    projectStatus: "Approved",
                    projectTitle: "Team Lunch Expenses",
                    buttonTextOne: "Edit",
                    buttonTextTwo: "Remind the approver",
                    imageUrl: "imageUrl",
                    onPressed: () {},
                    onPressedTwo: () {},
                    descTitle: "Description",
                    description:
                        "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea.",
                    attachmentCount: "3",
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
