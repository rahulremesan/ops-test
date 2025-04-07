import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styria_flutter_web/design_system/atoms/buttons/primary_button.dart';
import 'package:styria_flutter_web/design_system/atoms/file_picker/file_picker.dart';
import 'package:styria_flutter_web/design_system/atoms/inputs/dropdown_input_field.dart';
import 'package:styria_flutter_web/design_system/atoms/inputs/secondary_input_field.dart';
import 'package:styria_flutter_web/design_system/atoms/inputs/title_description_mixed_field.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';
import 'package:styria_flutter_web/shared/providers/channels_provider.dart';
import 'package:styria_flutter_web/shared/providers/mobile_provider.dart';

class CreateFeed extends ConsumerWidget {
  final String title;
  final TextEditingController? titleController;
  final TextEditingController? descriptionController;
  final TextEditingController? referenceNameController;
  final TextEditingController? referenceUrlController;
  final ValueNotifier<String> selectedChannelIdNotifier;
  final List<Channel> channels;
  final VoidCallback onPublish;
  final FocusNode? titleFocusNode;
  final bool isSelectChannel;

  const CreateFeed({
    super.key,
    required this.title,
    this.titleController,
    this.descriptionController,
    this.referenceNameController,
    this.referenceUrlController,
    required this.selectedChannelIdNotifier,
    required this.channels,
    required this.onPublish,
    this.titleFocusNode,
    this.isSelectChannel = true,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;
    final isMobile = ref.watch(isMobileProvider);

    return KeyboardListener(
      focusNode: FocusNode(),
      onKeyEvent: (event) {
        if (event is KeyDownEvent &&
            event.logicalKey == LogicalKeyboardKey.enter) {
          onPublish();
        }
      },
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(isMobile ? 0 : 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ...isMobile
                      ? [
                          IconButton(
                            icon: const Icon(Icons.close, size: 18),
                            onPressed: () => Navigator.of(context).pop(),
                            hoverColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                          ),
                          // const SizedBox(width: 8),
                        ]
                      : [], // Space between close and title
                  Text(
                    // Title in the middle
                    'Create Feed',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const Spacer(), // This pushes the clear all to the end
                  TextButton(
                    onPressed: () {},
                    style: const ButtonStyle(
                      overlayColor: WidgetStatePropertyAll(Colors.transparent),
                    ),
                    child: const Text(
                      'Clear All',
                      style: TextStyle(color: AppColors.brandBlue),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 33,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...!isMobile
                      ? [
                          const Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 16,
                                ),
                                child: Icon(
                                  Icons.title,
                                  size: 20,
                                  color: AppColors.wolFrame,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 18,
                                ),
                                child: Icon(
                                  Icons.notes,
                                  size: 20,
                                  color: AppColors.wolFrame,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                        ]
                      : [],
                  Expanded(
                    child: SizedBox(
                      height:
                          isMobile ? 200 : 137, // Increased height for mobile
                      child: TitleDescriptionMixedField(
                        titleController: titleController,
                        descriptionController: descriptionController,
                        titleFocusNode: titleFocusNode,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const FilePickerWidget(
                allowedExtensions: ['png', 'svg', 'jpeg', 'jpg'],
                dialogTitle: "Upload a file",
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.link_outlined,
                    size: 20,
                    color: AppColors.wolFrame,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: SecondaryInputField(
                      placeholder: 'Enter reference name',
                      controller: referenceNameController,
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: SecondaryInputField(
                      placeholder: 'Enter reference url',
                      controller: referenceUrlController,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              if (isSelectChannel)
                Padding(
                  padding: const EdgeInsets.only(left: 35),
                  child: DropdownInputField(
                    items: channels.map((channel) => channel.channel).toList(),
                    label: 'Select channel',
                    onChanged: (value) {
                      final selectedChannel = channels.firstWhere(
                        (channel) => channel.channel == value,
                        orElse: () => channels.first,
                      );
                      selectedChannelIdNotifier.value =
                          selectedChannel.id.toString();
                    },
                  ),
                ),
              const SizedBox(
                height: 60,
              ),
              PrimaryButton(
                buttonText: 'Publish',
                onPressed: onPublish,
              )
            ],
          ),
        ),
      ),
    );
  }
}
