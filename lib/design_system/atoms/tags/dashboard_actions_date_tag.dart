import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class DashboardActionsDateTag extends StatelessWidget {
  final Color bgColor;
  final DateTime date;

  const DashboardActionsDateTag({
    super.key,
    required this.bgColor,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    String day = DateFormat.d().format(date);
    String month = DateFormat.MMM().format(date);

    return Container(
      width: 58,
      height: 58,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            day,
            style: TextStyle(
              fontFamily: customTypography.body2Bold.fontFamily,
              fontSize: customTypography.body2Bold.fontSize,
              fontWeight: customTypography.body2Bold.fontWeight,
              color: Colors.white,
            ),
          ),
          Text(
            month,
            style: TextStyle(
              fontFamily: customTypography.body2Medium.fontFamily,
              fontSize: customTypography.body2Medium.fontSize,
              fontWeight: customTypography.body2Medium.fontWeight,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
