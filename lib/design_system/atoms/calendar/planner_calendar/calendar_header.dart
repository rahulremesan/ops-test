import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';
import 'package:styria_flutter_web/shared/providers/mobile_provider.dart';

class CalendarHeader extends ConsumerWidget{
  final DateTime focusedMonth;
  final VoidCallback onPreviousMonth;
  final VoidCallback onNextMonth;
  final VoidCallback onGoToToday;

  const CalendarHeader({
    Key? key,
    required this.focusedMonth,
    required this.onPreviousMonth,
    required this.onNextMonth,
    required this.onGoToToday,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = ref.watch(isMobileProvider);

        if (isMobile) {
          // Mobile layout
          return Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.chevron_left),
                      onPressed: onPreviousMonth,
                    ),
                    const SizedBox(
                        width: 8), // Reduced spacing for smaller screens
                    Text(
                      DateFormat('MMMM yyyy').format(focusedMonth),
                      style: customTypography.h4Bold,
                    ),
                    const SizedBox(
                        width: 8), // Reduced spacing for smaller screens
                    IconButton(
                      icon: const Icon(Icons.chevron_right),
                      onPressed: onNextMonth,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8), // Add spacing between rows
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(78, 36), // Set width and height
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Set border radius
                  ),
                ),
                onPressed: onGoToToday,
                child: const Text('Today'),
              ),
            ],
          );
        } else {
          // Desktop layout
          return Row(
            children: [
              const Spacer(),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.chevron_left),
                    onPressed: onPreviousMonth,
                  ),
                  const SizedBox(width: 20),
                  Text(
                    DateFormat('MMMM yyyy').format(focusedMonth),
                    style: customTypography.h4Bold,
                  ),
                  const SizedBox(width: 20),
                  IconButton(
                    icon: const Icon(Icons.chevron_right),
                    onPressed: onNextMonth,
                  ),
                ],
              ),
              const Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(78, 36), // Set width and height
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Set border radius
                  ),
                ),
                onPressed: onGoToToday,
                child: const Text('Today'),
              ),
            ],
          );
        }
      },
    );
  }
}
