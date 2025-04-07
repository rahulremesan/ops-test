import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

final dropdownProvider =
    StateProvider.family<String, String>((ref, initialValue) => initialValue);

final itemsProvider =
    Provider.family<List<String>, List<String>>((ref, items) => items);

final labelTextProvider =
    StateProvider.family<String, String>((ref, labelText) => labelText);

class PrimarySelectInputSmall extends StatelessWidget {
  final String initialValue;
  final List<String> items;
  final String labelText;

  const PrimarySelectInputSmall({
    super.key,
    required this.initialValue,
    required this.items,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        dropdownProvider(initialValue).overrideWith((ref) => initialValue),
        itemsProvider(items).overrideWith((ref) => items),
        labelTextProvider(labelText).overrideWith((ref) => labelText)
      ],
      child: _PrimarySelectInputSmallContent(
        initialValue: initialValue,
        items: items,
        labelText: labelText,
      ),
    );
  }
}

class _PrimarySelectInputSmallContent extends ConsumerWidget {
  final String initialValue;
  final List<String> items;
  final String labelText;

  const _PrimarySelectInputSmallContent({
    required this.initialValue,
    required this.items,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dropdownValue = ref.watch(dropdownProvider(initialValue));
    final dropdownItems = ref.watch(itemsProvider(items));
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    return SizedBox(
      height: 44,
      child: DropdownButtonFormField(
        value: dropdownValue,
        items: dropdownItems.map((String item) {
          return DropdownMenuItem(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: (String? newValue) {
          if (newValue != null) {
            ref.read(dropdownProvider(initialValue).notifier).state = newValue;
          }
        },
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(
            fontFamily: customTypography.body2Regular.fontFamily,
            fontSize: customTypography.body2Regular.fontSize,
            letterSpacing: 0,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColors.blackWash, width: 1),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColors.blackWash, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColors.brandBlue, width: 2),
          ),
          filled: false,
        ),
      ),
    );
  }
}
