import 'package:flutter/material.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class PrimaryTitle extends StatelessWidget {
  final String title;

  const PrimaryTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    return Text(
      title,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontFamily: customTypography.h5Bold.fontFamily,
        fontSize: customTypography.h5Bold.fontSize,
        fontWeight: customTypography.h5Bold.fontWeight,
      ),
    );
  }
}
