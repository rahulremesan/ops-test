import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';
import 'package:styria_flutter_web/shared/providers/mobile_provider.dart';

class Tabs extends ConsumerStatefulWidget {
  final List<String> tabTitles;
  final List<Widget> tabViews;
  final TabController? controller;

  const Tabs({
    super.key,
    required this.tabTitles,
    required this.tabViews,
    this.controller,
  }) : assert(tabTitles.length == tabViews.length,
            'Tab titles and views must have the same length');

  @override
  ConsumerState<Tabs> createState() => _TabsState();
}

class _TabsState extends ConsumerState<Tabs>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _tabController = widget.controller ??
        TabController(length: widget.tabTitles.length, vsync: this);

    // Initialize PageController to match the initial index of TabController
    _pageController = PageController(initialPage: _tabController.index);

    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        _pageController.jumpToPage(_tabController.index);
      }
    });
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _tabController.dispose();
    }
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;
    final isMobile = ref.watch(isMobileProvider);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IntrinsicWidth(
            child: SizedBox(
              height: 40,
              child: TabBar(
                controller: _tabController,
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                dividerColor: AppColors.platinum,
                labelStyle: TextStyle(
                  fontFamily: customTypography.body3Medium.fontFamily,
                  fontSize: customTypography.body3Medium.fontSize,
                  fontWeight: customTypography.body3Medium.fontWeight,
                  color: AppColors.brandBlue,
                  letterSpacing: 0,
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                unselectedLabelStyle: TextStyle(
                  fontFamily: customTypography.body3Medium.fontFamily,
                  fontSize: customTypography.body3Medium.fontSize,
                  fontWeight: customTypography.body3Medium.fontWeight,
                  color: AppColors.nickel,
                  letterSpacing: 0,
                ),
                onTap: (index) {
                  _pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                tabs: widget.tabTitles
                    .map(
                      (title) => Tab(
                        text: title,
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              physics: const ClampingScrollPhysics(),
              onPageChanged: (index) {
                _tabController.animateTo(index);
              },
              itemCount: widget.tabViews.length,
              itemBuilder: (context, index) {
                return widget.tabViews[index];
              },
            ),
          ),
        ],
      ),
    );
  }
}
