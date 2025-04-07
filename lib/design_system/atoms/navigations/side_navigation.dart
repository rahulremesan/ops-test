import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:posthog_flutter/posthog_flutter.dart';
import 'package:styria_flutter_web/constants/route_constants.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';
import 'package:styria_flutter_web/shared/widgets/menu_item.dart';

final menuItemProvider =
    StateProvider.family<List<MenuItem>, List<MenuItem>>((ref, items) => items);

final hoveredMenuItemProvider =
    StateProvider.family<bool, String>((ref, itemId) => false);

final selectedMenuItemProvider = StateProvider<String>((ref) => 'dashboard');

class SideNavigation extends StatelessWidget {
  final double breakpoint;
  final List<MenuItem> items;
  final String? profileImage;

  const SideNavigation({
    super.key,
    this.breakpoint = 768,
    required this.items,
    this.profileImage,
  });

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: _SideNavigationContent(
        breakpoint: breakpoint,
        items: items,
        profileImage: profileImage,
      ),
    );
  }
}

class _SideNavigationContent extends ConsumerWidget {
  final double breakpoint;
  final List<MenuItem> items;
  final String? profileImage;
  const _SideNavigationContent({
    this.breakpoint = 768,
    required this.items,
    this.profileImage,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > breakpoint) {
          return Container(
            width: 100,
            alignment: Alignment.center,
            color: Colors.white,
            child: Center(
              child: _buildNavContent(context, ref),
            ),
          );
        } else {
          return _buildBottomNavigationBar(context, ref);
        }
      },
    );
  }

  Widget _buildNavContent(BuildContext context, WidgetRef ref) {
    final menuItems = ref.watch(menuItemProvider(items));
    final selectedMenuItemId = ref.watch(selectedMenuItemProvider);
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ListView(
              children: [
                ...menuItems.map(
                  (item) => MouseRegion(
                    onEnter: (_) {
                      ref
                          .read(hoveredMenuItemProvider(item.id).notifier)
                          .state = true;
                    },
                    onExit: (_) {
                      ref
                          .read(hoveredMenuItemProvider(item.id).notifier)
                          .state = false;
                    },
                    child: ListTile(
                      minVerticalPadding: 0,
                      contentPadding: EdgeInsets.zero,
                      selected: selectedMenuItemId == item.id,
                      onTap: () async {
                        ref.read(selectedMenuItemProvider.notifier).state =
                            item.id;
                        context.go(item.link!);
                        if (Scaffold.of(context).isDrawerOpen) {
                          Navigator.of(context).pop();
                        }
                        await Posthog().capture(
                            eventName: 'Side menu clicked',
                            properties: {
                              'link': item.link,
                              'clicked': true,
                            });
                      },
                      title: Container(
                        decoration: BoxDecoration(
                            color: (ref.watch(hoveredMenuItemProvider(item.id)))
                                ? AppColors.neutralGray
                                : selectedMenuItemId == item.id
                                    ? AppColors.neutralGray
                                    : Colors.transparent,
                            border: Border(
                                left: BorderSide(
                              width: 4,
                              color: selectedMenuItemId == item.id
                                  ? AppColors.brandBlue
                                  : Colors.transparent,
                            ))),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 16,
                            bottom: 16,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(0),
                                    child: Icon(
                                      item.icon,
                                      size: 24.0,
                                      color: (ref.watch(
                                              hoveredMenuItemProvider(item.id)))
                                          ? AppColors.deepChicoryBlue
                                          : selectedMenuItemId == item.id
                                              ? AppColors.brandBlue
                                              : AppColors.neutral_400,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Text(
                                item.labelText,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: customTypography
                                      .caption1Medium.fontFamily,
                                  fontWeight: customTypography
                                      .caption1Medium.fontWeight,
                                  fontSize:
                                      customTypography.caption1Medium.fontSize,
                                  letterSpacing: 0,
                                  color: selectedMenuItemId == item.id
                                      ? AppColors.brandBlue
                                      : AppColors.neutral_400,
                                ),
                              ),
                              // const SizedBox(height: 22)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 18.0),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  context.go(AppRoute.profile);
                },
                child: ClipOval(
                  child: profileImage != null && profileImage!.isNotEmpty
                      ? Image.network(
                          profileImage!,
                          height: 38,
                          width: 38,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              height: 38,
                              width: 38,
                              color: Colors.grey[300],
                              child: const Icon(
                                Icons.supervised_user_circle,
                                size: 24,
                                color: Colors.black,
                              ),
                            );
                          },
                        )
                      : Container(
                          height: 38,
                          width: 38,
                          color: Colors.grey[300],
                          child: const Icon(
                            Icons.person,
                            size: 24,
                            color: Colors.black,
                          ),
                        ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context, WidgetRef ref) {
    final selectedMenuItemId = ref.watch(selectedMenuItemProvider);
    final selectedIndex =
        items.indexWhere((item) => item.id == selectedMenuItemId);

    final displayItems = [
      ...items.sublist(0, 2),
      MenuItem(
        id: 'thor',
        icon: Icons.person,
        labelText: '',
        link: '',
      ),
      ...items.sublist(2, 3),
      MenuItem(
        id: 'more',
        icon: Icons.more_horiz,
        labelText: 'More',
        onClick: () =>
            _showMoreItemsModal(context, ref, items.sublist(3), selectedIndex),
        link: '',
      ),
    ];

    return Container(
      height: 80,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Add this
        children: displayItems.map((item) {
          if (item.id == 'thor') {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
              child: SvgPicture.asset(
                'assets/logo/thor_logo.svg',
                width: 54,
                height: 54,
              ),
            );
          }

          return Expanded(
            child: _buildBottomNavItem(context, ref, item, selectedIndex),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildDefaultAvatar() {
    return Container(
      height: 54,
      width: 54,
      color: Colors.grey[300],
      child: const Icon(
        Icons.person,
        size: 32,
        color: Colors.black,
      ),
    );
  }

  void _showMoreItemsModal(BuildContext context, WidgetRef ref,
      List<MenuItem> moreItems, int selectedIndex) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return FractionallySizedBox(
          widthFactor: 1.0,
          heightFactor: 0.4,
          child: Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
            ),
            child: Wrap(
              alignment: WrapAlignment.start,
              spacing: 16.0,
              runSpacing: 16.0,
              children: moreItems.map((item) {
                return _buildBottomNavItem(
                  context,
                  ref,
                  item,
                  selectedIndex,
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }

  Widget _buildBottomNavItem(BuildContext context, WidgetRef ref,
      MenuItem menuItem, int selectedIndex) {
    final isSelected = items.indexOf(menuItem) == selectedIndex;
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          if (menuItem.link != null) {
            ref.read(selectedMenuItemProvider.notifier).state = menuItem.id;
          }
          if (menuItem.link != null) {
            ref.read(selectedMenuItemProvider.notifier).state = menuItem.id;
            context.go(menuItem.link!);
          }
          menuItem.onClick?.call();
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          decoration: BoxDecoration(
            border: isSelected
                ? const Border(
                    bottom: BorderSide(color: AppColors.brandBlue, width: 3))
                : null,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildIcon(menuItem.icon, isSelected),
              const SizedBox(height: 4),
              _buildLabel(menuItem.labelText, customTypography, isSelected),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIcon(IconData icon, bool isSelected) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 24.0,
          height: 24.0,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.brandBlue : Colors.transparent,
            borderRadius: BorderRadius.circular(8.0),
          ),
          // padding: const EdgeInsets.all(4.0),
        ),
        Icon(
          size: 20.0,
          icon,
          color: isSelected ? Colors.white : AppColors.black06,
        ),
      ],
    );
  }

  Widget _buildLabel(
      String labelText, CustomTypography customTypography, bool isSelected) {
    return Text(
      labelText,
      style: TextStyle(
        fontFamily: customTypography.caption1Medium.fontFamily,
        fontWeight: customTypography.caption1Medium.fontWeight,
        fontSize: customTypography.caption1Medium.fontSize,
        color: isSelected ? AppColors.brandBlue : AppColors.black06,
      ),
    );
  }
}
