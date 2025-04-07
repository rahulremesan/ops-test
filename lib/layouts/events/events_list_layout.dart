import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styria_flutter_web/constants/route_constants.dart';
import 'package:styria_flutter_web/design_system/atoms/breadcrumbs/page_breadcrumbs.dart';
import 'package:styria_flutter_web/design_system/atoms/cards/event_card.dart';
import 'package:styria_flutter_web/design_system/atoms/tabs/tabs.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';
import 'package:styria_flutter_web/layouts/feeds/channel_list.dart';
import 'package:styria_flutter_web/shared/providers/channels_provider.dart';
import 'package:styria_flutter_web/shared/providers/mobile_provider.dart';
// import '../../shared/providers/feed_provider.dart';

class Event {
  final String imageUrl;
  final List<Map<String, dynamic>> iconData;
  final String cardTitle;
  final VoidCallback onPressOne;
  final VoidCallback onPressTwo;
  final String tagText;
  final Color tagColor;

  Event({
    required this.imageUrl,
    required this.iconData,
    required this.cardTitle,
    required this.onPressOne,
    required this.onPressTwo,
    required this.tagText,
    required this.tagColor,
  });
}

final List<Event> events = [
  Event(
    imageUrl:
        'https://s3-alpha-sig.figma.com/img/93b0/5405/920b916e2982f39de128a5d0829de284?Expires=1731888000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=CQh7PhKuMCzQ-5v63T2MsM4WsqMj~zwiQx8VryjPwIwSwK1AHayaAWjsGiHQS7LbbeIvGH8t-V-~Kyky1sSrLzNEdEMuw3UFbuJ429EF89ec7at8OhzreJ63q~EfbMY5DJ2naoT4oRG5DfYedoYFKrEJnAYGajsp5nMY7LekSdspxDwKwNBilp40Y8ravScdqxodqwSFHbS-CsZheW2FctmMp8yqmjUMk2-TKmt5YHTrb5j~GNbffNPP1nzc3ELk18ETjUfS7CAsNtumpJ-WOR4fEXJVUwjuWq1wrgQXKHvYj9a0kQXUalQ0pVQKEdREjXz-Gnc~ustgE1ToWAumQg__',
    iconData: [
      {
        'icon': Icons.calendar_month,
        'text': '10 May 2024',
      },
      {
        'icon': Icons.access_time,
        'text': '10 AM - 12 PM',
      },
      {
        'icon': Icons.person_outline,
        'text': 'Vijay Sunkeswari',
      },
      {
        'icon': Icons.school_outlined,
        'text': 'Internal - online',
      },
      {
        'icon': Icons.location_on_outlined,
        'text': 'Office',
      },
    ],
    cardTitle: 'All Hands',
    onPressOne: () {
      // Handle the first button press
    },
    onPressTwo: () {
      // Handle the second button press
    },
    tagText: 'HR',
    tagColor: Colors.white,
  ),
  Event(
    imageUrl:
        'https://s3-alpha-sig.figma.com/img/9083/3172/a3082364e605dc7ef0d5d282cbd1bda8?Expires=1731888000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=b1b~CJhqSC2fOdygZlan6A3qLLFwdqfgMGfcyBglv-oWz2Xt9D9WigKWqYdt~alQHouQe6e1OWdBmktRbD5Uxlo8tKQURELdSxINw5zEZGxThOQipLISiEuqP6A52U~lDKOexuBPusSAWKASqgwWs1Yov3QNSSmbxtQY~vgjJ3pFnr8ZuEYaVBBH3T8ZzuTH3wOEyvi-WPudL2D1YCQiyTJLs56ukkTfS9z5ho2DnChfF5F4DKi5TYH4wwugpKSn06irqqRgRt0TEjE8vHxkk7BOFXANT4W2ZQ58-whlXESi9kT-BobUK0A47ZwjJE-sU8Rk4PVemBOPBKxXBhawaw__',
    iconData: [
      {
        'icon': Icons.calendar_month,
        'text': '10 May 2024',
      },
      {
        'icon': Icons.access_time,
        'text': '1:30 PM - 2:30 PM',
      },
      {
        'icon': Icons.person_outline,
        'text': 'Vinod Kumar Singh',
      },
      {
        'icon': Icons.school_outlined,
        'text': 'Internal - classroom',
      },
      {
        'icon': Icons.location_on_outlined,
        'text': 'Office',
      },
    ],
    cardTitle: 'The emotions behind your money habits',
    onPressOne: () {
      // Handle the first button press
    },
    onPressTwo: () {
      // Handle the second button press
    },
    tagText: 'Leadership Talks',
    tagColor: Colors.white,
  ),
  Event(
    imageUrl:
        'https://s3-alpha-sig.figma.com/img/9dfa/c493/cf56c407ec624d492f153a2ee7790874?Expires=1731888000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=cqmDscSfMswYBhVDFbRJswUZ0XOq-twR89PGpb6N7MeJ30H4GOn4VecPFrlM~v4ONkzprBNjUG1P65Hc2uc2tZ-YV2yvk9cnM6chw1uRyzbn48W0JhZlMTNitHAwaOnB94XlJO~Bzh7qdCx3jbzzGrWeaKCSf8~vC0y0xYnqBbcoI3HOlkAFtfMW5tY3YVNF3sjFnL4tn19iIwcDGLbVSuoSIpHI68RUbI5cpNng5gtZYNAkj-gW5OkvItVUCK4sr8Sy970ZgQBa~1JXBfIofDliVC~TlMkq1mnNbKRoXs5Dq274mNjE8YODRx4PYEqp8tlMT3GKR8DZcQcQa86Zgw__',
    iconData: [
      {
        'icon': Icons.calendar_month,
        'text': '12 June 2024',
      },
      {
        'icon': Icons.access_time,
        'text': '1:30 PM - 2:30 PM',
      },
      {
        'icon': Icons.person_outline,
        'text': 'Vinod Kumar Singh',
      },
      {
        'icon': Icons.school_outlined,
        'text': 'Internal - classroom',
      },
      {
        'icon': Icons.location_on_outlined,
        'text': 'Office',
      },
    ],
    cardTitle: 'Give permission yourself to be creative',
    onPressOne: () {
      // Handle the first button press
    },
    onPressTwo: () {
      // Handle the second button press
    },
    tagText: 'Leadership Talks',
    tagColor: Colors.white,
  ),
  Event(
    imageUrl:
        'https://s3-alpha-sig.figma.com/img/9dfa/c493/cf56c407ec624d492f153a2ee7790874?Expires=1731888000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=cqmDscSfMswYBhVDFbRJswUZ0XOq-twR89PGpb6N7MeJ30H4GOn4VecPFrlM~v4ONkzprBNjUG1P65Hc2uc2tZ-YV2yvk9cnM6chw1uRyzbn48W0JhZlMTNitHAwaOnB94XlJO~Bzh7qdCx3jbzzGrWeaKCSf8~vC0y0xYnqBbcoI3HOlkAFtfMW5tY3YVNF3sjFnL4tn19iIwcDGLbVSuoSIpHI68RUbI5cpNng5gtZYNAkj-gW5OkvItVUCK4sr8Sy970ZgQBa~1JXBfIofDliVC~TlMkq1mnNbKRoXs5Dq274mNjE8YODRx4PYEqp8tlMT3GKR8DZcQcQa86Zgw__',
    iconData: [
      {
        'icon': Icons.calendar_month,
        'text': '10 May 2024',
      },
      {
        'icon': Icons.access_time,
        'text': '10 AM - 12 PM',
      },
      {
        'icon': Icons.person_outline,
        'text': 'Vijay Sunkeswari',
      },
      {
        'icon': Icons.school_outlined,
        'text': 'Internal - online',
      },
      {
        'icon': Icons.location_on_outlined,
        'text': 'Office',
      },
    ],
    cardTitle: 'All Hands',
    onPressOne: () {
      // Handle the first button press
    },
    onPressTwo: () {
      // Handle the second button press
    },
    tagText: 'HR',
    tagColor: Colors.white,
  ),
];

class EventsListLayout extends ConsumerWidget {
  final bool showBreadcrumbs;
  const EventsListLayout({super.key, this.showBreadcrumbs = true});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;
    final isMobile = ref.watch(isMobileProvider);
    return Padding(
      padding: isMobile
          ? const EdgeInsets.fromLTRB(0, 0, 0, 0)
          : const EdgeInsets.fromLTRB(40, 20, 40, 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showBreadcrumbs && !isMobile) ...[
            PageBreadcrumbs(items: [
              BreadcrumbData(
                label: 'Apps',
                link: AppRoute.apps,
                isActive: true,
              ),
              BreadcrumbData(
                label: 'Events',
                link: AppRoute.events,
                isActive: false,
              )
            ]),
            const SizedBox(
              height: 24,
            ),
          ],
          Text(
            'Events',
            style: TextStyle(
              fontFamily: customTypography.h3Bold.fontFamily,
              fontSize: customTypography.h3Bold.fontSize,
              fontWeight: customTypography.h3Bold.fontWeight,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Expanded(
            child: Tabs(
              tabTitles: const [
                'Upcoming Events',
                'Past Events',
                'Events I\'ve joined',
                'Events I\'ve conducted'
              ],
              tabViews: [
                _buildUpcomingEventsTab(context, ref),
                _buildPastEventsTab(context, ref),
                _buildJoinedEventsTab(context, ref),
                _buildConductedEventsTab(context, ref),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildUpcomingEventsTab(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    // final provider = ref.watch(feedsProvider);
    final channelProvider = ref.watch(channelsProvider);

    int crossAxisCount = 1;
    if (screenWidth > 2000) {
      crossAxisCount = 5;
    } else if (screenWidth > 1240) {
      crossAxisCount = 4;
    } else if (screenWidth > 1050) {
      crossAxisCount = 3;
    } else if (screenWidth > 620) {
      crossAxisCount = 2;
    }

    void showChannelListDialog() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Container(
              width: 400,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ChannelList(
                    title: 'Following',
                    channelList: channelProvider.channels,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Close"),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    return Padding(
      padding: const EdgeInsets.only(top: 32),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: screenWidth > 853 ? 3 : 1,
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(
                scrollbars: false,
              ),
              child: SingleChildScrollView(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                    mainAxisExtent: 464,
                  ),
                  itemCount: events.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final event = events[index];
                    return EventCard(
                      imageUrl: event.imageUrl,
                      iconData: event.iconData,
                      cardTitle: event.cardTitle,
                      onPressOne: event.onPressOne,
                      onPressTwo: event.onPressTwo,
                      tagText: event.tagText,
                      tagColor: event.tagColor,
                    );
                  },
                ),
              ),
            ),
          ),
          // const SizedBox(
          //   width: 20,
          // ),
          // screenWidth > 570
          //     ? Expanded(
          //         // width: 405,
          //         flex: 1,
          //         child: ChannelList(
          //             title: 'Following',
          //             channelList: channelProvider.channels),
          //       )
          //     : IconButton(
          //         icon: const Icon(Icons.menu),
          //         onPressed: () {
          //           showChannelListDialog();
          //         },
          //       ),
        ],
      ),
    );
  }

  Widget _buildPastEventsTab(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    // final provider = ref.watch(feedsProvider);
    final channelProvider = ref.watch(channelsProvider);

    int crossAxisCount = 1;
    if (screenWidth > 2000) {
      crossAxisCount = 5;
    } else if (screenWidth > 1240) {
      crossAxisCount = 4;
    } else if (screenWidth > 1050) {
      crossAxisCount = 3;
    } else if (screenWidth > 620) {
      crossAxisCount = 2;
    }

    void showChannelListDialog() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Container(
              width: 400,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ChannelList(
                    title: 'Following',
                    channelList: channelProvider.channels,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Close"),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    return Padding(
      padding: const EdgeInsets.only(top: 32),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: screenWidth > 853 ? 3 : 1,
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(
                scrollbars: false,
              ),
              child: SingleChildScrollView(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                    mainAxisExtent: 464,
                  ),
                  itemCount: events.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final event = events[index];
                    return EventCard(
                      imageUrl: event.imageUrl,
                      iconData: event.iconData,
                      cardTitle: event.cardTitle,
                      onPressOne: event.onPressOne,
                      onPressTwo: event.onPressTwo,
                      tagText: event.tagText,
                      tagColor: event.tagColor,
                    );
                  },
                ),
              ),
            ),
          ),
          // const SizedBox(
          //   width: 20,
          // ),
          // screenWidth > 570
          //     ? Expanded(
          //         // width: 405,
          //         flex: 1,
          //         child: ChannelList(
          //             title: 'Following',
          //             channelList: channelProvider.channels),
          //       )
          //     : IconButton(
          //         icon: const Icon(Icons.menu),
          //         onPressed: () {
          //           showChannelListDialog();
          //         },
          //       ),
        ],
      ),
    );
  }

  Widget _buildJoinedEventsTab(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    // final provider = ref.watch(feedsProvider);
    final channelProvider = ref.watch(channelsProvider);

    int crossAxisCount = 1;
    if (screenWidth > 2000) {
      crossAxisCount = 5;
    } else if (screenWidth > 1240) {
      crossAxisCount = 4;
    } else if (screenWidth > 1050) {
      crossAxisCount = 3;
    } else if (screenWidth > 620) {
      crossAxisCount = 2;
    }

    void showChannelListDialog() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Container(
              width: 400,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ChannelList(
                    title: 'Following',
                    channelList: channelProvider.channels,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Close"),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    return Padding(
      padding: const EdgeInsets.only(top: 32),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: screenWidth > 853 ? 3 : 1,
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(
                scrollbars: false,
              ),
              child: SingleChildScrollView(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                    mainAxisExtent: 464,
                  ),
                  itemCount: events.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final event = events[index];
                    return EventCard(
                      imageUrl: event.imageUrl,
                      iconData: event.iconData,
                      cardTitle: event.cardTitle,
                      onPressOne: event.onPressOne,
                      onPressTwo: event.onPressTwo,
                      tagText: event.tagText,
                      tagColor: event.tagColor,
                    );
                  },
                ),
              ),
            ),
          ),
          // const SizedBox(
          //   width: 20,
          // ),
          // screenWidth > 570
          //     ? Expanded(
          //         // width: 405,
          //         flex: 1,
          //         child: ChannelList(
          //             title: 'Following',
          //             channelList: channelProvider.channels),
          //       )
          //     : IconButton(
          //         icon: const Icon(Icons.menu),
          //         onPressed: () {
          //           showChannelListDialog();
          //         },
          //       ),
        ],
      ),
    );
  }

  Widget _buildConductedEventsTab(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    // final provider = ref.watch(feedsProvider);
    final channelProvider = ref.watch(channelsProvider);

    int crossAxisCount = 1;
    if (screenWidth > 2000) {
      crossAxisCount = 5;
    } else if (screenWidth > 1240) {
      crossAxisCount = 4;
    } else if (screenWidth > 1050) {
      crossAxisCount = 3;
    } else if (screenWidth > 620) {
      crossAxisCount = 2;
    }

    void showChannelListDialog() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Container(
              width: 400,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ChannelList(
                    title: 'Following',
                    channelList: channelProvider.channels,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Close"),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    return Padding(
      padding: const EdgeInsets.only(top: 32),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: screenWidth > 853 ? 3 : 1,
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(
                scrollbars: false,
              ),
              child: SingleChildScrollView(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                    mainAxisExtent: 464,
                  ),
                  itemCount: events.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final event = events[index];
                    return EventCard(
                      imageUrl: event.imageUrl,
                      iconData: event.iconData,
                      cardTitle: event.cardTitle,
                      onPressOne: event.onPressOne,
                      onPressTwo: event.onPressTwo,
                      tagText: event.tagText,
                      tagColor: event.tagColor,
                    );
                  },
                ),
              ),
            ),
          ),
          // const SizedBox(
          //   width: 20,
          // ),
          // screenWidth > 570
          //     ? Expanded(
          //         // width: 405,
          //         flex: 1,
          //         child: ChannelList(
          //             title: 'Following',
          //             channelList: channelProvider.channels),
          //       )
          //     : IconButton(
          //         icon: const Icon(Icons.menu),
          //         onPressed: () {
          //           showChannelListDialog();
          //         },
          //       ),
        ],
      ),
    );
  }
}
