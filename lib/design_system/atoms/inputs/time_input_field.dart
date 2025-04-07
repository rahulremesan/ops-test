import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';
import 'package:styria_flutter_web/shared/providers/mobile_provider.dart';

// class TimeInputField extends StatefulWidget {
//   final String label;
//   final int initialValue;
//   final int step;
//   final int maxValue;
//   final Function(int) onChanged;

//   const TimeInputField({
//     super.key,
//     required this.label,
//     required this.initialValue,
//     required this.step,
//     required this.maxValue,
//     required this.onChanged,
//   });

//   @override
//   // ignore: library_private_types_in_public_api
//   _TimeInputFieldState createState() => _TimeInputFieldState();
// }

// class _TimeInputFieldState extends State<TimeInputField> {
//   late TextEditingController _controller;
//   late int value;

//   @override
//   void initState() {
//     super.initState();
//     value = widget.initialValue;
//     _controller = TextEditingController(text: value.toString());
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   void _increment() {
//     setState(() {
//       value = (value + widget.step).clamp(0, widget.maxValue);
//       _controller.text = value.toString();
//     });
//     widget.onChanged(value);
//   }

//   void _decrement() {
//     setState(() {
//       value = (value - widget.step).clamp(0, widget.maxValue);
//       _controller.text = value.toString();
//     });
//     widget.onChanged(value);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final customTypography = Theme.of(context).extension<CustomTypography>() ??
//         CustomTypography.light;

//     return SizedBox(
//       height: 60,
//       child: RawKeyboardListener(
//         focusNode: FocusNode(),
//         onKey: (RawKeyEvent event) {
//           if (event is RawKeyDownEvent) {
//             if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
//               _increment();
//             } else if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
//               _decrement();
//             }
//           }
//         },
//         child: TextFormField(
//           style: TextStyle(
//             fontFamily: customTypography.body2Medium.fontFamily,
//             fontSize: customTypography.body2Medium.fontSize,
//             fontWeight: customTypography.body2Medium.fontWeight,
//             color: Colors.black87,
//           ),
//           controller: _controller,
//           decoration: InputDecoration(
//             labelText: widget.label,
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//             ),
//             suffixIcon: Column(
//               mainAxisSize: MainAxisSize.min,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 IconButton(
//                   icon: const Icon(Icons.arrow_drop_up),
//                   padding: EdgeInsets.zero,
//                   onPressed: _increment,
//                   constraints: const BoxConstraints(),
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.arrow_drop_down),
//                   onPressed: _decrement,
//                   padding: EdgeInsets.zero,
//                   constraints: const BoxConstraints(),
//                 ),
//               ],
//             ),
//           ),
//           keyboardType: TextInputType.number,
//           inputFormatters: <TextInputFormatter>[
//             FilteringTextInputFormatter.digitsOnly,
//           ],
//           onChanged: (inputValue) {
//             int parsedValue = int.tryParse(inputValue) ?? value;
//             setState(() {
//               value = parsedValue.clamp(0, widget.maxValue);
//             });
//             widget.onChanged(value);
//           },
//         ),
//       ),
//     );
//   }
// }
class TimeInputField extends ConsumerStatefulWidget {
  final String label;
  final int initialValue;
  final int step;
  final int maxValue;
  final Function(int) onChanged;
  final String? errorText;

  const TimeInputField({
    super.key,
    required this.label,
    required this.initialValue,
    required this.step,
    required this.maxValue,
    required this.onChanged,
    this.errorText,
  });

  @override
  // ignore: library_private_types_in_public_api
  _TimeInputFieldState createState() => _TimeInputFieldState();
}

class _TimeInputFieldState extends ConsumerState<TimeInputField> {
  late TextEditingController _controller;
  late int value;

  @override
  void initState() {
    super.initState();
    value = widget.initialValue;
    _controller = TextEditingController(text: value.toString());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _increment() {
    setState(() {
      value = (value + widget.step).clamp(0, widget.maxValue);
      _controller.text = value.toString();
    });
    widget.onChanged(value);
  }

  void _decrement() {
    setState(() {
      value = (value - widget.step).clamp(0, widget.maxValue);
      _controller.text = value.toString();
    });
    widget.onChanged(value);
  }

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;
    final isMobile = ref.watch(isMobileProvider);

    return SizedBox(
      height: 60,
      child: TextFormField(
        style: TextStyle(
          fontFamily: customTypography.body2Medium.fontFamily,
          fontSize: customTypography.body2Medium.fontSize,
          fontWeight: customTypography.body2Medium.fontWeight,
          color: Colors.black87,
        ),
        controller: _controller,
        decoration: InputDecoration(
          labelText: widget.label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          errorText: widget.errorText,
          isDense: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          suffixIcon: ConstrainedBox(
            // Wrap in ConstrainedBox
            constraints: isMobile
                ? const BoxConstraints(minHeight: 56, maxHeight: 56)
                : const BoxConstraints(minHeight: 48, maxHeight: 48),
            child: Row(
              // Changed from Column to Row for better control
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_drop_up,
                          size: 20,
                        ),
                        padding: EdgeInsets.zero,
                        onPressed: _increment,
                        visualDensity: const VisualDensity(
                          horizontal: -4,
                          vertical: -4,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          size: 20,
                        ),
                        padding: EdgeInsets.zero,
                        onPressed: _decrement,
                        visualDensity: const VisualDensity(
                          horizontal: -4,
                          vertical: -4,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly,
        ],
        onChanged: (inputValue) {
          int parsedValue = int.tryParse(inputValue) ?? value;
          setState(() {
            value = parsedValue.clamp(0, widget.maxValue);
          });
          widget.onChanged(value);
        },
      ),
    );
  }
}
