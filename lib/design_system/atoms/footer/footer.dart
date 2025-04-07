import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class Footer extends StatelessWidget {
  final List<String>? itemList;
  final String? logo;

  const Footer({super.key, this.itemList, this.logo});

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    return Container(
      height: 80,
      decoration: const BoxDecoration(
          border:
              Border(top: BorderSide(width: 1, color: AppColors.dreamyCloud))),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth < 768) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: itemList?.map((item) {
                            return MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(right: 20.0, top: 12),
                                child: Text(
                                  item,
                                  style: TextStyle(
                                    fontFamily: customTypography
                                        .button1Regular.fontFamily,
                                    fontSize: customTypography
                                        .button1Regular.fontSize,
                                    fontStyle: customTypography
                                        .button1Regular.fontStyle,
                                    fontWeight: customTypography
                                        .button1Regular.fontWeight,
                                  ),
                                ),
                              ),
                            );
                          }).toList() ??
                          [],
                    ),
                    const SizedBox(height: 14),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Made with love by",
                          style: TextStyle(
                            fontFamily:
                                customTypography.button1Regular.fontFamily,
                            fontSize: customTypography.button1Regular.fontSize,
                            fontStyle:
                                customTypography.button1Regular.fontStyle,
                            fontWeight:
                                customTypography.button1Regular.fontWeight,
                          ),
                        ),
                        const SizedBox(width: 12),
                        SvgPicture.asset(
                          logo!,
                          height: 30,
                          width: 130,
                        ),
                      ],
                    ),
                  ],
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.only(right: 100.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: itemList?.map((item) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 40.0),
                                child: MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  onEnter: (event) => {
                                    // put navigations here
                                  },
                                  child: Text(
                                    item,
                                    style: TextStyle(
                                      fontFamily: customTypography
                                          .button1Regular.fontFamily,
                                      fontSize: customTypography
                                          .button1Regular.fontSize,
                                      fontStyle: customTypography
                                          .button1Regular.fontStyle,
                                      fontWeight: customTypography
                                          .button1Regular.fontWeight,
                                    ),
                                  ),
                                ),
                              );
                            }).toList() ??
                            [],
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Text(
                            "Made with love by",
                            style: TextStyle(
                              fontFamily:
                                  customTypography.button1Regular.fontFamily,
                              fontSize:
                                  customTypography.button1Regular.fontSize,
                              fontStyle:
                                  customTypography.button1Regular.fontStyle,
                              fontWeight:
                                  customTypography.button1Regular.fontWeight,
                            ),
                          ),
                          const SizedBox(width: 12),
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            onEnter: (event) => {},
                            child: SvgPicture.asset(
                              logo ?? "assets/logo/default_logo.svg",
                              height: 30,
                              width: 130,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
