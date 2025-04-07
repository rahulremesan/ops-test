import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class AppsCard extends StatefulWidget {
  final String title;
  final IconData imageSrc;
  final bool isPinned;
  final bool isBoldVariant;
  final String? link;

  const AppsCard({
    super.key,
    required this.title,
    required this.imageSrc,
    this.isPinned = false,
    this.isBoldVariant = false,
    this.link,
  });

  @override
  _AppsCardState createState() => _AppsCardState();
}

class _AppsCardState extends State<AppsCard> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;
    final screenWidth = MediaQuery.of(context).size.width;

    // Set colors and styles based on the variant
    final color = widget.isBoldVariant
        ? AppColors.lacqueredLiquorice
        : (_isHovering ? AppColors.brandBlue : AppColors.lacqueredLiquorice);
    final fontFamily = widget.isBoldVariant
        ? customTypography.body1Bold.fontFamily
        : customTypography.body3Regular.fontFamily;
    final fontSize = widget.isBoldVariant
        ? (screenWidth < 600
            ? customTypography.body3Bold.fontSize
            : customTypography.body1Bold.fontSize)
        : customTypography.body3Regular.fontSize;
    final fontWeight = widget.isBoldVariant
        ? FontWeight.bold
        : customTypography.body3Regular.fontWeight;
    final backgroundColor = widget.isBoldVariant
        ? (_isHovering ? AppColors.primary_50 : Colors.white)
        : (_isHovering ? AppColors.primary_50 : Colors.transparent);
    final borderColor = widget.isBoldVariant
        ? (_isHovering ? AppColors.brandBlue : Colors.transparent)
        : Colors.transparent;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        setState(() => _isHovering = true);
      },
      onExit: (_) {
        setState(() => _isHovering = false);
      },
      child: GestureDetector(
        onTap: () {
          if (widget.link != null) {
            context.go(widget.link.toString());
          }
        },
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              width: 0.5,
              color: borderColor
            ),
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      widget.imageSrc,
                      size: 24,
                      color: color,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: fontFamily,
                        fontSize: fontSize,
                        fontWeight: fontWeight,
                        color: color,
                        letterSpacing: 0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              if (widget.isPinned)
                const Positioned(
                  top: 8,
                  right: 8,
                  child: Icon(
                    Icons.push_pin,
                    size: 14,
                    color: AppColors.rapunzelSilver,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
