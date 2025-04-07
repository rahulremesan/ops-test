import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:styria_flutter_web/design_system/atoms/breadcrumbs/page_breadcrumbs.dart';
import 'package:styria_flutter_web/design_system/atoms/cards/project_deadline_card.dart';
import 'package:styria_flutter_web/design_system/atoms/cards/user_card2.dart';
import 'package:styria_flutter_web/design_system/atoms/rating_card.dart/rating_card.dart';
import 'package:styria_flutter_web/design_system/atoms/tabs/tabs.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
// import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';
import 'package:styria_flutter_web/layouts/people/basic_details.dart';
import 'package:styria_flutter_web/layouts/people/projects.dart';
import 'package:styria_flutter_web/layouts/people/skill_list.dart';

import './../../design_system/theme/custom_typography.dart';

class ProfileDetailLayout extends ConsumerWidget {
  final List<ProjectDeadlineCard> projectList = [
    ProjectDeadlineCard(
        projectName: 'Sap - Sales',
        startDate: DateTime(2023),
        endDate: DateTime(2024)),
    ProjectDeadlineCard(
        projectName: 'Leave',
        startDate: DateTime(2023),
        endDate: DateTime(2024)),
    ProjectDeadlineCard(
        projectName: 'Digital sales ',
        startDate: DateTime(2023),
        endDate: DateTime(2024)),
    ProjectDeadlineCard(
        projectName: 'IGot Karmayogi',
        startDate: DateTime(2023),
        endDate: DateTime(2024)),
  ];

  final List<RatingWidget> skillList = [
    const RatingWidget(
      label: 'Client interaction',
      id: 'clientInteraction',
      starCount: 4,
      starSize: 16.0,
      spaceBetweenStars: 8.0,
      textSize: 16.0,
      spaceBetweenStarsAndLabel: 8.0,
    ),
    const RatingWidget(
      label: 'Customer service',
      id: 'customerService',
      starCount: 4,
      starSize: 16.0,
      spaceBetweenStars: 8.0,
      textSize: 16.0,
      spaceBetweenStarsAndLabel: 8.0,
    ),
    const RatingWidget(
      label: 'Customer relationship management (CRM)',
      id: 'customerRelationship',
      starCount: 4,
      starSize: 16.0,
      spaceBetweenStars: 8.0,
      textSize: 16.0,
      spaceBetweenStarsAndLabel: 8.0,
    ),
    const RatingWidget(
      label: 'Enterprise Mobility',
      id: 'enterpriseMobility',
      starCount: 4,
      starSize: 16.0,
      spaceBetweenStars: 8.0,
      textSize: 16.0,
      spaceBetweenStarsAndLabel: 8.0,
    ),
    const RatingWidget(
      label: 'Mobile application testing',
      id: 'mobApplicationTesting',
      starCount: 4,
      starSize: 16.0,
      spaceBetweenStars: 8.0,
      textSize: 16.0,
      spaceBetweenStarsAndLabel: 8.0,
    ),
    const RatingWidget(
      label: 'Client interaction',
      id: 'clientInteraction',
      starCount: 4,
      starSize: 16.0,
      spaceBetweenStars: 8.0,
      textSize: 16.0,
      spaceBetweenStarsAndLabel: 8.0,
    ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;
    final screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = MediaQuery.of(context).size.width <= 600;
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
      child: Container(
        // padding: const EdgeInsets.all(16),
        color: AppColors.snowFlake,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            isMobile
                ? const SizedBox.shrink()
                : Text(
                    'Profile',
                    style: TextStyle(
                      fontFamily: customTypography.h5Bold.fontFamily,
                      fontSize: customTypography.h5Bold.fontSize,
                      fontWeight: customTypography.h5Bold.fontWeight,
                    ),
                    textAlign: TextAlign.left,
                  ),
            const SizedBox(
              height: 27,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: screenWidth > 1440
                    ? Center(
                        child: FractionallySizedBox(
                          widthFactor: 0.5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(16, 16, 16, 16),
                                  width: double.infinity,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        topRight: Radius.circular(8)),
                                  ),
                                  child: const UserCard2(
                                    name: 'Abhishek Saha',
                                    imageSize: 55,
                                    designation: 'Vice president',
                                    department: 'Enterprise consulting',
                                  )),
                              // const SizedBox(height: 20,),
                              Expanded(
                                  child: Material(
                                child: Tabs(tabTitles: const [
                                  'Basic Details',
                                  'Skills',
                                  'Projects'
                                ], tabViews: [
                                  const BasicDetails(
                                    name: 'Abhishek Saha',
                                    image: '',
                                    email: 'abhishek.gupta@tarento.com',
                                    phone: '+91 9972222610',
                                    department: 'Sales & marketing',
                                    workLoc: 'Bengaluru - Umiya Emporium',
                                    careerStarted:
                                        '23 Dec 2010 (as of today: 10 years, 6 moths, 6 days)',
                                    empId: 808,
                                    dateOfJoining: '3 dec 2018',
                                  ),
                                  SkillList(skillList: skillList),
                                  ProjectList(projectList: projectList),
                                ]),
                              ))
                            ],
                          ),
                        ),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                              padding:
                                  const EdgeInsets.fromLTRB(16, 16, 16, 16),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8)),
                              child: const UserCard2(
                                name: 'Abhishek Saha',
                                image: '',
                                imageSize: 55,
                                designation: 'Vice president',
                                department: 'Enterprise consulting',
                              )),
                          // const SizedBox(height: 20,),
                          Expanded(
                              child: Tabs(tabTitles: const [
                            'Basic Details',
                            'Skills',
                            'Projects'
                          ], tabViews: [
                            const BasicDetails(
                              name: 'Abhishek Saha',
                              image: '',
                              email: 'abhishek.gupta@tarento.com',
                              phone: '+91 9972222610',
                              department: 'Sales & marketing',
                              workLoc: 'Bengaluru - Umiya Emporium',
                              careerStarted:
                                  '23 Dec 2010 (as of today: 10 years, 6 moths, 6 days)',
                              empId: 808,
                              dateOfJoining: '3 dec 2018',
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                              child: Expanded(
                                  child: SkillList(skillList: skillList)),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                              child: Expanded(
                                  child: ProjectList(projectList: projectList)),
                            ),
                          ]))
                        ],
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
