import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class WeekDayCard extends StatelessWidget {
  final DateTime date;

  const WeekDayCard({
    super.key,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    final isToday = date.isSameDayAs(DateTime.now());
    final formattedDate = DateFormat('dd MMM, EEEE').format(date);
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;
    final screenWidth = MediaQuery.of(context).size.width;
    bool isSmallScreen = screenWidth < 769;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: isToday || isSmallScreen ? AppColors.brandBlue : null,
      ),
      child: Text(
        formattedDate,
        style: TextStyle(
          fontFamily: isToday || isSmallScreen
              ? customTypography.body2Regular.fontFamily
              : customTypography.body3Regular.fontFamily,
          fontSize: isToday || isSmallScreen
              ? customTypography.body2Regular.fontSize
              : customTypography.body3Regular.fontSize,
          fontWeight: isToday || isSmallScreen
              ? customTypography.body2Regular.fontWeight
              : customTypography.body3Regular.fontWeight,
          fontStyle: isToday || isSmallScreen
              ? customTypography.body2Regular.fontStyle
              : customTypography.body3Regular.fontStyle,
          color: isToday || isSmallScreen
              ? Colors.white
              : AppColors.nickel,
          letterSpacing: 0,
        ),
      ),
    );
  }
}

extension DateTimeExtensions on DateTime {
  bool isSameDayAs(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}
