import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/shared/providers/mobile_provider.dart';
import 'calendar_event.dart';

class CalendarEventRectangle extends ConsumerWidget {
  final CalendarEvent event;

  const CalendarEventRectangle({Key? key, required this.event})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
 final isMobile = ref.watch(isMobileProvider);
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: AppColors.rapunzelSilver, width: 1)),
      child: Container(
        height: isMobile ? 16 : 30,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.symmetric(
          vertical: isMobile ? 0 : 6,
          horizontal: isMobile ? 4 : 15,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFFE5E6EB),
          borderRadius: BorderRadius.circular(4),
          border: Border(
            left: BorderSide(color: event.color, width: 5),
          ),
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: double.infinity, // Ensure the text doesn't overflow
          ),
          child: Text(
            event.name,
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: isMobile ? 10 : 12, fontWeight: FontWeight.normal),
            overflow: TextOverflow.ellipsis, // Enable ellipsis for overflow
          ),
        ),
      ),
    );
  }
}
