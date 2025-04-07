import 'package:flutter/material.dart';
import 'package:styria_flutter_web/design_system/atoms/buttons/appstore_button.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';
import 'package:styria_flutter_web/shared/providers/appstore_provider.dart';
import 'download_dialog.dart';

class AppCard extends StatelessWidget {
  final App app;

  const AppCard({super.key, required this.app});

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = MediaQuery.of(context).size.width < 600;
        return Container(
          width: isMobile ? double.infinity : 544,
          height: isMobile ? 266 : 201,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: EdgeInsets.all(isMobile ? 20 : 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.network(
                      app.logo!,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset('assets/images/app-icon.png');
                      },
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              app.title,
                              style: customTypography.h5Medium,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            if (app.subtitle?.isNotEmpty == true)
                              Text(
                                app.subtitle!,
                                style: TextStyle(
                                  fontFamily:
                                      customTypography.body3Regular.fontFamily,
                                  fontSize:
                                      customTypography.body3Regular.fontSize,
                                  height: 16 / 14,
                                  fontWeight:
                                      customTypography.body3Regular.fontWeight,
                                  color: AppColors.neutral_400,
                                  letterSpacing: 0,
                                ),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                _buildButtonRow(context, app, isMobile, customTypography),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildButtonRow(BuildContext context, App app, bool isMobile,
      CustomTypography customTypography) {
    final platforms = app.platformLinks.keys.toList();
    final links = app.platformLinks.values.toList();

    if (platforms.isEmpty || links.isEmpty) {
      return const Center(child: Text("No platforms available"));
    }

    List<Widget> buttons = [];
    for (int i = 0; i < platforms.length; i++) {
      buttons.add(
        AppstoreButton(
          onTap: () {
            _showDownloadDialog(context, app, i);
          },
          iconPath: platforms[i].toLowerCase() == "android"
              ? 'assets/logo/android.svg'
              : 'assets/logo/apple.svg',
          iconName:
              platforms[i].toLowerCase() == "android" ? "Android" : "Apple",
        ),
      );

      if (i < platforms.length - 1) {
        buttons
            .add(SizedBox(height: isMobile ? 12 : 0, width: isMobile ? 0 : 20));
      }
    }

    return Padding(
      padding:
          EdgeInsets.only(top: isMobile ? 12 : 0, bottom: isMobile ? 5 : 0),
      child: isMobile
          ? Column(children: buttons)
          : Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: buttons,
            ),
    );
  }

  void _showDownloadDialog(BuildContext context, App app, int defaultTab) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return DownloadDialog(
          app: app,
          defaultTabIndex: defaultTab,
        );
      },
    );
  }
}
