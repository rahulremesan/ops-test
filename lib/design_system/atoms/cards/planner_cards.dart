import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class PlannerCards extends StatelessWidget {
  final Color color;
  final String label;
  final DateTime date;

  const PlannerCards({
    super.key,
    required this.color,
    required this.label,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 1100;

    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(16),
      constraints: const BoxConstraints(
        minHeight: 56,
      ),
      width: isMobile ? double.infinity : 405, // Keep the container width fixed
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(2),
            ),
            height: 24,
            width: 24,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              label,
              style: customTypography.body2Medium,
              overflow: TextOverflow.visible,
              // Removing maxLines and overflow to allow natural wrapping
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Text(
            DateFormat('MMM d').format(date),
            style: customTypography.body3Regular,
          ),
        ],
      ),
    );
  }
}
