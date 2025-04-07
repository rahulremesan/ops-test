import 'package:flutter/material.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class FeedsQuotesCard extends StatelessWidget {
  final String? image;
  final String title;
  final String content;
  final bool event;
  final TextStyle? titleStyle;
  final TextStyle? contentStyle;

  const FeedsQuotesCard({
    super.key,
    required this.title,
    required this.content,
    this.image,
    required this.event,
    this.titleStyle,
    this.contentStyle,
  });

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;
    return SingleChildScrollView(
      child: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return Container(
            margin:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/feedGreenImg.jpeg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(title,
                      style: titleStyle ??
                          TextStyle(
                            fontWeight: customTypography.h5Medium.fontWeight,
                            fontSize: customTypography.h5Medium.fontSize,
                            color: Colors.black,
                          )),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    content,
                    style: contentStyle ??
                        TextStyle(
                          fontWeight: customTypography.body1Regular.fontWeight,
                          fontSize: customTypography.body1Regular.fontSize,
                          color: AppColors.black06,
                        ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Container(
            margin:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/feedGreenImg.jpeg',
                      width: 194,
                      height: 102,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          title,
                          style: titleStyle ??
                              TextStyle(
                                fontWeight:
                                    customTypography.h5Medium.fontWeight,
                                fontSize: customTypography.h5Medium.fontSize,
                                color: Colors.black,
                              ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          content,
                          style: contentStyle ??
                              TextStyle(
                                fontWeight:
                                    customTypography.body1Regular.fontWeight,
                                fontSize:
                                    customTypography.body1Regular.fontSize,
                                color: AppColors.black06,
                              ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
