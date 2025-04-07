import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styria_flutter_web/design_system/atoms/tags/secondary_tag.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';
import 'package:styria_flutter_web/shared/providers/mobile_provider.dart';

class NewsPrimaryCard extends ConsumerWidget {
  final String? imageUrl;
  final String? tag;
  final String? subTitle;
  final String? title;
  final String? time;
  final bool? tagStatus;
  final VoidCallback? onTap;
  final bool? isSecondary;
  const NewsPrimaryCard(
      {super.key,
      this.imageUrl,
      this.tag,
      this.subTitle,
      this.title,
      this.time,
      this.tagStatus,
      this.onTap,
      this.isSecondary = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMobile = ref.watch(isMobileProvider);
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    final titleStyle = TextStyle(
      fontFamily: (isMobile || isSecondary!)
          ? customTypography.body1Medium.fontFamily
          : customTypography.h4Bold.fontFamily,
      fontSize: (isMobile || isSecondary!)
          ? customTypography.body1Medium.fontSize
          : customTypography.h4Bold.fontSize,
      fontWeight: (isMobile || isSecondary!)
          ? customTypography.body1Medium.fontWeight
          : customTypography.h4Bold.fontWeight,
      fontStyle: (isMobile || isSecondary!)
          ? customTypography.body1Medium.fontStyle
          : customTypography.h4Bold.fontStyle,
      color: AppColors.neutral_500,
      letterSpacing: 0,
    );

    final subTitleStyle = TextStyle(
      fontFamily: (isMobile || isSecondary!)
          ? customTypography.body3Regular.fontFamily
          : customTypography.body1Regular.fontFamily,
      fontSize: (isMobile || isSecondary!)
          ? customTypography.body3Regular.fontSize
          : customTypography.body1Regular.fontSize,
      fontWeight: (isMobile || isSecondary!)
          ? customTypography.body3Regular.fontWeight
          : customTypography.body1Regular.fontWeight,
      fontStyle: (isMobile || isSecondary!)
          ? customTypography.body3Regular.fontStyle
          : customTypography.body1Regular.fontStyle,
      letterSpacing: 0,
    );

    final captionStyle = TextStyle(
      fontFamily: (isMobile || isSecondary!)
          ? customTypography.caption2Regular.fontFamily
          : customTypography.caption1Regular.fontFamily,
      fontSize: (isMobile || isSecondary!)
          ? customTypography.caption2Regular.fontSize
          : customTypography.caption1Regular.fontSize,
      fontWeight: (isMobile || isSecondary!)
          ? customTypography.caption2Regular.fontWeight
          : customTypography.caption1Regular.fontWeight,
      fontStyle: (isMobile || isSecondary!)
          ? customTypography.caption2Regular.fontStyle
          : customTypography.caption1Regular.fontStyle,
      letterSpacing: 0,
    );

    return GestureDetector(
      onTap: onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                isSecondary!
                    ? AspectRatio(
                        aspectRatio: 688 / 300,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8.0),
                            topRight: Radius.circular(8.0),
                          ),
                          child: Image.network(
                            imageUrl!,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            errorBuilder: (BuildContext context, Object error,
                                StackTrace? stackTrace) {
                              return _defaultImageIcon();
                            },
                          ),
                        ),
                      )
                    : Container(
                      height: 304,
                        constraints: const BoxConstraints(
                          maxWidth: double.infinity,
                        ),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8.0),
                            topRight: Radius.circular(8.0),
                          ),
                          child: Image.network(
                            imageUrl!,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            errorBuilder: (BuildContext context, Object error,
                                StackTrace? stackTrace) {
                              return _defaultImageIcon();
                            },
                          ),
                        ),
                      ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0),
                    ),
                  ),
                  child: Padding(
                    padding: isMobile
                        ? const EdgeInsets.all(16.0)
                        : const EdgeInsets.all(24.0),
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: isSecondary! ? 48 : 84,
                          child: Text(
                            title!,
                            style: titleStyle,
                            textAlign: TextAlign.start,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                          height: isSecondary! ? 36 : 48,
                          width: double.infinity,
                          child: Text(
                            subTitle!,
                            style: subTitleStyle,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: Text("${time!} hour ago", style: captionStyle),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            tagStatus!
                ? Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SecondaryTag(
                      text: tag!,
                      color: Colors.amber,
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }

  Widget _defaultImageIcon() {
    return Container(
      width: double.infinity,
      color: Colors.grey,
      child: const Icon(
        Icons.image,
        color: Colors.white,
        size: 50,
      ),
    );
  }
}
