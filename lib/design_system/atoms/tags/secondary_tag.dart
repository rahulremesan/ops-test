import 'package:flutter/material.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class SecondaryTag extends StatelessWidget {
  final String? text;
  final Color? color;
  const SecondaryTag({super.key, this.text, this.color});

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;
    return IntrinsicWidth(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
        child: Padding(
          padding: const EdgeInsets.only(
              top: 6.0, bottom: 6.0, right: 10.0, left: 10.0),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: color ?? Colors.transparent),
                height: 10,
                width: 10,
              ),
              const SizedBox(width: 4),
              Text(
                text ?? '',
                style: TextStyle(
                  fontFamily: customTypography.body3Medium.fontFamily,
                  fontSize: customTypography.body3Medium.fontSize,
                  fontWeight: customTypography.body3Medium.fontWeight,
                  fontStyle: customTypography.body3Medium.fontStyle,
                  color: Colors.black,
                  letterSpacing: 0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
