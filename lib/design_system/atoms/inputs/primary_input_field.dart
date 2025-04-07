import 'package:flutter/material.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class PrimaryInputField extends StatefulWidget {
  final String? labelText;
  final String placeholder;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? inputFieldType;
  final String? errorMessage;

  const PrimaryInputField(
      {super.key,
      this.labelText,
      required this.placeholder,
      this.controller,
      this.onChanged,
      this.obscureText = true,
      this.keyboardType = TextInputType.text,
      this.inputFieldType,
      this.errorMessage});

  @override
  State<PrimaryInputField> createState() => _PrimaryInputFieldState();
}

class _PrimaryInputFieldState extends State<PrimaryInputField> {
  late bool _obscureText;

  void toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    double borderRadius = (widget.inputFieldType == "login") ? 4.0 : 8.0;
    Color backgroundColor = (widget.inputFieldType == "login")
        ? Colors.white
        : Colors.transparent;
    TextStyle textStyles = (widget.inputFieldType == "login")
        ? customTypography.body3Regular
            .copyWith(color: Colors.black)
        : customTypography.body3Regular;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(widget.labelText!, style: textStyles),
        ),
        TextField(
          maxLines: 1,
          controller: widget.controller,
          onChanged: widget.onChanged,
          obscureText: _obscureText,
          keyboardType: widget.keyboardType,
          decoration: InputDecoration(
            hintText: widget.placeholder,
            hintStyle: textStyles,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: const BorderSide(color: AppColors.blackWash),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: const BorderSide(color: AppColors.blackWash),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: const BorderSide(color: AppColors.brandBlue),
            ),
            filled: true,
            fillColor: backgroundColor,
            suffixIcon: widget.obscureText
                ? Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        size: 24,
                        color: _obscureText
                            ? AppColors.blackWash
                            : AppColorScheme.light.onSurface,
                      ),
                      onPressed: toggleVisibility,
                    ),
                  )
                : null,
          ),
        ),
        if (widget.errorMessage != null)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(widget.errorMessage!,
                style: TextStyle(
                    fontFamily: customTypography.body3Regular.fontFamily,
                    fontSize: customTypography.body3Regular.fontSize,
                    color: AppColors.scarletRed)),
          ),
      ],
    );
  }
}
