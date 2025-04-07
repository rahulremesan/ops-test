import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styria_flutter_web/constants/route_constants.dart';
import 'package:styria_flutter_web/design_system/atoms/cards/apps_card.dart';
import 'package:styria_flutter_web/layouts/main_layout.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class AppsPage extends ConsumerWidget {
  const AppsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    int getCrossAxisCount(double width) {
      if (width > 1400) return 6;
      if (width > 800) return 4;
      if (width < 600) return 3;
      return 2;
    }

    double getChildAspectRatio(double width, double height) {
      if (width > 1400) {
        return 2.0;
      } else if (width > 1200) {
        return 1.9;
      } else if (width > 800) {
        return 1.5;
      } else {
        return 1.2;
      }
    }

    return MainLayout(
      isFooter: true,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: LayoutBuilder(
          builder: (context, constraints) {
            int crossAxisCount = getCrossAxisCount(constraints.maxWidth);
            // double rightPadding = constraints.maxWidth > 1200 ? 120 : 16;
            double childAspectRatio = getChildAspectRatio(
                constraints.maxWidth, constraints.maxHeight);

            bool isMobile = MediaQuery.of(context).size.width <= 768;
            return Padding(
              padding: isMobile
                  ? const EdgeInsets.symmetric(horizontal: 20)
                  : const EdgeInsets.fromLTRB(40, 20, 40, 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: isMobile
                          ? const SizedBox.shrink()
                          : Text(
                              'Apps',
                              style: TextStyle(
                                fontFamily: customTypography.h5Bold.fontFamily,
                                fontSize: customTypography.h5Bold.fontSize,
                                fontWeight: customTypography.h5Bold.fontWeight,
                              ),
                              textAlign: TextAlign.left,
                            ),
                    ),
                    GridView.count(
                      crossAxisCount: crossAxisCount,
                      childAspectRatio: childAspectRatio,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: const [
                        AppsCard(
                          title: 'Time reporting',
                          imageSrc: Icons.timer_outlined,
                          isBoldVariant: true,
                          link: AppRoute.timeReport,
                        ),
                        AppsCard(
                          title: 'People',
                          imageSrc: Icons.people_outline,
                          isBoldVariant: true,
                          link: AppRoute.people,
                        ),
                        AppsCard(
                          title: 'App Store',
                          imageSrc: Icons.store,
                          isBoldVariant: true,
                          link: AppRoute.appstore,
                        ),
                        AppsCard(
                          title: 'Trainings',
                          imageSrc: Icons.school_outlined,
                          isBoldVariant: true,
                        ),
                        AppsCard(
                          title: 'Awards',
                          imageSrc: Icons.emoji_events_outlined,
                          isBoldVariant: true,
                          link: AppRoute.awards,
                        ),
                        AppsCard(
                          title: 'Expense reporting',
                          imageSrc: Icons.attach_money_outlined,
                          isBoldVariant: true,
                          link: AppRoute.expense,
                        ),
                        AppsCard(
                          title: 'Links',
                          imageSrc: Icons.link_outlined,
                          isBoldVariant: true,
                          link: AppRoute.links,
                        ),
                        AppsCard(
                          title: 'Events',
                          imageSrc: Icons.calendar_today_outlined,
                          isBoldVariant: true,
                          link: AppRoute.events,
                        ),
                        AppsCard(
                          title: 'News',
                          imageSrc: Icons.newspaper_outlined,
                          isBoldVariant: true,
                          link: AppRoute.news,
                        ),
                        AppsCard(
                          title: 'Skills',
                          imageSrc: Icons.lightbulb_outlined,
                          isBoldVariant: true,
                          link: AppRoute.skills,
                        ),
                        AppsCard(
                          title: 'Classifieds',
                          imageSrc: Icons.shopping_bag_outlined,
                          isBoldVariant: true,
                          link: AppRoute.classifieds,
                        ),
                        AppsCard(
                          title: 'Book Conference Room',
                          imageSrc: Icons.meeting_room,
                          isBoldVariant: true,
                          link: AppRoute.bookConferenceRoom,
                        ),
                      ],
                    ),
                    // if (isMobile)
                    //   const Padding(
                    //     padding: EdgeInsets.only(top: 16.0),
                    //     child: Footer(
                    //       itemList: ["Help", "Feedback", "Release Note"],
                    //       logo: "assets/logo/logo_tarento.svg",
                    //     ),
                    //   ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
