import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:styria_flutter_web/shared/providers/mobile_provider.dart';
import 'calendar_event.dart';
import 'calendar_event_card.dart';

class EventRectangleWithPopup extends ConsumerStatefulWidget {
  final CalendarEvent event;
  final DateTime date;

  const EventRectangleWithPopup({
    Key? key,
    required this.event,
    required this.date,
  }) : super(key: key);

  @override
  ConsumerState<EventRectangleWithPopup> createState() =>
      _EventRectangleWithPopupState();
}

class _EventRectangleWithPopupState
    extends ConsumerState<EventRectangleWithPopup> {
  OverlayEntry? _overlayEntry;
  static const double _maxPopupWidth = 200.0;
  static const double _popupPadding = 12.0;
  static final _dateFormatter = DateFormat('d MMM, yyyy, EEEE');

  @override
  void dispose() {
    _removeEventPopup();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ref.watch(isMobileProvider);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => _showEventPopup(context),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 2 : 4),
          child: CalendarEventRectangle(event: widget.event),
        ),
      ),
    );
  }

  void _showEventPopup(BuildContext context) {
    _removeEventPopup();

    final renderBox = context.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);
    final size = renderBox.size;
    final screenSize = MediaQuery.of(context).size;

    final adjustedPosition = _calculatePopupPosition(
      Offset(
        position.dx + (size.width / 2),
        position.dy + size.height,
      ),
      screenSize,
    );

    _overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              onTap: _removeEventPopup,
              behavior: HitTestBehavior.translucent,
              child: Container(color: Colors.transparent),
            ),
          ),
          Positioned(
            left: adjustedPosition.dx,
            top: adjustedPosition.dy,
            child: Material(
              color: Colors.transparent,
              child: _EventPopupContent(
                event: widget.event,
                date: widget.date,
                maxWidth: _maxPopupWidth,
                onClose: _removeEventPopup,
              ),
            ),
          ),
        ],
      ),
    );

    Overlay.of(context)?.insert(_overlayEntry!);
  }

  Offset _calculatePopupPosition(Offset position, Size screenSize) {
    double leftPosition = position.dx - (_maxPopupWidth / 2);
    double topPosition = position.dy;

    // Adjust horizontal position
    if (leftPosition + _maxPopupWidth > screenSize.width) {
      leftPosition = screenSize.width - _maxPopupWidth - _popupPadding;
    } else if (leftPosition < _popupPadding) {
      leftPosition = _popupPadding;
    }

    return Offset(leftPosition, topPosition);
  }

  void _removeEventPopup() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}

class _EventPopupContent extends StatelessWidget {
  final CalendarEvent event;
  final DateTime date;
  final double maxWidth;
  final VoidCallback onClose;

  const _EventPopupContent({
    required this.event,
    required this.date,
    required this.maxWidth,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: maxWidth,
      ),
      child: IntrinsicWidth(
        child: IntrinsicHeight(
          child: Container(
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Close button container
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8, right: 8, bottom: 4),
                    child: IconButton(
                      icon: const Icon(Icons.close, size: 18),
                      onPressed: onClose,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ),
                ),

                // Colored title container
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 12,
                    ),
                    decoration: BoxDecoration(
                        color: event.color,
                        borderRadius: BorderRadius.circular(4)),
                    child: Text(
                      event.type,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                // Content container
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        event.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _EventRectangleWithPopupState._dateFormatter
                            .format(date),
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
