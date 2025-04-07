import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:styria_flutter_web/constants/route_constants.dart';
import 'package:styria_flutter_web/design_system/atoms/buttons/secondary_button.dart';
import 'package:styria_flutter_web/design_system/atoms/cards/apps_card.dart';
import 'package:styria_flutter_web/design_system/atoms/titles/primary_title.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/layouts/dashboard/app_modal.dart';

class AppCardData {
  final String title;
  final IconData icon;
  final bool isPinned;

  AppCardData({
    required this.title,
    required this.icon,
    this.isPinned = false,
  });
}

class AppsLayout extends StatelessWidget {
  final String title;
  final String buttonLabel;
  final List<AppCardData> appsData;

  const AppsLayout({
    super.key,
    required this.title,
    required this.buttonLabel,
    required this.appsData,
  });

  void _showAppsModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AppsModal();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    int crossAxisCount;
    double childAspectRatio;
    if (screenWidth > 1200) {
      crossAxisCount = 3;
      childAspectRatio = 1.5;
    } else if (screenWidth > 900) {
      crossAxisCount = 3;
      childAspectRatio = 1.5;
    } else if (screenWidth > 600) {
      crossAxisCount = 2;
      childAspectRatio = 1.0;
    } else {
      crossAxisCount = 3;
      childAspectRatio = 1.0;
    }

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  PrimaryTitle(title: title),
                  const SizedBox(width: 8),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.keyboard_arrow_down),
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.push_pin_outlined,
                    color: AppColors.lacqueredLiquorice,
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  SecondaryButton(
                    buttonText: buttonLabel,
                    onPressed: () => context.go(AppRoute.apps),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: screenWidth < 600 ? 0 : 35),
          Expanded(
            child: GridView.builder(
              itemCount: appsData.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                childAspectRatio: childAspectRatio,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemBuilder: (context, index) {
                final app = appsData[index];
                return AppsCard(
                  title: app.title,
                  imageSrc: app.icon,
                  isPinned: false,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
