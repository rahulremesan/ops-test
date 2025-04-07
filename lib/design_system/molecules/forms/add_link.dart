import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styria_flutter_web/design_system/atoms/buttons/primary_button.dart';
import 'package:styria_flutter_web/design_system/atoms/inputs/secondary_input_field.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';
import 'package:styria_flutter_web/shared/providers/mobile_provider.dart';

class AddLink extends ConsumerStatefulWidget {
  final String? title;
  final String? defaultLink;
  final String? defaultTitle;
  final List<String>? defaultTags;
  final String? buttonContent;
  final String? defaultRadioValue;
  final ValueChanged<String>? onRadioValueChange;
  final Function(String link, String title, String tags, String privacy)? onAdd;
  final Function()? onClear;
  final Function()? onClose;

  const AddLink({
    super.key,
    this.title,
    this.defaultLink,
    this.defaultTitle,
    this.defaultTags,
    this.buttonContent,
    this.defaultRadioValue,
    this.onRadioValueChange,
    this.onAdd,
    this.onClear,
    this.onClose,
  });

  @override
  // ignore: library_private_types_in_public_api
  ConsumerState<AddLink> createState() => _AddLinkState();
}

class _AddLinkState extends ConsumerState<AddLink> {
  late String _radioValue;
  late final TextEditingController _linkController;
  late final TextEditingController _titleController;
  late final TextEditingController _tagsController;

  @override
  void initState() {
    super.initState();
    _linkController = TextEditingController(text: widget.defaultLink);
    _titleController = TextEditingController(text: widget.defaultTitle);
    _tagsController =
        TextEditingController(text: widget.defaultTags?.join(', '));
    _radioValue = widget.defaultRadioValue ?? 'Public';
  }

  @override
  void dispose() {
    _linkController.dispose();
    _titleController.dispose();
    _tagsController.dispose();
    super.dispose();
  }

  void _handleRadioValueChange(String? value) {
    setState(() {
      _radioValue = value!;
    });
    widget.onRadioValueChange!(_radioValue);
  }

  void _handleAddLink() {
    final link = _linkController.text;
    final title = _titleController.text;
    final tags = _tagsController.text;
    widget.onAdd!(link, title, tags, _radioValue);
  }

  void _handleClearAll() {
    _linkController.clear();
    _titleController.clear();
    _tagsController.clear();
    setState(() {
      _radioValue = widget.defaultRadioValue ?? 'Public';
    });
    widget.onClear!();
  }

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    return IntrinsicHeight(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(top: 24.0, left: 24.0, right: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.title ?? "Add link",
                      style: TextStyle(
                        fontFamily: customTypography.h5Bold.fontFamily,
                        fontSize: customTypography.h5Bold.fontSize,
                        fontWeight: customTypography.h5Bold.fontWeight,
                        letterSpacing: 0,
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          widget.onClose?.call();
                        },
                        icon: const Icon(Icons.close)),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: SecondaryInputField(
                  controller: _linkController,
                  obscureText: false,
                  placeholder: 'Link',
                  labelText: "Link",
                ),
              ),
              const SizedBox(height: 18),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: SecondaryInputField(
                  controller: _titleController,
                  obscureText: false,
                  placeholder: 'Title',
                  labelText: "Title",
                ),
              ),
              const SizedBox(height: 18),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: SecondaryInputField(
                  controller: _tagsController,
                  obscureText: false,
                  placeholder: 'Add Tags',
                  labelText: "Add Tags",
                ),
              ),
              const SizedBox(height: 18),
              Padding(
                padding: const EdgeInsets.only(left: 24.0, right: 24),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.platinum, width: 1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 24.0, top: 16, bottom: 16, right: 24),
                    child: Wrap(
                      alignment: WrapAlignment.start,
                      spacing: 8.0,
                      runSpacing: 8.0,
                      children: [
                        IntrinsicWidth(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                  color: AppColors.platinum, width: 1),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 2.0, bottom: 2.0, right: 36, left: 36),
                              child: Row(
                                children: [
                                  Radio<String>(
                                    value: 'Public',
                                    groupValue: _radioValue,
                                    onChanged: _handleRadioValueChange,
                                  ),
                                  Text(
                                    "Public",
                                    style: TextStyle(
                                      fontFamily: customTypography
                                          .body2Regular.fontFamily,
                                      fontSize: customTypography
                                          .body2Regular.fontSize,
                                      fontWeight: customTypography
                                          .body2Regular.fontWeight,
                                      color: Colors.black,
                                      letterSpacing: 0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        IntrinsicWidth(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                  color: AppColors.platinum, width: 1),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 2.0, bottom: 2.0, right: 36, left: 36),
                              child: Row(
                                children: [
                                  Radio<String>(
                                    value: 'Private',
                                    groupValue: _radioValue,
                                    onChanged: _handleRadioValueChange,
                                  ),
                                  Text(
                                    "Private",
                                    style: TextStyle(
                                      fontFamily: customTypography
                                          .body2Regular.fontFamily,
                                      fontSize: customTypography
                                          .body2Regular.fontSize,
                                      fontWeight: customTypography
                                          .body2Regular.fontWeight,
                                      color: Colors.black,
                                      letterSpacing: 0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 24.0, left: 24, top: 18),
                child: SizedBox(
                  width: double.infinity,
                  child: ref.watch(isMobileProvider)
                      ? Column(
                          children: [
                            PrimaryButton(
                              buttonText: "Clear all",
                              onPressed: _handleClearAll,
                              isSecondary: true,
                            ),
                            const SizedBox(height: 18),
                            PrimaryButton(
                              buttonText: widget.buttonContent ?? "Add Link",
                              onPressed: _handleAddLink,
                            ),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            PrimaryButton(
                              buttonText: "Clear all",
                              onPressed: _handleClearAll,
                              isSecondary: true,
                            ),
                            const SizedBox(width: 18),
                            PrimaryButton(
                              buttonText: widget.buttonContent ?? "Add Link",
                              onPressed: _handleAddLink,
                            ),
                          ],
                        ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
