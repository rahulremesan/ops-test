import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styria_flutter_web/design_system/atoms/cards/icon_card.dart';
import 'package:styria_flutter_web/design_system/atoms/tags/channels.dart';
import 'package:styria_flutter_web/design_system/organisms/cards/expandable_channel_card.dart';
import 'package:styria_flutter_web/design_system/organisms/cards/feeds_hashtag_card.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';
import 'package:styria_flutter_web/layouts/feeds/create_feed.dart';
import 'package:styria_flutter_web/layouts/feeds/explore_layout.dart';
import 'package:styria_flutter_web/layouts/feeds/my_channels_layout.dart';
import 'package:styria_flutter_web/layouts/feeds/post_section.dart';
import 'package:styria_flutter_web/layouts/feeds/recent_activities.dart';
import 'package:styria_flutter_web/shared/providers/appbarvisible_provider.dart';
import 'package:styria_flutter_web/shared/providers/channels_provider.dart';
import 'package:styria_flutter_web/shared/providers/mobile_provider.dart';
import '../../shared/providers/feed_provider.dart';

class FeedsV2Layout extends ConsumerWidget {
  FeedsV2Layout({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedChannel = ref.watch(selectedChannelProvider);

    final screenWidth = MediaQuery.of(context).size.width;

    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    return Padding(
      padding: screenWidth < 600
          ? const EdgeInsets.fromLTRB(0, 0, 0, 20)
          : const EdgeInsets.fromLTRB(40, 20, 40, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (screenWidth > 1200) ...[
            Text(
              'Feeds',
              style: TextStyle(
                fontFamily: customTypography.h5Bold.fontFamily,
                fontSize: customTypography.h5Bold.fontSize,
                fontWeight: customTypography.h5Bold.fontWeight,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
          ],
          Expanded(
            child: screenWidth > 1200
                ? buildLargeScreenLayout(context, ref, selectedChannel)
                : buildSmallScreenLayout(context, ref, selectedChannel),
          )
        ],
      ),
    );
  }

  Widget buildLargeScreenLayout(
      BuildContext context, WidgetRef ref, String selectedChannel) {
    final postProvider = ref.watch(feedsProvider);
    final trendingTags = postProvider.trendingTags;
    final hashtagNames = trendingTags.map((tag) => tag.name).toList();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: buildChannelSection(
            context,
            ref,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          flex: 2,
          child: buildMainContent(context, ref, selectedChannel),
        ),
        const SizedBox(width: 16),
        Expanded(
          flex: 1,
          child: buildSidebar(hashtagNames),
        ),
      ],
    );
  }

  // Widget buildSmallScreenLayout(
  //     BuildContext context, WidgetRef ref, String selectedChannel) {
  //   return Stack(
  //     children: [
  //       buildMainContent(context, ref, selectedChannel),
  //       Positioned(
  //         bottom: 16,
  //         right: 16,
  //         child: FloatingActionButton(
  //           onPressed: () {
  //             _showChannelModal(context, ref);
  //           },
  //           child: const Icon(Icons.add),
  //         ),
  //       ),
  //     ],
  //   );
  // }
  Widget buildSmallScreenLayout(
      BuildContext context, WidgetRef ref, String selectedChannel) {
    final channelProvider = ref.watch(channelsProvider);

    return Scaffold(
      body: Column(
        children: [
          // Static Channel Row
          Container(
            color: Colors.white,
            child: ChannelCardRow(
              selectedChannel: selectedChannel,
              onChannelSelect: (channel) {
                ref.read(selectedChannelProvider.notifier).state = channel;
              },
            ),
          ),
          // Scrollable Content
          Expanded(
            child: buildMainContent(context, ref, selectedChannel),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showCreateFeedModal(context, ref, channelProvider.followingChannels);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget buildChannelSection(
    BuildContext context,
    WidgetRef ref,
  ) {
    final channelProvider = ref.watch(channelsProvider);
    final selectedChannel = ref.watch(selectedChannelProvider);

    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Channels(
              isPrimary: true,
              icon: const Icon(Icons.home_outlined),
              channel: 'Home',
              isSelected: selectedChannel == 'Home',
              onClick: () {
                ref.read(selectedChannelProvider.notifier).state = 'Home';
                if (screenWidth < 1201) Navigator.pop(context);
              },
            ),
            Channels(
              isPrimary: true,
              icon: const Icon(Icons.explore_outlined),
              channel: 'Explore',
              isSelected: selectedChannel == 'Explore',
              onClick: () {
                ref.read(selectedChannelProvider.notifier).state = 'Explore';
                if (screenWidth < 1201) Navigator.pop(context);
              },
            ),
            // Channels(
            //   isPrimary: true,
            //   icon: const Icon(Icons.forum_outlined),
            //   channel: 'My Channels',
            //   isSelected: selectedChannel == 'My Channels',
            //   onClick: () {
            //     ref.read(selectedChannelProvider.notifier).state =
            //         'My Channels';
            //     if (screenWidth < 1201) Navigator.pop(context);
            //   },
            // ),
            const Divider(
              thickness: 1,
              color: AppColors.dreamyCloud,
            ),
            Flexible(
              fit: FlexFit.loose,
              child: ExpandableChannelCard(
                title: "Organisation Channels",
                channels: channelProvider.organisationChannels,
              ),
            ),
            const Divider(
              thickness: 1,
              color: AppColors.dreamyCloud,
            ),
            Flexible(
              fit: FlexFit.loose,
              child: ExpandableChannelCard(
                title: "Following",
                channels: channelProvider.followingChannels,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMainContent(
      BuildContext context, WidgetRef ref, String selectedChannel) {
    ScrollController topArrowScroll = ScrollController();
    ValueNotifier<bool> showTopArrowButton = ValueNotifier(false);

    topArrowScroll.addListener(() {
      // Hide on downward scroll
      if (topArrowScroll.position.userScrollDirection ==
          ScrollDirection.reverse) {
        ref.read(appBarVisibleProvider.notifier).state = false;
      }
      // Show on upward scroll
      else if (topArrowScroll.position.userScrollDirection ==
          ScrollDirection.forward) {
        ref.read(appBarVisibleProvider.notifier).state = true;
      }
      // Show when near top
      else if (topArrowScroll.position.pixels <= 100) {
        ref.read(appBarVisibleProvider.notifier).state = true;
      }
    });

    void scrollListener() {
      if (topArrowScroll.offset > 100) {
        if (!showTopArrowButton.value) {
          showTopArrowButton.value = true;
        }
      } else {
        if (showTopArrowButton.value) {
          showTopArrowButton.value = false;
        }
      }
    }

    void scrollToTop() {
      if (topArrowScroll.hasClients) {
        topArrowScroll.animateTo(
          0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
        ref.read(appBarVisibleProvider.notifier).state = true;
      }
    }

    topArrowScroll.addListener(scrollListener);

    if (selectedChannel == 'Home') {
      bool notMobile = MediaQuery.of(context).size.width > 1200;
      double screenMiddleX = MediaQuery.of(context).size.width / 2;

      return Stack(
        children: [
          SingleChildScrollView(
            controller: topArrowScroll,
            child: Column(
              children: [
                if ((notMobile)) ...[
                  buildOnYourMind(context, ref),
                  const SizedBox(height: 16),
                ],
                const PostSection(),
              ],
            ),
          ),
          ValueListenableBuilder<bool>(
            valueListenable: showTopArrowButton,
            builder: (context, showButton, child) {
              return Positioned(
                left: 0,
                right: 0,
                top: 16, // Keep the top position
                child: Center(
                  // Center horizontally
                  child: AnimatedOpacity(
                    opacity: showButton ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 300),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: IconButton(
                        onPressed: scrollToTop,
                        icon: const Icon(
                          Icons.arrow_upward,
                          size: 24,
                          color: Colors.black,
                        ),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(
                          minWidth: 40,
                          minHeight: 40,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      );
    } else if (selectedChannel == 'Explore') {
      return const Center(child: ExploreLayout());
    } else if (selectedChannel == 'My Channels') {
      return const Center(child: MyChannelsLayout());
    }
    return const Center(child: Text('Error'));
  }

  Widget buildSidebar(List<String> hashtags) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Flexible(
          fit: FlexFit.loose,
          child: RecentActivities(),
        ),
        const SizedBox(
          height: 16,
        ),
        Flexible(
          fit: FlexFit.loose,
          child: FeedsHashtagCard(hashtags: hashtags),
        )
      ],
    );
  }

  void _showChannelModal(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Container(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: buildChannelSection(
                context,
                ref,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildOnYourMind(BuildContext context, WidgetRef ref) {
    final channelProvider = ref.watch(channelsProvider);
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;
    final screenWidth = MediaQuery.of(context).size.width;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          _showCreateFeedModal(
              ref.context, ref, channelProvider.followingChannels);
        },
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
            boxShadow: [
              BoxShadow(
                color: Color(0x24000000),
                offset: Offset(0, 4),
                blurRadius: 6,
                spreadRadius: 0,
              ),
            ],
            color: Colors.white,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 24,
                          backgroundImage:
                              AssetImage('assets/images/profileImage.jpeg'),
                        ),
                        const SizedBox(width: 16),
                        Text(
                          overflow: TextOverflow.ellipsis,
                          "What's on your mind?",
                          style: screenWidth < 350
                              ? TextStyle(
                                  fontFamily:
                                      customTypography.body2Medium.fontFamily,
                                  fontSize:
                                      customTypography.body2Medium.fontSize,
                                  fontWeight:
                                      customTypography.body2Medium.fontWeight,
                                  color: AppColors.neutral_300)
                              : TextStyle(
                                  fontFamily:
                                      customTypography.body1Medium.fontFamily,
                                  fontSize:
                                      customTypography.body1Medium.fontSize,
                                  fontWeight:
                                      customTypography.body1Medium.fontWeight,
                                  color: AppColors.neutral_300),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: AppColors.snowFlake,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconCard(
                          icon: Icons.image_outlined,
                          text: 'Image',
                          iconSize: 20,
                          space: 8,
                          textStyle: TextStyle(
                            fontFamily: customTypography.body2Medium.fontFamily,
                            fontSize: customTypography.body2Medium.fontSize,
                            fontWeight: customTypography.body2Medium.fontWeight,
                          ),
                        ),
                        IconCard(
                          icon: Icons.videocam_outlined,
                          text: 'Video',
                          iconSize: 20,
                          space: 8,
                          textStyle: TextStyle(
                            fontFamily: customTypography.body2Medium.fontFamily,
                            fontSize: customTypography.body2Medium.fontSize,
                            fontWeight: customTypography.body2Medium.fontWeight,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showCreateFeedModal(
      BuildContext context, WidgetRef ref, List<Channel> channels) {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();
    final referenceNameController = TextEditingController();
    final referenceUrlController = TextEditingController();
    final selectedChannelIdNotifier = ValueNotifier<String>('');
    final titleFocusNode = FocusNode();

    final postProvider = ref.watch(feedsProvider);
    final isMobile = ref.watch(isMobileProvider);

    showDialog(
      context: context,
      builder: (_) => Dialog(
        insetPadding: isMobile
            ? EdgeInsets.zero
            : const EdgeInsets.symmetric(horizontal: 40, vertical: 24),
        shape: RoundedRectangleBorder(
            borderRadius:
                isMobile ? BorderRadius.zero : BorderRadius.circular(12)),
        child: Container(
          width: isMobile ? MediaQuery.of(context).size.width : 700,
          height: isMobile ? MediaQuery.of(context).size.height : 700,
          padding: const EdgeInsets.all(16),
          child: Stack(
            children: [
              isMobile
                  ? SingleChildScrollView(
                      child: CreateFeed(
                        title: 'Create Feed',
                        channels: channels,
                        selectedChannelIdNotifier: selectedChannelIdNotifier,
                        titleController: titleController,
                        descriptionController: descriptionController,
                        referenceNameController: referenceNameController,
                        referenceUrlController: referenceUrlController,
                        titleFocusNode: titleFocusNode,
                        onPublish: () async {
                          final title = titleController.text;
                          final content = descriptionController.text;
                          final selectedChannelId =
                              selectedChannelIdNotifier.value;
                          if (title.isEmpty || content.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      'Title and content cannot be empty.')),
                            );
                            return;
                          }

                          if (selectedChannelId.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Please select a channel.')),
                            );
                            return;
                          }

                          try {
                            final channelId = int.parse(selectedChannelId);
                            await postProvider.createPost(
                                title, content, channelId);
                            if (postProvider.errorMessage != null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text(postProvider.errorMessage!)),
                              );
                            } else {
                              Navigator.of(context).pop();
                            }
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Invalid channel ID.')),
                            );
                          }
                        },
                      ),
                    )
                  : CreateFeed(
                      title: 'Create Feed',
                      channels: channels,
                      selectedChannelIdNotifier: selectedChannelIdNotifier,
                      titleController: titleController,
                      descriptionController: descriptionController,
                      referenceNameController: referenceNameController,
                      referenceUrlController: referenceUrlController,
                      titleFocusNode: titleFocusNode,
                      onPublish: () async {
                        final title = titleController.text;
                        final content = descriptionController.text;
                        final selectedChannelId =
                            selectedChannelIdNotifier.value;
                        if (title.isEmpty || content.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text('Title and content cannot be empty.')),
                          );
                          return;
                        }

                        if (selectedChannelId.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Please select a channel.')),
                          );
                          return;
                        }

                        try {
                          final channelId = int.parse(selectedChannelId);
                          await postProvider.createPost(
                              title, content, channelId);
                          if (postProvider.errorMessage != null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text(postProvider.errorMessage!)),
                            );
                          } else {
                            Navigator.of(context).pop();
                          }
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Invalid channel ID.')),
                          );
                        }
                      },
                    ),
              if (!isMobile)
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
    ).then((_) {
      titleFocusNode.dispose();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      titleFocusNode.requestFocus();
    });
  }
}

class ChannelCardRow extends ConsumerWidget {
  final String selectedChannel;
  final Function(String) onChannelSelect;

  const ChannelCardRow(
      {required this.selectedChannel,
      required this.onChannelSelect,
      super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 68,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0.5,
            color: AppColors.wolFrame, // Or your desired color
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 4),
        children:
            ['Home', 'Explore', 'Organisation', 'Following'].map((channel) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: ChannelChip(
              title: channel,
              isSelected: channel == selectedChannel,
              onTap: () => onChannelSelect(channel),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class ChannelChip extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const ChannelChip({
    required this.title,
    required this.isSelected,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 36,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.brandBlue : AppColors.platinum,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : AppColors.neutral_400,
            fontFamily: isSelected
                ? customTypography.body3Medium.fontFamily
                : customTypography.body3Regular.fontFamily,
            fontSize: isSelected
                ? customTypography.body3Medium.fontSize
                : customTypography.body3Regular.fontSize,
            fontWeight: isSelected
                ? customTypography.body3Medium.fontWeight
                : customTypography.body3Regular.fontWeight,
          ),
        ),
      ),
    );
  }
}
