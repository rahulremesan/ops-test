import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styria_flutter_web/design_system/atoms/buttons/primary_button.dart';
import 'package:styria_flutter_web/design_system/atoms/buttons/tertiary_button.dart';
import 'package:styria_flutter_web/design_system/atoms/inputs/primary_search_field.dart';
import 'package:styria_flutter_web/design_system/organisms/cards/explore_channel_card.dart';
import 'package:styria_flutter_web/layouts/feeds/create_channel.dart';
import 'package:styria_flutter_web/shared/providers/channels_provider.dart';

class MyChannelsLayout extends ConsumerStatefulWidget {
  const MyChannelsLayout({super.key});

  @override
  _MyChannelsLayoutState createState() => _MyChannelsLayoutState();
}

class _MyChannelsLayoutState extends ConsumerState<MyChannelsLayout> {
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

  void showCreateChannelModal(BuildContext context, WidgetRef ref,
      [Channel? channel]) {
    final titleController = TextEditingController(
      text: channel?.channel ?? '',
    );
    final descriptionController = TextEditingController(
      text: channel?.description ?? '',
    );
    final typeController = TextEditingController(
      text: channel?.type ?? '',
    );
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

      final updatedChannel = Channel(
        id: channel?.id, // Retain ID if editing
        icon: const Icon(Icons.group),
        channel: title,
        isFollowing: channel?.isFollowing ?? false,
        membersCount: channel?.membersCount ?? 0,
        description: description,
        type: tags,
      );

      if (channel == null) {
        // Create new channel
        await channelNotifier.createChannel(updatedChannel);
      } else {
        // Update existing channel
        await channelNotifier.updateChannel(updatedChannel);
      }

      if (channelNotifier.errorMessage != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(channelNotifier.errorMessage!)),
        );
      } else {
        titleController.clear();
        descriptionController.clear();
        typeController.clear();
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
                      heading: 'Edit Channel',
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

  void showDeleteDialog(BuildContext context, VoidCallback onConfirmDelete) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Delete',
            style: TextStyle(color: Colors.red[800]),
          ),
          content: const Text('Are you sure you want to delete this channel?'),
          actions: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  PrimaryButton(
                    buttonText: 'Cancel',
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  PrimaryButton(
                    isSecondary: true,
                    buttonText: 'Delete',
                    onPressed: () {
                      Navigator.of(context).pop();
                      onConfirmDelete();
                    },
                  ),
                ],
              ),
            ),
          ],
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

    final filteredChannels = channelProvider.myChannels.where((channel) {
      return channel.channel.toLowerCase().contains(searchQuery);
    }).toList();

    return Column(
      children: [
        Row(
          children: [
            Expanded(
                child: PrimarySearchField(
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
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: TertiaryButton(
                onPressed: () {
                  showCreateChannelModal(context, ref);
                },
                buttonText: 'Create Channels',
                icon: Icons.add,
              ),
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
                              onEdit: () {
                                showCreateChannelModal(context, ref, channel);
                              },
                              onDelete: () {
                                showDeleteDialog(context, () async {
                                  await channelNotifier
                                      .deleteChannel(channel.id!);
                                  if (channelNotifier.errorMessage != null) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              channelNotifier.errorMessage!)),
                                    );
                                  }
                                });
                              },
                              isEdit: true,
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
