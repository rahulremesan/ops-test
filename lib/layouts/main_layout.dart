import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:styria_flutter_web/constants/route_constants.dart';
import 'package:styria_flutter_web/design_system/atoms/footer/footer.dart';
import 'package:styria_flutter_web/design_system/atoms/navigations/side_navigation.dart';
import 'package:styria_flutter_web/design_system/atoms/navigations/top_navigation.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/shared/providers/appbarvisible_provider.dart';
import 'package:styria_flutter_web/shared/providers/mobile_provider.dart';
import 'package:styria_flutter_web/shared/widgets/menu_item.dart';

class CustomFloatingActionButtonLocation extends FloatingActionButtonLocation {
  const CustomFloatingActionButtonLocation();

  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    final double fabX = (scaffoldGeometry.scaffoldSize.width -
            scaffoldGeometry.floatingActionButtonSize.width) /
        2.0;

    final double fabY = scaffoldGeometry.scaffoldSize.height -
        scaffoldGeometry.floatingActionButtonSize.height -
        50.0;

    return Offset(fabX, fabY);
  }
}

class MainLayout extends ConsumerWidget {
  final Widget child;
  final bool? isFooter;
  final bool hideTopNav;
  final bool isInnerPage;
  final bool hideTopNavOnScroll; // Add this

  MainLayout({
    super.key,
    required this.child,
    this.isFooter = false,
    this.hideTopNav = false,
    this.isInnerPage = false,
    this.hideTopNavOnScroll = false, // Add this
  });
  final scrollController = ScrollController();
  final scrollNotifier = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Initial check for mobile state
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final isMobile = MediaQuery.of(context).size.width <= 600;
      ref.read(isMobileProvider.notifier).state = isMobile;
    });

    // Watch the mobile state instead of recalculating
    final isMobile = ref.watch(isMobileProvider);
    final shouldHideTopNav = hideTopNav || (isInnerPage && isMobile);
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: shouldHideTopNav
          ? null
          : (hideTopNavOnScroll && screenWidth <= 1200)
              ? PreferredSize(
                  preferredSize: const Size.fromHeight(kToolbarHeight),
                  child: Consumer(
                    builder: (context, ref, _) {
                      final isVisible = ref.watch(appBarVisibleProvider);
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        height: isVisible ? kToolbarHeight : 0,
                        child: isVisible
                            ? const TopNavigation(
                                logoPath: 'assets/logo/styria_logo.svg',
                                isSvgLogo: true,
                              )
                            : null,
                      );
                    },
                  ),
                )
              : const TopNavigation(
                  logoPath: 'assets/logo/styria_logo.svg',
                  isSvgLogo: true,
                ),
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth > 768) {
          return _buildForLargerScreens(context);
        } else {
          return _buildForSmallerScreens(context);
        }
      }),
      // floatingActionButtonLocation: const CustomFloatingActionButtonLocation(),
      // floatingActionButton: MediaQuery.of(context).size.width < 769
      //     ? IconButton(
      //         visualDensity: VisualDensity.comfortable,
      //         onPressed: () {
      //           //  add function for changing the state to show the bot
      //         },
      //         padding: EdgeInsets.zero,
      //         icon: SvgPicture.asset(
      //           'assets/logo/thor_logo.svg',
      //           width: 60,
      //         ),
      //       )
      //     : null,
    );
  }

  Widget _buildForSmallerScreens(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            color: AppColors.bleachedSilk,
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: child,
            ),
          ),
        ),
        SideNavigation(
          breakpoint: 768,
          items: [
            MenuItem(
              id: 'dashboard',
              icon: Icons.dashboard_outlined,
              link: AppRoute.home,
              labelText: 'Dashboard',
            ),
            MenuItem(
              id: 'apps',
              icon: Icons.apps_outlined,
              link: AppRoute.apps,
              labelText: 'Apps',
            ),
            MenuItem(
              id: 'feeds',
              icon: Icons.calendar_view_day_outlined,
              link: AppRoute.feeds,
              labelText: 'Feeds',
            ),
            MenuItem(
              id: 'planner',
              icon: Icons.calendar_today_outlined,
              link: AppRoute.planner,
              labelText: 'Planner',
            ),
            MenuItem(
              id: 'insight',
              icon: Icons.bar_chart_outlined,
              link: AppRoute.insight,
              labelText: 'Insight',
            ),
            MenuItem(
              id: 'organisation',
              icon: Icons.apartment_outlined,
              link: AppRoute.organisation,
              labelText: 'Organisation',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildForLargerScreens(BuildContext context) {
    return Row(
      children: [
        SideNavigation(
          breakpoint: 768,
          items: [
            MenuItem(
              id: 'dashboard',
              icon: Icons.dashboard_outlined,
              link: AppRoute.home,
              labelText: 'Dashboard',
            ),
            MenuItem(
              id: 'apps',
              icon: Icons.apps_outlined,
              link: AppRoute.apps,
              labelText: 'Apps',
            ),
            MenuItem(
              id: 'feeds',
              icon: Icons.calendar_view_day_outlined,
              link: AppRoute.feeds,
              labelText: 'Feeds',
            ),
            MenuItem(
              id: 'planner',
              icon: Icons.calendar_today_outlined,
              link: AppRoute.planner,
              labelText: 'Planner',
            ),
            MenuItem(
              id: 'insight',
              icon: Icons.bar_chart_outlined,
              link: AppRoute.insight,
              labelText: 'Insight',
            ),
            MenuItem(
              id: 'organisation',
              icon: Icons.apartment_outlined,
              link: AppRoute.organisation,
              labelText: 'Organisation',
            ),
          ],
        ),
        Expanded(
          flex: 10,
          child: Container(
            color: AppColors.snowFlake,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: child,
                ),
                if (isFooter == true)
                  const Footer(
                    itemList: ["Help", "Feedback", "Release Note"],
                    logo: "assets/logo/logo_tarento.svg",
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
