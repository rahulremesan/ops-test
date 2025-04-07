import 'package:flutter/material.dart';
import 'package:styria_flutter_web/design_system/atoms/buttons/secondary_button.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class LinkCard extends StatefulWidget {
  final String? logo;
  final String? title;
  final String? link;
  final List<String>? tags;
  final VoidCallback? onEdit;
  final VoidCallback? onAddNew;
  final VoidCallback? onCardTap;

  const LinkCard({
    super.key,
    this.logo,
    this.title,
    this.link,
    this.tags,
    this.onEdit,
    this.onAddNew,
    this.onCardTap,
    required String url,
    required String text,
  });

  @override
  _LinkCardState createState() => _LinkCardState();
}

class _LinkCardState extends State<LinkCard> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 769; 

    return MouseRegion(
      onEnter: (_) => setState(() {
        isHovering = true;
      }),
      onExit: (_) => setState(() {
        isHovering = false;
      }),
      child: GestureDetector(
        onTap: widget.onCardTap,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          width: 405,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 0),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 16.0, bottom: 8.0, left: 16.0, right: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.network(
                          widget.logo!,
                          height: 30.0,
                          fit: BoxFit.contain,
                          errorBuilder: (BuildContext context, Object error,
                              StackTrace? stackTrace) {
                            return _defaultAppIcon();
                          },
                        ),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 280,
                              child: Text(
                                widget.title!,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontFamily:
                                      customTypography.body1Medium.fontFamily,
                                  fontSize:
                                      customTypography.body1Medium.fontSize,
                                  fontWeight:
                                      customTypography.body1Medium.fontWeight,
                                  color: AppColors.lacqueredLiquorice,
                                ),
                              ),
                            ),
                            const SizedBox(height: 6),
                            SizedBox(
                              width: 280,
                              child: Text(
                                widget.link!,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontFamily:
                                      customTypography.body3Regular.fontFamily,
                                  fontSize:
                                      customTypography.body3Regular.fontSize,
                                  fontWeight:
                                      customTypography.body3Regular.fontWeight,
                                  color: AppColors.luckyGrey,
                                  letterSpacing: 0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: isSmallScreen || isHovering,
                        child: Container(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: IconButton(
                              onPressed: () {
                                if (widget.onEdit != null) {
                                  widget.onEdit!();
                                }
                              },
                              icon: const Icon(
                                Icons.edit,
                                color: AppColors.lacqueredLiquorice,
                              ),
                              iconSize: 24,
                              padding: EdgeInsets.zero,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(
                thickness: 1,
                color: AppColors.platinum,
                indent: 16,
                endIndent: 16,
              ),
              const SizedBox(height: 8),
              if (widget.tags != null && widget.tags!.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, bottom: 16.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Wrap(
                      alignment: WrapAlignment.start,
                      spacing: 8.0,
                      runSpacing: 8.0,
                      children: widget.tags!.map((tag) {
                        return MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Chip(
                            label: Text(
                              tag,
                              style: TextStyle(
                                fontFamily:
                                    customTypography.button1Medium.fontFamily,
                                fontSize:
                                    customTypography.button1Medium.fontSize,
                                letterSpacing: 0,
                              ),
                            ),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                            backgroundColor: Colors.white,
                            side: const BorderSide(
                              color: AppColors.platinum,
                              width: 1,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                )
              else
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, bottom: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SecondaryButton(
                          isSecondary: true,
                          buttonText: "+ Add tag",
                          onPressed: () {
                            if (widget.onAddNew != null) {
                              widget.onAddNew!();
                            }
                          })
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _defaultAppIcon() {
    return Container(
      height: 30.0,
      width: 30.0,
      color: Colors.grey,
      child: const Icon(Icons.apps, color: Colors.white),
    );
  }
}
