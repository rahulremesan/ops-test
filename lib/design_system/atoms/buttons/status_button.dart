import 'package:flutter/material.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class StatusButton extends StatelessWidget {
  final String status;

  const StatusButton({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;
    final textStyle = TextStyle(
      fontFamily: customTypography.body3Regular.fontFamily,
      fontSize: customTypography.body3Regular.fontSize,
      fontWeight: customTypography.body3Regular.fontWeight,
      letterSpacing: 0,
      color: AppColors.neutral_500,
    );
    Color backgroundColor;
    if (status.toLowerCase() == 'pending') {
      backgroundColor = AppColors.cadmiumYellow;
    } else if (status.toLowerCase() == 'approved') {
      backgroundColor = Colors.green;
    } else {
      backgroundColor = Colors.red;
    }
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4), color: backgroundColor),
      child: Center(
        child: Text(
          'Reimbursement status: $status',
          style: textStyle,
        ),
      ),
    );
  }
}
