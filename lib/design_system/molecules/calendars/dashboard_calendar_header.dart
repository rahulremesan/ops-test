import 'package:flutter/material.dart';
import 'package:styria_flutter_web/design_system/atoms/buttons/secondary_button.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class DashboardCalendarHeader extends StatelessWidget {
  final String title;
  final String buttonLabel;
  final VoidCallback onViewPlanner;

  const DashboardCalendarHeader({
    super.key,
    required this.title,
    required this.buttonLabel,
    required this.onViewPlanner,
  });

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontFamily: customTypography.h5Bold.fontFamily,
                    fontSize: customTypography.h5Bold.fontSize,
                    fontWeight: customTypography.h5Bold.fontWeight,
                  ),
                ),
              ),
             
            ],
          ),
        ),
        SecondaryButton(buttonText: buttonLabel, onPressed: onViewPlanner)
      ],
    );
  }
}
