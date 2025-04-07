import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:styria_flutter_web/design_system/atoms/tabs/tabs.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:styria_flutter_web/shared/providers/appstore_provider.dart';

class DownloadDialog extends StatefulWidget {
  final App app;
  final int defaultTabIndex;

  const DownloadDialog({
    super.key,
    required this.app,
    this.defaultTabIndex = 0,
  });

  @override
  State<DownloadDialog> createState() => _DownloadDialogState();
}

class _DownloadDialogState extends State<DownloadDialog>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: widget.app.platformLinks.length,
      vsync: this,
      initialIndex: widget.defaultTabIndex,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    return Dialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: SizedBox(
        width: 750,
        child: LayoutBuilder(
          builder: (context, constraints) {
            bool isMobile = constraints.maxWidth < 720;

            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(isMobile ? 20 : 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (isMobile)
                      _buildMobileHeader(context, customTypography)
                    else
                      _buildDesktopHeader(context, customTypography),
                    const SizedBox(height: 40),
                    _buildDownloadColumns(customTypography),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Column _buildMobileHeader(
      BuildContext context, CustomTypography customTypography) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: const BorderSide(color: Color(0xFFE5E6EB), width: 1),
                ),
              ),
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
        const SizedBox(height: 20),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              widget.app.logo!,
              width: 100,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset('assets/images/app-icon.png', width: 100);
              },
            ),
            const SizedBox(height: 16),
            Text(
              widget.app.title,
              overflow: TextOverflow.ellipsis,
              style: customTypography.h5Medium,
            ),
            const SizedBox(height: 8),
            Text(
              widget.app.subtitle ?? "",
              style: TextStyle(
                fontSize: customTypography.body3Regular.fontSize,
                height: 1.14,
                fontWeight: customTypography.body3Regular.fontWeight,
                color: AppColors.neutral_400,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ],
    );
  }

  Row _buildDesktopHeader(
      BuildContext context, CustomTypography customTypography) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              widget.app.logo!,
              width: 95,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset('assets/images/app-icon.png', width: 95);
              },
            ),
            const SizedBox(width: 16),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Text(
                      widget.app.title,
                      overflow: TextOverflow.ellipsis,
                      style: customTypography.h5Medium,
                    ),
                  ),
                  Text(
                    widget.app.subtitle ?? "",
                    style: TextStyle(
                      fontSize: customTypography.body3Regular.fontSize,
                      fontWeight: customTypography.body3Regular.fontWeight,
                      color: AppColors.neutral_400,
                      letterSpacing: 0,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: const BorderSide(color: Color(0xFFE5E6EB), width: 1),
            ),
          ),
          child: const Text('Close'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  Widget _buildDownloadColumns(CustomTypography customTypography) {
    final screenWidth = MediaQuery.of(context).size.width;

    bool isMobile = screenWidth < 810;
    List<String> platforms = widget.app.platformLinks.keys.toList();
    List<String> links = widget.app.platformLinks.values.toList();

    return Row(
      mainAxisAlignment:
          isMobile ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        SizedBox(
          width: isMobile ? screenWidth * 0.6 : 650,
          height: isMobile ? 470 : 550,
          child: Tabs(
            tabTitles: platforms.map((platform) {
              return platform == 'android' ? 'Android' : 'Apple';
            }).toList(),
            tabViews: List.generate(
              platforms.length,
              (index) => _buildDownloadColumn(
                platforms[index],
                platforms[index],
                links[index],
                customTypography,
              ),
            ),
            controller: _tabController,
          ),
        ),
      ],
    );
  }

  Widget _buildDownloadColumn(String iconPath, String platform, String applink,
      CustomTypography customTypography) {
    final screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 600;
    String platformName = platform == 'android' ? 'Android' : 'Apple';

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
                'assets/logo/${iconPath == 'android' ? 'android' : 'apple'}.svg',
                width: 24),
            const SizedBox(width: 8),
            Text(
              platformName,
              textAlign: TextAlign.center,
              style: customTypography.body1Medium,
            ),
          ],
        ),
        const SizedBox(height: 24),
        Center(
          child: QrImageView(
            data: applink,
            version: QrVersions.auto,
            size: isMobile ? 200 : 336.0,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Scan to download',
          style: customTypography.body3Regular,
        ),
      ],
    );
  }
}
