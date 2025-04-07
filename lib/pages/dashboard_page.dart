import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/layouts/dashboard/actions_layout.dart';
import 'package:styria_flutter_web/layouts/dashboard/apps_layout.dart';
import 'package:styria_flutter_web/layouts/dashboard/calendar_layout.dart';
import 'package:styria_flutter_web/layouts/dashboard/feeds_layout.dart';
import 'package:styria_flutter_web/layouts/dashboard/insights_layout.dart';
import 'package:styria_flutter_web/layouts/main_layout.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;
    bool isMobile = MediaQuery.of(context).size.width <= 600;

    return MainLayout(
      isFooter: true,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: LayoutBuilder(
          builder: (context, constraints) {
            double screenWidth = constraints.maxWidth;
            // double rightPadding = constraints.maxWidth > 1200 ? 120 : 16;

            return Padding(
              padding: screenWidth < 450
                  ? const EdgeInsets.fromLTRB(20, 10, 20, 10)
                  : const EdgeInsets.fromLTRB(40, 20, 40, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  isMobile
                      ? const SizedBox.shrink()
                      : Text(
                          'Home',
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
                  // Wrapping Column in SingleChildScrollView
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          screenWidth < 600
                              // Mobile layout
                              ? Column(
                                  children: [
                                    SizedBox(
                                      height: 320,
                                      child: AppsLayout(
                                        title: "Apps",
                                        buttonLabel: "View All",
                                        appsData: [
                                          AppCardData(
                                            title: 'Time reporting',
                                            icon: Icons.timer_outlined,
                                            isPinned: true,
                                          ),
                                          AppCardData(
                                            title: 'People',
                                            icon: Icons.people_outline,
                                            isPinned: true,
                                          ),
                                          AppCardData(
                                            title: 'Projects',
                                            icon: Icons.folder_outlined,
                                          ),
                                          AppCardData(
                                            title: 'Trainings',
                                            icon: Icons.school_outlined,
                                          ),
                                          AppCardData(
                                            title: 'Awards',
                                            icon: Icons.emoji_events_outlined,
                                          ),
                                          AppCardData(
                                            title: 'Skills',
                                            icon: Icons.psychology_outlined,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    SizedBox(
                                      height: 400,
                                      child: ActionsLayout(
                                        title: "Actions",
                                        buttonLabel: "View All",
                                        actionCardItems: [
                                          ActionCardItems(
                                            title:
                                                'No time was reported yesterday',
                                            description:
                                                'A non-compliance is reported against you by the system.',
                                            date: DateTime(2024, 4, 21),
                                            bgColor: AppColors.coralRed,
                                          ),
                                          ActionCardItems(
                                            title: 'Time report reminder',
                                            description:
                                                'Report your time before 5:00 pm every day.',
                                            date: DateTime(2024, 4, 22),
                                            bgColor: AppColors.brandBlue,
                                          ),
                                          ActionCardItems(
                                            title:
                                                'iGOT Karmayogi - Product check in',
                                            description: 'Reminder',
                                            date: DateTime(2024, 4, 23),
                                            bgColor: AppColors.brandBlue,
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    SizedBox(
                                      height: 400,
                                      child: InsightsLayout(
                                        title: "Insights: This week",
                                        dates: List.generate(
                                          7,
                                          (index) => DateTime.now()
                                              .add(Duration(days: index)),
                                        ),
                                        hoursData: const [
                                          [5.0, 3.0],
                                          [6.5, 1.5],
                                          [4.0, 2.0, 2.0],
                                          [7.0, 1.0],
                                          [8.0],
                                          [3.0, 2.0, 1.0],
                                          [2.0, 1.0],
                                        ],
                                        projects: const [
                                          'Project A',
                                          'Project B',
                                          'Project C'
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    const SizedBox(
                                      height: 400,
                                      child: CalendarLayout(
                                        title: 'Calendar: 2 events today',
                                        buttonLabel: 'View on planner',
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    // SizedBox(
                                    //   height: 600,
                                    //   child: FeedsLayout(
                                    //     title: 'Feeds from today',
                                    //     buttonLabel: 'View all',
                                    //     events: [
                                    //       FeedEvent(
                                    //         profileImage:
                                    //             'https://thumbs.dreamstime.com/b/default-avatar-profile-icon-vector-social-media-user-image-182145777.jpg',
                                    //         name: 'HR',
                                    //         lastSeen: 120,
                                    //         isPrimary: false,
                                    //         heading: 'Event 1 Heading',
                                    //         date: DateTime(2024, 04, 21),
                                    //         buttonText: 'Join Event',
                                    //         startTime:
                                    //             DateTime(2024, 04, 21, 14),
                                    //         endTime: DateTime(2024, 04, 21, 16),
                                    //         postImage:
                                    //             '/assets/images/feeds.png',
                                    //       ),
                                    //     ],
                                    //   ),
                                    // ),
                                  ],
                                )
                              : screenWidth < 1200
                                  // Tablet layout
                                  ? Column(
                                      children: [
                                        SizedBox(
                                          height: 367,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: AppsLayout(
                                                  title: "Apps",
                                                  buttonLabel: "View All",
                                                  appsData: [
                                                    AppCardData(
                                                      title: 'Time reporting',
                                                      icon:
                                                          Icons.timer_outlined,
                                                      isPinned: true,
                                                    ),
                                                    AppCardData(
                                                      title: 'People',
                                                      icon:
                                                          Icons.people_outline,
                                                      isPinned: true,
                                                    ),
                                                    AppCardData(
                                                      title: 'Projects',
                                                      icon:
                                                          Icons.folder_outlined,
                                                    ),
                                                    AppCardData(
                                                      title: 'Trainings',
                                                      icon:
                                                          Icons.school_outlined,
                                                    ),
                                                    AppCardData(
                                                      title: 'Awards',
                                                      icon: Icons
                                                          .emoji_events_outlined,
                                                    ),
                                                    AppCardData(
                                                      title: 'Skills',
                                                      icon: Icons
                                                          .psychology_outlined,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(width: 16),
                                              Expanded(
                                                child: ActionsLayout(
                                                  title: "Actions",
                                                  buttonLabel: "View All",
                                                  actionCardItems: [
                                                    ActionCardItems(
                                                      title:
                                                          'No time was reported yesterday',
                                                      description:
                                                          'A non-compliance is reported against you by the system.',
                                                      date:
                                                          DateTime(2024, 4, 21),
                                                      bgColor:
                                                          AppColors.coralRed,
                                                    ),
                                                    ActionCardItems(
                                                      title:
                                                          'Time report reminder',
                                                      description:
                                                          'Report your time before 5:00 pm every day.',
                                                      date:
                                                          DateTime(2024, 4, 22),
                                                      bgColor:
                                                          AppColors.brandBlue,
                                                    ),
                                                    ActionCardItems(
                                                      title:
                                                          'iGOT Karmayogi - Product check in',
                                                      description: 'Reminder',
                                                      date:
                                                          DateTime(2024, 4, 23),
                                                      bgColor:
                                                          AppColors.brandBlue,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 16),
                                        SizedBox(
                                          height: 367,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: InsightsLayout(
                                                  title: "Insights: This week",
                                                  dates: List.generate(
                                                    7,
                                                    (index) => DateTime.now()
                                                        .add(Duration(
                                                            days: index)),
                                                  ),
                                                  hoursData: const [
                                                    [5.0, 3.0],
                                                    [6.5, 1.5],
                                                    [4.0, 2.0, 2.0],
                                                    [7.0, 1.0],
                                                    [8.0],
                                                    [3.0, 2.0, 1.0],
                                                    [2.0, 1.0],
                                                  ],
                                                  projects: const [
                                                    'Project A',
                                                    'Project B',
                                                    'Project C'
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(width: 16),
                                              const Expanded(
                                                child: CalendarLayout(
                                                  title:
                                                      'Calendar: 2 events today',
                                                  buttonLabel:
                                                      'View on planner',
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 16),
                                        SizedBox(
                                          height: 600,
                                          child: FeedsLayout(
                                            title: 'Feeds from today',
                                            buttonLabel: 'View all',
                                            events: [
                                              FeedEvent(
                                                profileImage:
                                                    'https://thumbs.dreamstime.com/b/default-avatar-profile-icon-vector-social-media-user-image-182145777.jpg',
                                                name: 'HR',
                                                lastSeen: 120,
                                                isPrimary: false,
                                                heading: 'Event 1 Heading',
                                                date: DateTime(2024, 04, 21),
                                                buttonText: 'Join Event',
                                                startTime:
                                                    DateTime(2024, 04, 21, 14),
                                                endTime:
                                                    DateTime(2024, 04, 21, 16),
                                                postImage:
                                                    '/assets/images/feeds.png',
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  : // Desktop layout
                                  Row(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                // height: 367,
                                                height: (constraints.maxHeight -
                                                        120) /
                                                    2,
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: AppsLayout(
                                                        title: "Apps",
                                                        buttonLabel: "View All",
                                                        appsData: [
                                                          AppCardData(
                                                            title:
                                                                'Time reporting',
                                                            icon: Icons
                                                                .timer_outlined,
                                                            isPinned: true,
                                                          ),
                                                          AppCardData(
                                                            title: 'People',
                                                            icon: Icons
                                                                .people_outline,
                                                            isPinned: true,
                                                          ),
                                                          AppCardData(
                                                            title: 'Projects',
                                                            icon: Icons
                                                                .folder_outlined,
                                                          ),
                                                          AppCardData(
                                                            title: 'Trainings',
                                                            icon: Icons
                                                                .school_outlined,
                                                          ),
                                                          AppCardData(
                                                            title: 'Awards',
                                                            icon: Icons
                                                                .emoji_events_outlined,
                                                          ),
                                                          AppCardData(
                                                            title: 'Skills',
                                                            icon: Icons
                                                                .psychology_outlined,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(width: 20),
                                                    Expanded(
                                                      child: ActionsLayout(
                                                        title: "Actions",
                                                        buttonLabel: "View All",
                                                        actionCardItems: [
                                                          ActionCardItems(
                                                            title:
                                                                'No time was reported yesterday',
                                                            description:
                                                                'A non-compliance is reported against you by the system.',
                                                            date: DateTime(
                                                                2024, 4, 21),
                                                            bgColor: AppColors
                                                                .coralRed,
                                                          ),
                                                          ActionCardItems(
                                                            title:
                                                                'Time report reminder',
                                                            description:
                                                                'Report your time before 5:00 pm every day.',
                                                            date: DateTime(
                                                                2024, 4, 22),
                                                            bgColor: AppColors
                                                                .brandBlue,
                                                          ),
                                                          ActionCardItems(
                                                            title:
                                                                'iGOT Karmayogi - Product check in',
                                                            description:
                                                                'Reminder',
                                                            date: DateTime(
                                                                2024, 4, 23),
                                                            bgColor: AppColors
                                                                .brandBlue,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(height: 20),
                                              SizedBox(
                                                // height: 368,
                                                height: (constraints.maxHeight -
                                                        120) /
                                                    2,
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: InsightsLayout(
                                                        title:
                                                            "Insights: This week",
                                                        dates: List.generate(
                                                          7,
                                                          (index) => DateTime
                                                                  .now()
                                                              .add(Duration(
                                                                  days: index)),
                                                        ),
                                                        hoursData: const [
                                                          [5.0, 3.0],
                                                          [6.5, 1.5],
                                                          [4.0, 2.0, 2.0],
                                                          [7.0, 1.0],
                                                          [8.0],
                                                          [3.0, 2.0, 1.0],
                                                          [2.0, 1.0],
                                                        ],
                                                        projects: const [
                                                          'Project A',
                                                          'Project B',
                                                          'Project C'
                                                        ],
                                                      ),
                                                    ),
                                                    const SizedBox(width: 20),
                                                    const Expanded(
                                                      child: CalendarLayout(
                                                        title:
                                                            'Calendar: 2 events today',
                                                        buttonLabel:
                                                            'View on planner',
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(width: 20),
                                        Expanded(
                                          flex: 1,
                                          child: SizedBox(
                                            height: constraints.maxHeight - 100,
                                            child: FeedsLayout(
                                              title: 'Feeds from today',
                                              buttonLabel: 'View all',
                                              events: [
                                                FeedEvent(
                                                  profileImage:
                                                      'https://thumbs.dreamstime.com/b/default-avatar-profile-icon-vector-social-media-user-image-182145777.jpg',
                                                  name: 'HR',
                                                  lastSeen: 120,
                                                  isPrimary: false,
                                                  heading: 'Event 1 Heading',
                                                  date: DateTime(2024, 04, 21),
                                                  buttonText: 'Join Event',
                                                  startTime: DateTime(
                                                      2024, 04, 21, 14),
                                                  endTime: DateTime(
                                                      2024, 04, 21, 16),
                                                  postImage:
                                                      '/assets/images/feeds.png',
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
