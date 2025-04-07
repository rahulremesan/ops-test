import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';
import 'package:styria_flutter_web/shared/providers/mobile_provider.dart';

class PrimarySearchField extends ConsumerWidget {
  final String? labelText;
  final String placeholder;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final bool obscureText;
  final TextInputType keyboardType;
  final bool filled;
  final bool filtering;

  const PrimarySearchField({
    super.key,
    this.labelText,
    required this.placeholder,
    this.controller,
    this.onChanged,
    this.obscureText = true,
    this.keyboardType = TextInputType.text,
    this.filled = true,
    this.filtering = true,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;
    final isMobile = ref.watch(isMobileProvider);

    return SizedBox(
      height: 36,
      child: TextField(
        maxLines: 1,
        controller: controller,
        onChanged: onChanged,
        obscureText: obscureText,
        keyboardType: keyboardType,
        style: TextStyle(
          fontFamily: customTypography.body2Regular.fontFamily,
          fontSize: customTypography.body2Regular.fontSize,
          color: Colors.black87,
        ),
        decoration: InputDecoration(
          filled: filled,
          fillColor: filled ? Colors.white : Colors.transparent,
          labelText: labelText,
          labelStyle: TextStyle(
            fontFamily: customTypography.body2Regular.fontFamily,
            fontSize: customTypography.body2Regular.fontSize,
            letterSpacing: 0,
          ),
          hintText: placeholder,
          hintStyle: TextStyle(
            fontFamily: customTypography.body4Regular.fontFamily,
            fontSize: customTypography.body4Regular.fontSize,
            fontWeight: customTypography.body4Regular.fontWeight,
            color: AppColors.luckyGrey,
            letterSpacing: 0,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColors.platinum, width: 1),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColors.platinum, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: AppColors.brandBlue, width: 2),
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: AppColors.lacqueredLiquorice,
            size: 20,
          ),
          suffixIcon: isMobile
              ? null
              : filtering
                  ? IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.tune),
                      color: AppColors.lacqueredLiquorice,
                      iconSize: 16,
                    )
                  : null,
        ),
      ),
    );
  }
}
