import 'package:flutter/material.dart';
import 'package:styria_flutter_web/constants/route_constants.dart';
import 'package:styria_flutter_web/design_system/atoms/breadcrumbs/page_breadcrumbs.dart';
import 'package:styria_flutter_web/design_system/atoms/cards/event_card_two.dart';

class EventsDetailsLayout extends StatelessWidget {
  const EventsDetailsLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: PageBreadcrumbs(items: [
              BreadcrumbData(
                label: 'Apps',
                link: AppRoute.apps,
                isActive: true,
              ),
              BreadcrumbData(
                label: 'Events',
                link: AppRoute.events,
                isActive: true,
              ),
              BreadcrumbData(
                label: 'UI/UX Design Workshop',
                link: AppRoute.eventDetails,
                isActive: false,
              )
            ]),
          ),
          const SizedBox(
            height: 32,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Center(
                child: SizedBox(
                  width: 830,
                  child: EventCardTwo(
                    title: 'UI/UX Design Workshop',
                    imageUrl: 'https://picsum.photos/400/257',
                    description:
                        'Join us for an exciting workshop where we explore the fundamentals of UI/UX design. Learn about user research, wireframing, prototyping, and more.',
                    iconCards: [
                      IconCardData(
                        icon: Icons.calendar_today,
                        text: 'June 15, 2024',
                      ),
                      IconCardData(
                        icon: Icons.access_time,
                        text: '2:00 PM - 4:00 PM',
                      ),
                      IconCardData(
                          icon: Icons.location_on, text: 'Virtual Meeting'),
                    ],
                    linkCards: [
                      LinkCardData(
                        text: 'Workshop Materials',
                        url: 'https://example.com/materials',
                      ),
                      LinkCardData(
                        text: 'Pre-requisites',
                        url: 'https://example.com/prerequisites',
                      ),
                    ],
                    onEnrollPressed: () {},
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
