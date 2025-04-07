import 'package:flutter/material.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class NotificationCard extends StatelessWidget {
  final String? imageUrl;
  final String? title;
  final String? time;
  const NotificationCard({super.key, this.imageUrl, this.title, this.time});

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;
    return IntrinsicHeight(
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.snowFlake,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(width: 1, color: AppColors.wolFrame)),
        child: Padding(
          padding: const EdgeInsets.only(
              top: 16.0, bottom: 16.0, left: 24.0, right: 24.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipOval(
                child: imageUrl != null && imageUrl!.isNotEmpty
                    ? Image.network(
                        imageUrl!,
                        height: 42,
                        width: 42,
                        fit: BoxFit.cover,
                        errorBuilder: (BuildContext context, Object error,
                            StackTrace? stackTrace) {
                          return _defaultProfileIcon();
                        },
                      )
                    : _defaultProfileIcon(),
              ),
              const SizedBox(
                width: 8,
              ),
              SizedBox(
                width: 288,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 44,
                      child: Text(
                        title!,
                        style: TextStyle(
                            letterSpacing: 0,
                            fontFamily: customTypography.body2Medium.fontFamily,
                            fontSize: customTypography.body2Medium.fontSize,
                            fontWeight:
                                customTypography.body2Medium.fontWeight),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "${time!} min ago",
                      style: TextStyle(
                        fontFamily: customTypography.caption1Regular.fontFamily,
                        fontSize: customTypography.caption1Regular.fontSize,
                        fontWeight: customTypography.caption1Regular.fontWeight,
                        letterSpacing: 0,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _defaultProfileIcon() {
    return Container(
      height: 42,
      width: 42,
      color: Colors.grey,
      child: const Icon(Icons.person, color: Colors.white),
    );
  }
}
