import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/shared/providers/mobile_provider.dart';
import 'calendar_event.dart';
import 'event_rectangle_with_popup.dart';

class CalendarDayCell extends ConsumerWidget {
  final DateTime date;
  final bool isPrevMonth;
  final bool isNextMonth;
  final List<CalendarEvent> events;
  final DateTime selectedDate;
  final VoidCallback onTap;

  static const double _mobileEventLimit = 2;
  static const double _desktopEventLimit = 2;
  static final _dateFormatter = DateFormat('d');

  const CalendarDayCell({
    Key? key,
    required this.date,
    required this.isPrevMonth,
    required this.isNextMonth,
    required this.events,
    required this.selectedDate,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isToday = _isToday(date);
    final isMobile = ref.watch(isMobileProvider);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(isMobile ? 1 : 2),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            color: _isSameDay(date, selectedDate)
                ? AppColors.brandBlue.withOpacity(0.1)
                : Colors.transparent,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _DayNumber(
                day: date.day,
                isToday: isToday,
                isMobile: isMobile,
                textColor: _getDayNumberColor(isToday),
              ),
              if (events.isNotEmpty)
                Expanded(
                  child: _EventList(
                    events: events,
                    date: date,
                    isMobile: isMobile,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getDayNumberColor(bool isToday) {
    if (isPrevMonth || isNextMonth) return Colors.grey;
    if (isToday) return Colors.white;
    return Colors.black;
  }

  bool _isToday(DateTime date) {
    final now = DateTime.now();
    return _isSameDay(date, now);
  }

  bool _isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }
}

class _DayNumber extends StatelessWidget {
  final int day;
  final bool isToday;
  final bool isMobile;
  final Color textColor;

  const _DayNumber({
    required this.day,
    required this.isToday,
    required this.isMobile,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(isMobile ? 10 : 10, isMobile ? 10 : 10,
          isMobile ? 10 : 10, isMobile ? 2 : 10),
      child: Container(
        width: isMobile ? 24 : 32,
        height: isMobile ? 24 : 32,
        alignment: Alignment.center,
        decoration: isToday
            ? const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.brandBlue,
              )
            : null,
        child: Text(
          '$day',
          style: TextStyle(
            fontSize: isMobile ? 12 : 16,
            fontWeight: FontWeight.w400,
            color: textColor,
          ),
        ),
      ),
    );
  }
}

class _EventList extends StatelessWidget {
  final List<CalendarEvent> events;
  final DateTime date;
  final bool isMobile;

  const _EventList({
    required this.events,
    required this.date,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    final eventLimit = isMobile
        ? CalendarDayCell._mobileEventLimit
        : CalendarDayCell._desktopEventLimit;
    final visibleEvents = events.take(eventLimit.toInt()).toList();
    final remainingEvents = events.skip(eventLimit.toInt()).toList();

    return Column(
      children: [
        ...visibleEvents.map((event) => Padding(
              padding: EdgeInsets.only(top: isMobile ? 2 : 4),
              child: EventRectangleWithPopup(event: event, date: date),
            )),
        if (remainingEvents.isNotEmpty)
          MoreEventsPopup(
            events: events,
            date: date,
          ),
      ],
    );
  }
}

class MoreEventsPopup extends ConsumerStatefulWidget {
  final List<CalendarEvent> events;
  final DateTime date;

  const MoreEventsPopup({
    Key? key,
    required this.events,
    required this.date,
  }) : super(key: key);

  @override
  ConsumerState<MoreEventsPopup> createState() => _MoreEventsPopupState();
}

class _MoreEventsPopupState extends ConsumerState<MoreEventsPopup> {
  OverlayEntry? _overlayEntry;
  static const double _popupWidth = 300.0;
  static const double _popupPadding = 20.0;

  @override
  void dispose() {
    _removePopup();
    super.dispose();
  }

  void showMoreEventsPopup(BuildContext context) {
    _removePopup();

    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);
    final size = renderBox.size;
    final screenSize = MediaQuery.of(context).size;

    final adjustedPosition = _calculatePopupPosition(
      Offset(position.dx + (size.width / 2), position.dy),
      screenSize,
    );

    _overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: _removePopup,
              behavior: HitTestBehavior.translucent,
              child: Container(color: Colors.transparent),
            ),
          ),
          Positioned(
            left: adjustedPosition.dx,
            top: adjustedPosition.dy,
            child: Material(
              color: Colors.transparent,
              child: _MoreEventsPopupContent(
                events: widget.events,
                date: widget.date,
                width: _popupWidth,
                onClose: _removePopup,
              ),
            ),
          ),
        ],
      ),
    );

    Overlay.of(context)?.insert(_overlayEntry!);
  }

  Offset _calculatePopupPosition(Offset position, Size screenSize) {
    double leftPosition = position.dx - (_popupWidth / 2);
    double topPosition = position.dy;

    // Adjust horizontal position
    if (leftPosition + _popupWidth > screenSize.width) {
      leftPosition = screenSize.width - _popupWidth - _popupPadding;
    } else if (leftPosition < _popupPadding) {
      leftPosition = _popupPadding;
    }

    // Adjust vertical position if too close to bottom
    final maxHeight = screenSize.height - _popupPadding;
    if (topPosition > maxHeight) {
      topPosition = maxHeight - 300; // Provide some minimum space
    }

    return Offset(leftPosition, topPosition);
  }

  void _removePopup() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    // Remove WidgetRef ref parameter
    final isMobile = ref.watch(isMobileProvider);
    final eventLimit = isMobile
        ? CalendarDayCell._mobileEventLimit
        : CalendarDayCell._desktopEventLimit;
    final remainingCount = widget.events.length - eventLimit.toInt();

    if (remainingCount <= 0) return const SizedBox.shrink();

    return GestureDetector(
      onTap: () => showMoreEventsPopup(context),
      child: Padding(
        padding: EdgeInsets.only(top: isMobile ? 2 : 4.0),
        child: Text(
          '$remainingCount more',
          style: TextStyle(
            fontSize: isMobile ? 8 : 10,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}

class _MoreEventsPopupContent extends ConsumerWidget {
  final List<CalendarEvent> events;
  final DateTime date;
  final double width;
  final VoidCallback onClose;

  const _MoreEventsPopupContent({
    required this.events,
    required this.date,
    required this.width,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: width,
      constraints: const BoxConstraints(maxHeight: 400),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'All Events',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: onClose,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.separated(
                padding: const EdgeInsets.all(8),
                shrinkWrap: true,
                itemCount: events.length,
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                itemBuilder: (context, index) => CalendarEventRectangle(
                  event: events[index],
                  showPopup: false,
                  date: date,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CalendarEventRectangle extends ConsumerWidget {
  final CalendarEvent event;
  final bool showPopup;
  final DateTime date;

  const CalendarEventRectangle({
    Key? key,
    required this.event,
    required this.date,
    this.showPopup = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMobile = ref.watch(isMobileProvider);
    Widget eventWidget = Container(
      height: isMobile ? 24 : 30,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 4 : 6,
        horizontal: 12,
      ),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
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
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
          overflow: TextOverflow.ellipsis, // Enable ellipsis for overflow
        ),
      ),
    );

    if (!showPopup) {
      return eventWidget;
    }

    return EventRectangleWithPopup(
      event: event,
      date: date,
    );
  }
}
