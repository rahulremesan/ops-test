import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styria_flutter_web/design_system/atoms/buttons/secondary_button.dart';
import 'package:styria_flutter_web/design_system/atoms/buttons/tertiary_button.dart';
import 'package:styria_flutter_web/design_system/atoms/inputs/primary_search_field.dart';
import 'package:styria_flutter_web/design_system/organisms/cards/explore_channel_card.dart';
import 'package:styria_flutter_web/layouts/feeds/create_channel.dart';
import 'package:styria_flutter_web/shared/providers/channels_provider.dart';

class ExploreLayout extends ConsumerStatefulWidget {
  const ExploreLayout({super.key});

  @override
  _ExploreLayoutState createState() => _ExploreLayoutState();
}

class _ExploreLayoutState extends ConsumerState<ExploreLayout> {
  TextEditingController searchController = TextEditingController();
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    searchController.addListener(() {
      setState(() {
        searchQuery = searchController.text.trim().toLowerCase();
      });
    });
  }

  void showCreateChannelModal(BuildContext context, WidgetRef ref) {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();
    final typeController = TextEditingController();
    // String? visibility;

    // void handleVisibilityChanged(String? value) {
    //   visibility = value;
    // }

    void handleSubmit() async {
      final channelNotifier = ref.read(channelsProvider.notifier);

      final title = titleController.text.trim();
      final description = descriptionController.text.trim();
      final tags = typeController.text.trim();

      if (title.isEmpty || description.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please fill all the fields'),
          ),
        );
        return;
      }

      final newChannel = Channel(
        icon: const Icon(Icons.group),
        channel: title,
        isFollowing: false,
        membersCount: 0,
        description: description,
        type: tags,
      );

      await channelNotifier.createChannel(newChannel);
      if (channelNotifier.errorMessage != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(channelNotifier.errorMessage!)),
        );
      } else {
        titleController.clear();
        descriptionController.clear();
        typeController.clear();
        // visibility = null;
        Navigator.of(context).pop();
      }
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: SizedBox(
            width: 710, // Set the width to 250
            child: Padding(
              padding: EdgeInsets.only(
                top: 16,
                left: 16,
                right: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: CreateChannel(
                      heading: 'Create Channel',
                      titleController: titleController,
                      descriptionController: descriptionController,
                      typeController: typeController,
                      // onVisibilityChanged: handleVisibilityChanged,
                      onClear: () {
                        titleController.clear();
                        descriptionController.clear();
                        typeController.clear();
                        // visibility == null;
                      },
                      onSubmit: handleSubmit,
                    ),
                  ),
                  Positioned(
                    top: 15,
                    right: 0,
                    child: IconButton(
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      icon: const Icon(
                        Icons.close,
                        size: 18,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final channelProvider = ref.watch(channelsProvider);
    final channelNotifier = ref.read(channelsProvider);

    if (channelProvider.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (channelProvider.errorMessage != null) {
      return Center(
        child: Text(channelProvider.errorMessage!),
      );
    }

    final filteredChannels = channelProvider.channels.where((channel) {
      return channel.channel.toLowerCase().contains(searchQuery);
    }).toList();

    return Column(
      children: [
        Row(
          children: [
            Expanded(
                child: PrimarySearchField(
              filtering: false,
              placeholder: 'Find Channels...',
              obscureText: false,
              onChanged: (value) {
                setState(() {
                  searchQuery = value.trim().toLowerCase();
                });
              },
            )),
            const SizedBox(
              width: 24,
            ),
            SecondaryButton(
              onPressed: () {
                showCreateChannelModal(context, ref);
              },
              buttonText: 'Create Channels',
              icon: Icons.add,
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        filteredChannels.isNotEmpty
            ? Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: filteredChannels.map((channel) {
                        final isLastChannel =
                            filteredChannels.indexOf(channel) ==
                                filteredChannels.length - 1;

                        return Column(
                          children: [
                            ExploreChannelCard(
                              icon: channel.icon,
                              channelName: channel.channel,
                              membersCount: channel.membersCount,
                              description: channel.description,
                              isFollowing: channel.isFollowing,
                              onFollowToggle: () {
                                channelNotifier.toggleFollow(channel);
                              },
                            ),
                            if (!isLastChannel)
                              const SizedBox(
                                height: 8,
                              )
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ),
              )
            : const Text(
                'No Channels to display',
              ),
      ],
    );
  }
}
