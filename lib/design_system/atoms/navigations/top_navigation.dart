import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:styria_flutter_web/design_system/atoms/inputs/primary_search_field.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/shared/providers/mobile_provider.dart';
import 'package:styria_flutter_web/shared/widgets/responsive_spacer.dart';
import './../../../constants/route_constants.dart';

final searchQueryProvider = StateProvider<String>((ref) => '');
final notificationCountProvider = StateProvider<int>((ref) => 0);
final isSearchVisibleProvider = StateProvider<bool>((ref) => false);

class TopNavigation extends StatelessWidget implements PreferredSizeWidget {
  final String logoPath;
  final bool isSvgLogo;
  final double breakpoint;
  final String? profileImage;

  const TopNavigation({
    super.key,
    required this.logoPath,
    this.isSvgLogo = false,
    this.breakpoint = 768,
    this.profileImage,
  });

  @override
  Size get preferredSize => const Size.fromHeight(126.0);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth <= breakpoint;

    const appBarHeight = 60.0;

    return ProviderScope(
      overrides: [
        searchQueryProvider.overrideWith((ref) => ''),
        notificationCountProvider.overrideWith((ref) => 0),
      ],
      child: SizedBox(
        height: appBarHeight,
        child: Material(
          color: AppColors.brandBlue,
          child: _TopNavigationContent(
            logoPath: logoPath,
            isSvgLogo: isSvgLogo,
            breakpoint: breakpoint,
            isSmallScreen: isSmallScreen,
            profileImage: profileImage,
          ),
        ),
      ),
    );
  }
}

class _TopNavigationContent extends ConsumerWidget {
  final String logoPath;
  final bool isSvgLogo;
  final double breakpoint;
  final bool isSmallScreen;
  final String? profileImage;

  const _TopNavigationContent({
    required this.logoPath,
    required this.isSvgLogo,
    required this.isSmallScreen,
    this.breakpoint = 768,
    this.profileImage,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    try {
      return isSmallScreen
          ? _buildAppBarSmall(context, ref)
          : _buildAppBarNormal(context, ref);
    } catch (e) {
      // Log the error or show a message
      return Center(child: Text('Error: $e'));
    }
  }

  Widget _buildAppBarSmall(BuildContext context, WidgetRef ref) {
    final notificationCount = ref.watch(notificationCountProvider);
    final isSearchVisible = ref.watch(isSearchVisibleProvider);

    if (isSearchVisible) {
      return SizedBox(
        height: 59.0,
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white, size: 24),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              onPressed: () {
                ref.read(isSearchVisibleProvider.notifier).state = false;
                ref.read(searchQueryProvider.notifier).state = '';
              },
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 2, right: 16),
                child: PrimarySearchField(
                  placeholder: 'Search',
                  onChanged: (value) =>
                      ref.read(searchQueryProvider.notifier).state = value,
                  keyboardType: TextInputType.text,
                  obscureText: false,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return SizedBox(
      height: 59.0,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: isSvgLogo
                ? SvgPicture.asset(
                    logoPath,
                    height: 31,
                    width: 107,
                  )
                : Image.asset(
                    logoPath,
                    height: 31,
                    width: 107,
                  ),
          ),
          const Spacer(),
          _buildActionButtons(context, notificationCount, ref),
        ],
      ),
    );
  }

  Widget _buildAppBarNormal(BuildContext context, WidgetRef ref) {
    final notificationCount = ref.watch(notificationCountProvider);

    return Padding(
      padding: const EdgeInsets.only(top: 0.5, right: 30),
      child: AppBar(
        backgroundColor: AppColors.brandBlue,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: isSvgLogo
                  ? SvgPicture.asset(
                      logoPath,
                      height: 31,
                      width: 107,
                    )
                  : Image.asset(
                      logoPath,
                      height: 31,
                      width: 107,
                    ),
            ),
            const ResponsiveSpacer(),
            Expanded(
              child: PrimarySearchField(
                placeholder: 'Search here',
                onChanged: (value) =>
                    ref.read(searchQueryProvider.notifier).state = value,
                keyboardType: TextInputType.text,
                obscureText: false,
              ),
            ),
            const ResponsiveSpacer(),
          ],
        ),
        actions: [
          _buildActionButtons(context, notificationCount, ref),
        ],
      ),
    );
  }

  Widget _buildActionButtons(
      BuildContext context, int notificationCount, WidgetRef ref) {
    final isMobile = ref.watch(isMobileProvider);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (!isSmallScreen)
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {},
              child: SvgPicture.asset(
                "assets/logo/thor_logo.svg",
                height: 24,
              ),
            ),
          ),
        if (isSmallScreen)
          IconButton(
            constraints: const BoxConstraints(
              minHeight: 40,
              minWidth: 40,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 8 : 16,
              vertical: 16,
            ),
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: () {
              ref.read(isSearchVisibleProvider.notifier).state =
                  true; // Add this line
            },
          ),
        Stack(
          children: [
            IconButton(
              constraints: const BoxConstraints(
                minHeight: 40,
                minWidth: 40,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 8 : 16,
                vertical: 16,
              ),
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_outlined,
                color: Colors.white,
                size: 24,
              ),
            ),
            if (notificationCount > 0)
              Positioned(
                right: 6,
                top: 12,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 16,
                    minHeight: 16,
                  ),
                  child: Text(
                    '$notificationCount',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        ),
        if (isSmallScreen)
          Padding(
            padding: EdgeInsets.fromLTRB(isMobile ? 8 : 16, 16, 16, 16),
            child: GestureDetector(
              onTap: () {},
              child: ClipOval(
                child: profileImage != null && profileImage!.isNotEmpty
                    ? Image.network(
                        profileImage!,
                        height: 24,
                        width: 24,
                        fit: BoxFit.cover,
                      )
                    : Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[300],
                        ),
                        child: const Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
              ),
            ),
          ),
        // Logout button only for desktop view
        if (!isSmallScreen) ...[
          IconButton(
            onPressed: () => context.go(AppRoute.login),
            icon: const Icon(Icons.logout),
            color: Colors.white,
            iconSize: 24,
          ),
        ],
      ],
    );
  }
}
