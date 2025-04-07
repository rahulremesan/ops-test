// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styria_flutter_web/constants/route_constants.dart';
import 'package:styria_flutter_web/design_system/atoms/breadcrumbs/page_breadcrumbs.dart';
import 'package:styria_flutter_web/design_system/atoms/buttons/custom_icon_button.dart';
import 'package:styria_flutter_web/design_system/atoms/buttons/primary_button.dart';
import 'package:styria_flutter_web/design_system/atoms/buttons/secondary_button.dart';
import 'package:styria_flutter_web/design_system/atoms/cards/channel_card.dart';
import 'package:styria_flutter_web/design_system/atoms/cards/conference_card.dart';
import 'package:styria_flutter_web/design_system/atoms/cards/event_card.dart';
import 'package:styria_flutter_web/design_system/atoms/cards/event_card_two.dart';
import 'package:styria_flutter_web/design_system/atoms/cards/icon_card.dart';
import 'package:styria_flutter_web/design_system/atoms/cards/project_deadline_card.dart';
import 'package:styria_flutter_web/design_system/atoms/cards/skill_card.dart';
import 'package:styria_flutter_web/design_system/atoms/cards/titledesc_card.dart';
import 'package:styria_flutter_web/design_system/atoms/cards/user_card2.dart';
import 'package:styria_flutter_web/design_system/atoms/cards/view_comment_card.dart';
import 'package:styria_flutter_web/design_system/atoms/cards/week_day_card.dart';
import 'package:styria_flutter_web/design_system/atoms/carousel/login_carousel.dart';
import 'package:styria_flutter_web/design_system/atoms/cards/time_report_details_card.dart';
import 'package:styria_flutter_web/design_system/atoms/buttons/status_button.dart';
import 'package:styria_flutter_web/design_system/atoms/buttons/tertiary_button.dart';
import 'package:styria_flutter_web/design_system/atoms/charts/barchart.dart';
import 'package:styria_flutter_web/design_system/atoms/cards/user_card1.dart';
import 'package:styria_flutter_web/design_system/atoms/calendar/planner_calendar/calendar_event.dart';
import 'package:styria_flutter_web/design_system/atoms/calendar/planner_calendar/calendar_widget.dart';
import 'package:styria_flutter_web/design_system/atoms/cards/planner_cards.dart';
import 'package:styria_flutter_web/design_system/atoms/cards/add_time_card.dart';
import 'package:styria_flutter_web/design_system/atoms/cards/duration_card.dart';
import 'package:styria_flutter_web/design_system/atoms/cards/open_position_card.dart';
import 'package:styria_flutter_web/design_system/atoms/cards/news_secondary_card.dart';
import 'package:styria_flutter_web/design_system/atoms/inputs/add_comment_field.dart';
import 'package:styria_flutter_web/design_system/atoms/inputs/project_update_text_field.dart';
import 'package:styria_flutter_web/design_system/atoms/inputs/secondary_text_area_field_fixed.dart';
import 'package:styria_flutter_web/design_system/atoms/inputs/single_date_picker.dart';
import 'package:styria_flutter_web/design_system/atoms/inputs/title_description_mixed_field.dart';
import 'package:styria_flutter_web/design_system/atoms/rating_card.dart/rating_card.dart';
import 'package:styria_flutter_web/design_system/atoms/start_rating/start_rating.dart';
import 'package:styria_flutter_web/design_system/atoms/tabs/tabs.dart';
import 'package:styria_flutter_web/design_system/atoms/tags/channels.dart';
import 'package:styria_flutter_web/design_system/atoms/tags/conference_tag.dart';
import 'package:styria_flutter_web/design_system/molecules/cards/all_skills_card.dart';
import 'package:styria_flutter_web/design_system/molecules/cards/expense_card.dart';
import 'package:styria_flutter_web/design_system/molecules/cards/news_details_card.dart';
import 'package:styria_flutter_web/design_system/molecules/cards/seller_details_card.dart';
import 'package:styria_flutter_web/design_system/molecules/feeds/feed_activity_card.dart';
import 'package:styria_flutter_web/design_system/molecules/feeds/feeds_card_footer.dart';
import 'package:styria_flutter_web/design_system/molecules/feeds/feeds_card_header.dart';
import 'package:styria_flutter_web/design_system/molecules/feeds/feed_card.dart';
import 'package:styria_flutter_web/design_system/molecules/feeds/feeds_post_card.dart';
import 'package:styria_flutter_web/design_system/molecules/feeds/feeds_quotes_card.dart';
import 'package:styria_flutter_web/design_system/atoms/cards/project_card.dart';
import 'package:styria_flutter_web/design_system/atoms/dropdown/dropdown.dart';
import 'package:styria_flutter_web/design_system/atoms/dropdown/mutiselect_dropdown.dart';
import 'package:styria_flutter_web/design_system/atoms/cards/apps_card.dart';
import 'package:styria_flutter_web/design_system/atoms/dropdown/layer_dropdown.dart';
import 'package:styria_flutter_web/design_system/atoms/checkbox/text_checkbox.dart';
import 'package:styria_flutter_web/design_system/atoms/data_picker/date_picker.dart';
import 'package:styria_flutter_web/design_system/atoms/file_picker/file_picker.dart';
import 'package:styria_flutter_web/design_system/atoms/footer/footer.dart';
import 'package:styria_flutter_web/design_system/atoms/dropdown/time_report_dropdown.dart';
import 'package:styria_flutter_web/design_system/atoms/inputs/primary_input_field.dart';
import 'package:styria_flutter_web/design_system/atoms/inputs/primary_search_field.dart';
import 'package:styria_flutter_web/design_system/atoms/inputs/primary_select_input.dart';
import 'package:styria_flutter_web/design_system/atoms/inputs/primary_select_input_small.dart';
import 'package:styria_flutter_web/design_system/atoms/inputs/primary_text_area_field.dart';
import 'package:styria_flutter_web/design_system/atoms/inputs/primary_text_area_field_fixed.dart';
import 'package:styria_flutter_web/design_system/atoms/inputs/secondary_input_field.dart';
import 'package:styria_flutter_web/design_system/atoms/inputs/secondary_input_field_small.dart';
import 'package:styria_flutter_web/design_system/atoms/inputs/tertiary_input_field.dart';
import 'package:styria_flutter_web/design_system/atoms/inputs/time_input_field.dart';
import 'package:styria_flutter_web/design_system/atoms/navigations/side_navigation.dart';
import 'package:styria_flutter_web/design_system/atoms/navigations/top_navigation.dart';
import 'package:styria_flutter_web/design_system/atoms/tags/tag.dart';
import 'package:styria_flutter_web/design_system/atoms/start_rating/star_rating_with_number.dart';
import 'package:styria_flutter_web/design_system/atoms/tags/secondary_tag.dart';
import 'package:styria_flutter_web/design_system/organisms/cards/classifieds_item_card.dart';
import 'package:styria_flutter_web/design_system/organisms/cards/expandable_channel_card.dart';
import 'package:styria_flutter_web/design_system/organisms/cards/expense_card_two.dart';
import 'package:styria_flutter_web/design_system/organisms/cards/feeds_event_card.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/molecules/award_card.dart';
import 'package:styria_flutter_web/design_system/molecules/calendars/dashboard_calendar.dart';
import 'package:styria_flutter_web/design_system/molecules/calendars/dashboard_calendar_header.dart';
import 'package:styria_flutter_web/layouts/classifieds/image_carousal_layout.dart';
import 'package:styria_flutter_web/layouts/dashboard/actions_layout.dart';
import 'package:styria_flutter_web/layouts/dashboard/calendar_layout.dart';
import 'package:styria_flutter_web/design_system/molecules/cards/news_primary_card.dart';
// import 'package:styria_flutter_web/design_system/organisms/cards/dashboard_calendar_card.dart';
import 'package:styria_flutter_web/design_system/molecules/cards/filter_card.dart';
import 'package:styria_flutter_web/design_system/molecules/cards/link_card.dart';
import 'package:styria_flutter_web/design_system/molecules/forms/add_link.dart';
import 'package:styria_flutter_web/layouts/time_report/time_calendar.dart';
import 'package:styria_flutter_web/design_system/theme/app_theme.dart';
import 'package:styria_flutter_web/design_system/molecules/cards/notification_card.dart';
import 'package:styria_flutter_web/design_system/theme/theme_data.dart';
import 'package:styria_flutter_web/layouts/app_store/app_store_layout.dart';
import 'package:styria_flutter_web/layouts/awards/awards_layout.dart';
import 'package:styria_flutter_web/layouts/feeds/channel_list_dialog.dart';
import 'package:styria_flutter_web/layouts/feeds/create_channel.dart';
import 'package:styria_flutter_web/layouts/feeds/create_feed.dart';
import 'package:styria_flutter_web/layouts/feeds/explore_layout.dart';
import 'package:styria_flutter_web/layouts/links/notification_box.dart';
import 'package:styria_flutter_web/layouts/people/basic_details.dart';
import 'package:styria_flutter_web/layouts/people/people_card.dart';
import 'package:styria_flutter_web/layouts/people/user_detail_layout.dart';
import 'package:styria_flutter_web/layouts/dashboard/apps_layout.dart';
import 'package:styria_flutter_web/layouts/dashboard/feeds_layout.dart';
import 'package:styria_flutter_web/layouts/dashboard/insights_layout.dart';
import 'package:styria_flutter_web/layouts/popup_modal.dart';
import 'package:styria_flutter_web/shared/widgets/menu_item.dart';
import 'package:styria_flutter_web/shared/widgets/style_guide/color_guide.dart';
import 'package:styria_flutter_web/shared/widgets/style_guide/typography_guide.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

final activeSkillProvider = StateProvider<List<String>>((ref) => []);

/// The below function sets up a Widgetbook interface with various components and use cases for UI
/// testing and showcases different widgets and themes.
void main() {
  runApp(const ProviderScope(child: WidgetbookHotReload()));
}

bool isSelected = false;

@widgetbook.App()
class WidgetbookHotReload extends ConsumerWidget {
  const WidgetbookHotReload({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(themeProvider.notifier);

    return Widgetbook.material(
      directories: [
        WidgetbookFolder(
          name: 'Widgets',
          children: [
            // Widgets
            WidgetbookComponent(
              name: 'Calendar',
              useCases: [
                WidgetbookUseCase(
                  name: 'Calendar Planner',
                  builder: (context) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CalendarWidget(
                      events: {
                        DateTime(2024, 10, 16): [
                          CalendarEvent(
                              name: "Ascension Day",
                              color: Colors.red,
                              type: 'Holidays'),
                          CalendarEvent(
                              name: "Sick",
                              color: Colors.red,
                              type: 'Holidays'),
                          CalendarEvent(
                              name: "Leadership Workshop",
                              color: Colors.orange,
                              type: 'Training'),
                        ],
                        DateTime(2024, 10, 19): [
                          CalendarEvent(
                              name: "Family Function",
                              color: Colors.blue,
                              type: 'Event'),
                          CalendarEvent(
                              name: "Wedding",
                              color: Colors.green,
                              type: 'Tasks'),
                        ],
                        DateTime(2024, 10, 22): [
                          CalendarEvent(
                              name: "Personal Leave",
                              color: Colors.brown,
                              type: 'Holidays'),
                          CalendarEvent(
                              name: "Project Milestone Review",
                              color: Colors.green,
                              type: 'Tasks'),
                          CalendarEvent(
                              name: "code Refactoring",
                              color: Colors.green,
                              type: 'Tasks'),
                        ],
                        DateTime(2024, 10, 23): [
                          CalendarEvent(
                              name: "Company Holiday",
                              color: Colors.red,
                              type: 'Holidays'),
                        ],
                        DateTime(2024, 10, 24): [
                          CalendarEvent(
                              name: "Independence Day",
                              color: Colors.red,
                              type: 'Holidays'),
                        ],
                        DateTime(2024, 10, 25): [
                          CalendarEvent(
                              name: "Annual Gala",
                              color: Colors.blue,
                              type: 'Events'),
                        ],
                        DateTime(2024, 10, 26): [
                          CalendarEvent(
                              name: "Tech Conference",
                              color: Colors.blue,
                              type: 'Events'),
                        ],
                        DateTime(2024, 10, 27): [
                          CalendarEvent(
                              name: "React Training Session",
                              color: Colors.orange,
                              type: 'Training'),
                        ],
                      },
                    ),
                  ),
                ),
              ],
            ),

            //       WidgetbookComponent(
            //         name: 'Conference room booking Card',
            //         useCases: [
            //           WidgetbookUseCase(
            //             name: 'Default',
            //             builder: (context) => const Padding(
            //               padding: EdgeInsets.all(8.0),
            //               child: ConferenceCard(
            //                 roomId: '8F',
            //                 roomName: 'ConferenceRoom - 1',
            //                 seats: '12',
            //                 amenities: {
            //                   'Phone': true, // Phone
            //                   'Tv': false, // TV
            //                   'Wifi': true, // Wifi
            //                   'Projector': false, // Projector
            //                 },
            //                 slots: [
            //   {'startTime': '10:40', 'endTime': '11:40', 'isSelected': true},
            //   {'startTime': '12:00', 'endTime': '01:00', 'isSelected': false},
            // ]
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            WidgetbookComponent(
              name: 'Planner Cards',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default',
                  builder: (context) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PlannerCards(
                      color: context.knobs.color(
                          label: 'color', initialValue: AppColors.brandBlue),
                      label: context.knobs.string(
                          label: 'label', initialValue: 'Ascension day'),
                      date: DateTime(2024, 12, 13),
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Primary Input Field',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default',
                  builder: (context) => const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: PrimaryInputField(
                      obscureText: false,
                      placeholder: 'Type here',
                      labelText: "Username",
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'User Name',
                  builder: (context) => const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: PrimaryInputField(
                      obscureText: false,
                      placeholder: 'Username',
                      labelText: 'Username',
                      inputFieldType: 'login',
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Password Field',
                  builder: (context) => const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: PrimaryInputField(
                      obscureText: true,
                      placeholder: 'Password',
                      labelText: 'Password',
                      inputFieldType: 'login',
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Password Field with error',
                  builder: (context) => const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: PrimaryInputField(
                      obscureText: true,
                      placeholder: 'Password',
                      labelText: 'Password',
                      inputFieldType: 'login',
                      errorMessage: 'invalid credentials',
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Secondary Input Field',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default',
                  builder: (context) => const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SecondaryInputField(
                      obscureText: false,
                      placeholder: 'Input text',
                      labelText: "Label",
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Secondary Input Field - Small',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default',
                  builder: (context) => const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SecondaryInputFieldSmall(
                      obscureText: false,
                      placeholder: 'Input text',
                      labelText: "Label",
                    ),
                  ),
                ),
              ],
            ),
            // WidgetbookComponent(
            //   name: 'Primary Select Input',
            //   useCases: [
            //     WidgetbookUseCase(
            //       name: 'Default',
            //       builder: (context) => const Padding(
            //         padding: EdgeInsets.all(8.0),
            //         child: PrimarySelectInput(
            //           labelText: 'Label',
            //           items: [
            //             'Option 1',
            //             'Option 2',
            //             'Option 3',
            //             'Option 4',
            //             'Option 5'
            //           ],
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            WidgetbookComponent(
              name: 'Primary Select Input - Small',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default',
                  builder: (context) => const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: PrimarySelectInputSmall(
                      labelText: 'Label',
                      initialValue: 'Option 2',
                      items: [
                        'Option 1',
                        'Option 2',
                        'Option 3',
                        'Option 4',
                        'Option 5'
                      ],
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Tertiary Input Field Form',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default',
                  builder: (context) => const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TertiaryInputField(
                      label: 'Activity',
                      message: 'Activity is required',
                      initialValue: '',
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Time Input field',
              useCases: [
                WidgetbookUseCase(
                    name: 'Default',
                    builder: (context) {
                      final label = context.knobs
                          .string(label: 'Label', initialValue: 'Enter Time');
                      final initialValueString = context.knobs
                          .string(label: 'Initial Value', initialValue: "0");
                      final stepString = context.knobs
                          .string(label: 'Step', initialValue: "1");
                      final maxValueString = context.knobs
                          .string(label: 'Max Value', initialValue: "24");

                      final int initialValue = initialValueString.isNotEmpty
                          ? int.parse(initialValueString)
                          : 0;
                      final int step =
                          stepString.isNotEmpty ? int.parse(stepString) : 1;
                      final int maxValue = maxValueString.isNotEmpty
                          ? int.parse(maxValueString)
                          : 0;
                      return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TimeInputField(
                            label: label,
                            initialValue: initialValue,
                            step: step,
                            maxValue: maxValue,
                            onChanged: (int value) {
                              debugPrint(
                                  'TimeInputField value changed: $value');
                            },
                          ));
                    }),
              ],
            ),
            WidgetbookComponent(
              name: 'TitleDesc Card',
              useCases: [
                WidgetbookUseCase(
                  name: 'Primary',
                  builder: (context) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TitleDescCard(
                      variant: 'primary',
                      title: context.knobs.string(
                          label: 'Title',
                          initialValue: 'Title Description Card'),
                      description: context.knobs.string(
                          label: 'Description',
                          initialValue:
                              'A quick insight into the modern science of visual perception. We will be decoding how our brain makes assumptions of visual patterns and their  implementations in creating a robust UX design.'),
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Secondary',
                  builder: (context) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TitleDescCard(
                      variant: 'secondary',
                      title: context.knobs.string(
                          label: 'Title',
                          initialValue: 'Title Description Card'),
                      description: context.knobs.string(
                          label: 'Description',
                          initialValue:
                              'A quick insight into the modern science of visual perception. We will be decoding how our brain makes assumptions of visual patterns and their  implementations in creating a robust UX design.'),
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Primary Text Area - AutoSize',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default',
                  builder: (context) => const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: PrimaryTextAreaField(
                      labelText: 'Label',
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Primary Text Area - Fixed',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default',
                  builder: (context) => const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: PrimaryTextAreaFieldFixed(
                      labelText: 'Label',
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Secondary Text Area - Fixed',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default',
                  builder: (context) => const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SecondaryTextAreaFieldFixed(
                      labelText: 'Label',
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Primary Search Field',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default',
                  builder: (context) => const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: PrimarySearchField(
                      placeholder: 'Search here',
                      keyboardType: TextInputType.text,
                      obscureText: false,
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Add Comment Field',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default',
                  builder: (context) => const Padding(
                      padding: EdgeInsets.all(8.0), child: AddCommentField()),
                ),
              ],
            ),

            // WidgetbookComponent(
            //   name: 'View Comment card',
            //   useCases: [
            //     WidgetbookUseCase(
            //       name: 'Default',
            //       builder: (context) =>  Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: ViewCommentCard(
            //           userName: 'Sana Parvin',
            //           postComment: 'Interesting',

            //           isCommentEdit: true,
            //         ),
            //       ),
            //     ),
            //   ],
            // ),

            WidgetbookComponent(
              name: 'Primary Button',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default',
                  builder: (context) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PrimaryButton(
                      buttonText: 'Button',
                      onPressed: () {},
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Outlined',
                  builder: (context) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SecondaryButton(
                      buttonText: 'Button',
                      onPressed: () {},
                      icon: Icons.add,
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Outlined secondary',
                  builder: (context) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SecondaryButton(
                      buttonText: '+ Button',
                      onPressed: () {},
                      isSecondary: true,
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Tertiary',
                  builder: (context) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TertiaryButton(
                      buttonText: 'Button',
                      onPressed: () {},
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Tertiary Variant 2',
                  builder: (context) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TertiaryButton(
                      buttonText: 'Button',
                      onPressed: () {},
                      variant2: true,
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Navigations',
              useCases: [
                WidgetbookUseCase(
                  name: 'Top Navigations',
                  builder: (context) => const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TopNavigation(
                      logoPath: 'assets/logo/styria_logo.svg',
                      isSvgLogo: true,
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Side Navigations',
                  builder: (context) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SideNavigation(
                      breakpoint: 768,
                      items: [
                        MenuItem(
                          id: 'dashboard',
                          icon: Icons.dashboard_outlined,
                          link: AppRoute.home,
                          labelText: 'Dashboard',
                        ),
                        MenuItem(
                          id: 'apps',
                          icon: Icons.apps_outlined,
                          link: AppRoute.apps,
                          labelText: 'Apps',
                        ),
                        MenuItem(
                          id: 'feeds',
                          icon: Icons.calendar_view_day_outlined,
                          link: AppRoute.feeds,
                          labelText: 'Feeds',
                        ),
                        MenuItem(
                          id: 'planner',
                          icon: Icons.calendar_today_outlined,
                          link: AppRoute.planner,
                          labelText: 'Planner',
                        ),
                        MenuItem(
                          id: 'insight',
                          icon: Icons.bar_chart_outlined,
                          link: AppRoute.insight,
                          labelText: 'Insight',
                        ),
                        MenuItem(
                          id: 'organisation',
                          icon: Icons.apartment_outlined,
                          link: AppRoute.organisation,
                          labelText: 'Organisation',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(name: 'Cards', useCases: [
              WidgetbookUseCase(
                name: 'User card 1',
                builder: (context) => const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: UserCard1(
                    name: 'Abhishek Saha',
                    email: 'abhishek.saha@tarento.com',
                    phone: '+918987676543',
                  ),
                ),
              ),
              WidgetbookUseCase(
                name: 'User card 2',
                builder: (context) => const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: UserCard2(
                    name: 'Abhishek Saha',
                    designation: 'Vice president',
                    department: 'Enterprise consulting',
                  ),
                ),
              ),
              WidgetbookUseCase(
                name: 'Secondary news card',
                builder: (context) => const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: NewsSecondaryCard(
                      title:
                          'Ashok leyland launches \'M&HCV Expo\' series from Delhi changes.',
                      content:
                          'This initiative aims to bring Ashok Leyland\'s Medium and Heavy Commercial Vehicles...',
                      time: '5 hour ago'),
                ),
              ),
              WidgetbookUseCase(
                name: 'Channel card',
                builder: (context) => const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ChannelCard(
                      text: 'NXT',
                      isSubscribed: true,
                      title: 'Channels',
                      icon: Icons.home,
                    )),
              ),
              // WidgetbookUseCase(
              //   name: 'Channel modal',
              //   builder: (context) => const Padding(
              //       padding: EdgeInsets.all(8.0), child: ChannelListDialog()),
              // ),
            ]),
            WidgetbookComponent(
              name: 'Check Box',
              useCases: [
                WidgetbookUseCase(
                  name: 'Feed activity card',
                  builder: (context) => const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: FeedActivityCard(
                      username: 'HR',
                      channel: 'General',
                      activityType: 'POST',
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Feed card header',
                  builder: (context) => const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: FeedsCardHeader(
                        username: 'HR',
                        date: '20 mins ago',
                        channel: 'General',
                        isEdit: true,
                      )),
                ),
                // WidgetbookUseCase(
                //   name: 'Feed card',
                //   builder: (context) => const Padding(
                //     padding: EdgeInsets.all(8.0),
                //     child: FeedCard(
                //       profileImage: '',
                //       username: 'HR',
                //       postDate: '20 mins ago',
                //       bannerImageUrl:
                //           'https://s3-alpha-sig.figma.com/img/470d/2611/0fa52aef80e04870b52e8c4c69f73dfd?Expires=1734307200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=HnuZJ1hUwsSpNDnMeIks0OzhnV3ZaCIoxb5iUk-z3tEnhx6e9bq9h3-Dn5r6eCry39LjdQU2mY947B78xHXoaE6Z-R6pMcd51K7OlOzP7fcsX~YjDDMYFWM1EmKxwlfbnQe0IJ3TmK1WFsv3c6iY6CxwgsPRY6u12c18PIUbAl9PxhjW1DUU3iAx2sEb5fzm-OXpQzmQrCN9fND-rJ7RIaYRvh~YIFp3YKyYZcP~7tT-HfQW7rMbjfedqwdYoRa4Op-6R5zkE3iZIxNeQs~KUuiheVzv~QzHw2mmISt~0XKhCzO4hsDyxDekkXo0rlk58Z4IFXk03TGkKQkwFwIIcQ__',
                //       postTitle: 'Thought for the day!',
                //       postDescription:
                //           'If you aim at nothing, you will hit it every time. -Zig Ziglar',
                //       channel: 'General',
                //       likes: 2,
                //       comments: 2,
                //       isLiked: true,
                //     ),
                //   ),
                // ),
                WidgetbookUseCase(
                  name: 'Feeds quotes card',
                  builder: (context) => const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: FeedsQuotesCard(
                      title: 'Thought for the day!',
                      content:
                          'If you aim at nothing, you will hit it every time. -Zig Ziglar',
                      event: false,
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Feeds post card',
                  builder: (context) => const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: FeedsPostCard(
                      title: 'Thought for the day!',
                      description:
                          'If you aim at nothing, you will hit it every time. -Zig Ziglar',
                      bannerImageUrl:
                          'https://s3-alpha-sig.figma.com/img/470d/2611/0fa52aef80e04870b52e8c4c69f73dfd?Expires=1734307200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=HnuZJ1hUwsSpNDnMeIks0OzhnV3ZaCIoxb5iUk-z3tEnhx6e9bq9h3-Dn5r6eCry39LjdQU2mY947B78xHXoaE6Z-R6pMcd51K7OlOzP7fcsX~YjDDMYFWM1EmKxwlfbnQe0IJ3TmK1WFsv3c6iY6CxwgsPRY6u12c18PIUbAl9PxhjW1DUU3iAx2sEb5fzm-OXpQzmQrCN9fND-rJ7RIaYRvh~YIFp3YKyYZcP~7tT-HfQW7rMbjfedqwdYoRa4Op-6R5zkE3iZIxNeQs~KUuiheVzv~QzHw2mmISt~0XKhCzO4hsDyxDekkXo0rlk58Z4IFXk03TGkKQkwFwIIcQ__',
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Feeds card footer',
                  builder: (context) => const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: FeedsCardFooter(
                      likes: 2,
                      comments: 0,
                      isLiked: true,
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Star Rating',
                  builder: (context) {
                    final String starCount = context.knobs
                        .string(label: 'Star Count', initialValue: '5');
                    final String starSize = context.knobs
                        .string(label: 'Star Size', initialValue: '16');
                    final String spaceBetweenStars = context.knobs.string(
                        label: 'Space Between Stars', initialValue: '32');
                    final String textSize = context.knobs
                        .string(label: 'Text Size', initialValue: '16');
                    final String spaceBetweenStarsAndLabel = context.knobs
                        .string(
                            label: 'Space Between Stars and Label',
                            initialValue: '16');

                    return ProviderScope(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: StarRatingWithLabel(
                          id: 'custom-star-label',
                          starCount: int.tryParse(starCount) ?? 5,
                          starSize: double.tryParse(starSize) ?? 16.0,
                          spaceBetweenStars:
                              double.tryParse(spaceBetweenStars) ?? 32.0,
                          textSize: double.tryParse(textSize) ?? 16.0,
                          spaceBetweenStarsAndLabel:
                              double.tryParse(spaceBetweenStarsAndLabel) ??
                                  16.0,
                        ),
                      ),
                    );
                  },
                ),
                // WidgetbookUseCase(
                //   name: 'Popup modal',
                //   builder: (context) => const Padding(
                //     padding: EdgeInsets.all(8.0),
                //     child: CustomModal(
                //       child: Text('Custom modal'),
                //     ),
                //   ),
                // ),
                // WidgetbookUseCase(
                //   name: 'Channel modal',
                //   builder: (context) => const Padding(
                //       padding: EdgeInsets.all(8.0), child: ChannelListDialog()),
                // ),
                // WidgetbookUseCase(
                //   name: 'Create feed',
                //   builder: (context) => const Padding(
                //       padding: EdgeInsets.all(8.0), child: CreateFeed(title: 'Create channel',items: channels.map((channel) => channel.name).toList(),)),
                // ),
                WidgetbookUseCase(
                  name: 'User details section',
                  builder: (context) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: UserDetailLayout()),
                ),
                WidgetbookUseCase(
                  name: 'Basic details section',
                  builder: (context) => const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: BasicDetails(
                        name: 'Abhishek Saha',
                        empId: 808,
                        dateOfJoining: '3 dec 2018',
                        image: '',
                        email: 'abhishek.gupta@tarento.com',
                        phone: '+91 9972222610',
                        department: 'Sales & marketing',
                        workLoc: 'Bengaluru - Umiya Emporium',
                        careerStarted:
                            '23 Dec 2010 (as of today: 10 years, 6 moths, 6 days)',
                      )),
                ),
                WidgetbookUseCase(
                  name: 'Tabs',
                  builder: (context) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Tabs(tabTitles: const [
                        'Basic Details',
                        'Skills',
                        'Projects'
                      ], tabViews: const [
                        Text('hi'),
                        Text('hi'),
                        Text('hi')
                      ])),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Check Box',
              useCases: [
                WidgetbookUseCase(
                  name: 'Check Box',
                  builder: (context) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ProviderScope(
                      child: TextCheckbox(
                        title: context.knobs
                            .string(label: "title", initialValue: "All"),
                        onChanged: (bool value) {},
                        initialSelected: false,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Filter Cards',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default',
                  builder: (context) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ProviderScope(
                      child: FilterCard(
                        heading: context.knobs
                            .string(label: "heading", initialValue: "Category"),
                        filterData: const [
                          {'title': "All", 'status': true},
                          {'title': "Digital", 'status': false},
                          {'title': "Enterprise Consultancy", 'status': true},
                          {'title': "NXT", 'status': true},
                          {'title': "Finland", 'status': false},
                          {'title': "React", 'status': false},
                          {'title': "Next.js", 'status': false},
                          {'title': "Flutter", 'status': false},
                          {'title': "Docker", 'status': false},
                        ],
                        onSelectionChanged:
                            (List<Map<String, dynamic>> selections) {
                          for (var selection in selections) {
                            print(selection);
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(name: 'Link From', useCases: [
              WidgetbookUseCase(
                name: 'Default',
                builder: (context) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProviderScope(
                    child: AddLink(
                      onRadioValueChange: (value) {
                        print("Selected radio value: $value");
                      },
                      onAdd: (link, title, tags, privacy) {
                        print(
                            "Adding link: $link, Title: $title, Tags: $tags, Privacy: $privacy");
                      },
                      onClear: () {
                        print("Fields cleared.");
                      },
                    ),
                  ),
                ),
              ),
              WidgetbookUseCase(
                name: 'Edit Link',
                builder: (context) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProviderScope(
                    child: AddLink(
                      title: "Edit Link",
                      defaultLink: "https://example.com",
                      defaultTitle: "Example Title",
                      defaultTags: const ["tag1", "tag2"],
                      buttonContent: "Save",
                      defaultRadioValue: "Private",
                      onRadioValueChange: (value) {
                        print("Selected radio value: $value");
                      },
                      onAdd: (link, title, tags, privacy) {
                        print(
                            "Adding link: $link, Title: $title, Tags: $tags, Privacy: $privacy");
                      },
                      onClear: () {
                        print("Fields cleared.");
                      },
                    ),
                  ),
                ),
              ),
            ]),
            WidgetbookComponent(
              name: 'Link Cards',
              useCases: [
                WidgetbookUseCase(
                  name: 'Link Cards',
                  builder: (context) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ProviderScope(
                      child: LinkCard(
                        logo: context.knobs.string(
                            label: "Logo",
                            initialValue:
                                "https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Microsoft_logo.svg/2048px-Microsoft_logo.svg.png"),
                        title: context.knobs.string(
                            label: "title",
                            initialValue: "NXT Team Tracker - 2024.xlssj"),
                        link: context.knobs.string(
                            label: "link",
                            initialValue:
                                ":x:/r/personal/jinesh_sumedhan_tarento_com..."),
                        tags: const ["react", "java"],
                        url: '',
                        text: '',
                      ),
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Link Cards without tags',
                  builder: (context) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ProviderScope(
                      child: LinkCard(
                        logo: context.knobs.string(
                            label: 'Logo',
                            initialValue:
                                "https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Microsoft_logo.svg/2048px-Microsoft_logo.svg.png"),
                        title: context.knobs.string(
                            label: "title",
                            initialValue: "NXT Team Tracker - 2024.xlssj"),
                        link: context.knobs.string(
                            label: "link",
                            initialValue:
                                ":x:/r/personal/jinesh_sumedhan_tarento_com..."),
                        url: '',
                        text: '',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Drop down',
              useCases: [
                WidgetbookUseCase(
                  name: 'Mutiselect dropdown',
                  builder: (context) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MultiSelectDropdown(
                      items: context.knobs.list(
                        label: 'Items',
                        initialOption: [
                          'Holidays',
                          'Leave',
                          'Events',
                          'Training',
                          'Tasks'
                        ],
                        options: [
                          ['Holidays', 'Leave', 'Events', 'Training', 'Tasks']
                        ],
                      ),
                      colors: context.knobs.list(
                        label: 'Colors',
                        initialOption: [
                          Colors.red,
                          Colors.brown,
                          Colors.blue,
                          Colors.orange,
                          Colors.green,
                        ],
                        options: [
                          [
                            Colors.red,
                            Colors.brown,
                            Colors.blue,
                            Colors.orange,
                            Colors.green,
                          ],
                        ],
                      ),
                      onSelectionChanged: (selectedItems) {},
                      heading: context.knobs
                          .string(label: 'title', initialValue: 'select type'),
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Dropdown',
                  builder: (context) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomWebDropdown(
                      title: context.knobs
                          .string(label: 'title', initialValue: 'Create'),
                      items: context.knobs.list(label: 'options', options: [
                        ['Create Event', 'Create Training']
                      ]),
                      onChanged: (String? selectedItem) {
                        if (selectedItem != null) {
                          print('Selected: $selectedItem');
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Charts',
              useCases: [
                WidgetbookUseCase(
                  name: 'Bar Chart',
                  builder: (context) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          StackedBarChartWidget(
                            dates: List.generate(
                                7,
                                (index) =>
                                    DateTime.now().add(Duration(days: index))),
                            hoursData: const [
                              [
                                5.0,
                                3.0
                              ], // Day 1: Project A: 5hrs, Project B: 3hrs
                              [
                                6.5,
                                1.5
                              ], // Day 2: Project A: 6.5hrs, Project B: 1.5hrs
                              [
                                4.0,
                                2.0,
                                2.0
                              ], // Day 3: Project A: 4hrs, Project B: 2hrs, Project C: 2hrs
                              [
                                7.0,
                                1.0
                              ], // Day 4: Project A: 7hrs, Project B: 1hr
                              [8.0], // Day 5: Project A: 8hrs
                              [
                                3.0,
                                2.0,
                                1.0
                              ], // Day 6: Project A: 3hrs, Project B: 2hrs, Project C: 1hr
                              [
                                2.0,
                                1.0
                              ], // Day 7: Project A: 2hrs, Project B: 1hr
                            ],
                            projects: const [
                              'Project A',
                              'Project B',
                              'Project C'
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Project Card',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default',
                  builder: (context) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ProjectCard(
                      title: "Fundmed Lead sprint",
                      imageUrl:
                          'data:image/png;base64,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',
                      domain: 'Government',
                      department: 'Digital',
                      estimatedHours: 'N/A',
                      projectHealthIcon: Icons.sentiment_satisfied_alt_rounded,
                      onPress: () {
                        print("Clicked the project card");
                      },
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Secondary',
                  builder: (context) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: NewsPrimaryCard(
                      imageUrl: context.knobs.string(
                          label: "Image URL",
                          initialValue:
                              "https://s3-alpha-sig.figma.com/img/b4a2/b5da/4292e220abd886910ddfd8f425b03d2b?Expires=1730073600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=jd1dqDUodlwJ~IuMtQo6rxr1f~yMVJabx1YH2oF1xSMZFFOETQVQ3wDgp9rR14NbMa6Xor8kplJuphI6ZV6-gIMSfnv7PgRsxqU~7rPTYzax-lE8YPcBU-90mu6LQgT93AdBzUNYLI~O~gA23dly3ybPCwIo09G2rGXsjUgizCNPLssTfHN7iYHD8d10mB1bmT438c1wghPZU8nq51GnNu2g0FBdUrt7o7f1nO1ORUo7bv7QRtlBIt3Nadrq5ldCygm3Lc2kZDLVIDKCad0fyU6tMI9~djlS4fIGZnoNrSeNqME1cxT4dscwTbI5GaaY2k8Xhn5oAuzL3tDq~QWTzA__"),
                      tag: context.knobs
                          .string(label: "Tag", initialValue: "Trending"),
                      title: context.knobs.string(
                          label: "Title",
                          initialValue:
                              "​Reassuring resolve: On the RBI’s Monetary Policy Committee’s move."),
                      subTitle: context.knobs.string(
                          label: "Subtitle",
                          initialValue:
                              "The RBI’s Monetary Policy Committee (MPC) has for a ninth straight meeting chosen to keep the benchmark interest rate unchanged at 6.50%. This decision aims to support economic growth while addressing inflationary pressures. The MPC emphasized its commitment to maintaining price stability and indicated that it would remain vigilant regarding global economic conditions, domestic inflation trends, and growth prospects. As a result, the central bank is closely monitoring various indicators, including food and energy prices, to ensure the economy's resilience amidst fluctuating external factors."),
                      time: context.knobs
                          .string(label: "Time", initialValue: "12"),
                      tagStatus: context.knobs
                          .boolean(label: "Tag Status", initialValue: false),
                      onTap: () => print("Clicked"),
                      isSecondary: context.knobs
                          .boolean(label: "Is Secondary", initialValue: true),
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Secondary Tag',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default',
                  builder: (context) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SecondaryTag(
                      text: context.knobs
                          .string(label: "text", initialValue: "Trending"),
                      color: context.knobs
                          .color(label: "Color", initialValue: Colors.orange),
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Footer',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default',
                  builder: (context) => const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Footer(
                      itemList: ["Help", "Feedback", "Release Note"],
                      logo: "assets/logo/logo_tarento.svg",
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Breadcrumbs',
              useCases: [
                WidgetbookUseCase(
                  name: 'Single Page',
                  builder: (context) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PageBreadcrumbs(
                      items: [
                        BreadcrumbData(
                            label: 'Home', link: AppRoute.home, isActive: true),
                      ],
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Two Pages',
                  builder: (context) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PageBreadcrumbs(
                      items: [
                        BreadcrumbData(
                            label: 'Home',
                            link: AppRoute.home,
                            isActive: false),
                        BreadcrumbData(
                            label: 'Events',
                            link: AppRoute.events,
                            isActive: true),
                      ],
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Three Pages',
                  builder: (context) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PageBreadcrumbs(
                      items: [
                        BreadcrumbData(
                            label: 'Home',
                            link: AppRoute.home,
                            isActive: false),
                        BreadcrumbData(
                            label: 'Events',
                            link: AppRoute.events,
                            isActive: false),
                        BreadcrumbData(
                            label: 'Details',
                            link: AppRoute.eventDetails,
                            isActive: true),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            WidgetbookComponent(
              name: 'Date pickers',
              useCases: [
                WidgetbookUseCase(
                  name: 'Single date picker',
                  builder: (context) => const Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: SingleDatePicker(
                        width: 300,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(name: 'Apps Card', useCases: [
              WidgetbookUseCase(
                name: 'Default',
                builder: (context) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AppsCard(
                    title: context.knobs
                        .string(label: "Title", initialValue: "Time Reporting"),
                    isPinned: false,
                    imageSrc: Icons.timer_outlined,
                  ),
                ),
              ),
              WidgetbookUseCase(
                name: 'Pinned',
                builder: (context) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AppsCard(
                    title: context.knobs
                        .string(label: "Title", initialValue: "Time Reporting"),
                    isPinned: true,
                    imageSrc: Icons.timer_outlined,
                  ),
                ),
              ),
            ]),
            WidgetbookComponent(name: 'Apps Card', useCases: [
              WidgetbookUseCase(
                name: 'Default',
                builder: (context) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AppsCard(
                    title: context.knobs
                        .string(label: "Title", initialValue: "Time Reporting"),
                    isPinned: false,
                    imageSrc: Icons.timer_outlined,
                  ),
                ),
              ),
              WidgetbookUseCase(
                name: 'Pinned',
                builder: (context) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AppsCard(
                    title: context.knobs
                        .string(label: "Title", initialValue: "Time Reporting"),
                    isPinned: true,
                    imageSrc: Icons.timer_outlined,
                  ),
                ),
              ),
            ]),
            WidgetbookComponent(
              name: 'DropdownSelector',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default',
                  builder: (context) {
                    String selectedValue = 'Layers';

                    return StatefulBuilder(
                      builder: (context, setState) {
                        return Padding(
                          padding: const EdgeInsets.all(32.0),
                          child: LayerDropdown(
                            selectedValue: selectedValue,
                            onChanged: (newValue) {
                              setState(() {
                                selectedValue = newValue;
                              });
                            },
                            options: const [
                              'Layers',
                              'Option 1',
                              'Option 2',
                              'Option 3'
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'TimeReportDropdown',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default',
                  builder: (context) {
                    final title = context.knobs.string(
                      label: 'Title',
                      initialValue: 'Select a Task',
                    );
                    final placeholder = context.knobs.string(
                      label: 'Placeholder',
                      initialValue: 'Please select a task',
                    );
                    var selectedData = context.knobs.string(
                      label: 'Task',
                      initialValue: '',
                    );

                    return StatefulBuilder(builder: (context, setState) {
                      return Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: TimeReportDropdown(
                          title: title,
                          placeholder: placeholder,
                          listData: const ['Task 1', 'Task 2', 'Task 3'],
                          selectedData: selectedData,
                          onSelected: (value) {
                            setState(() {
                              selectedData = value;
                            });
                          },
                        ),
                      );
                    });
                  },
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Time report Header',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default',
                  builder: (context) {
                    final hoursString = context.knobs.string(
                      label: 'Hours',
                      initialValue: "00",
                    );

                    final minutesString = context.knobs.string(
                      label: 'Minutes',
                      initialValue: "00",
                    );

                    final int hours =
                        hoursString.isNotEmpty ? int.parse(hoursString) : 00;
                    final int minutes = minutesString.isNotEmpty
                        ? int.parse(minutesString)
                        : 00;

                    Duration totalTime =
                        Duration(hours: hours, minutes: minutes);
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TimeAndCalendarWidget(
                        totalTime: totalTime,
                        onDateChanged: (DateTime value) {},
                        startOfWeek: DateTime.now(),
                      ),
                    );
                  },
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Project Card',
              useCases: [
                WidgetbookUseCase(
                  name: 'Dynamic Configuration',
                  builder: (context) {
                    IconData parseIcon(String iconName) {
                      try {
                        switch (iconName) {
                          case 'sentiment_satisfied_alt':
                            return Icons.sentiment_satisfied_alt;
                          case 'sentiment_neutral':
                            return Icons.sentiment_neutral;
                          case 'sentiment_dissatisfied':
                            return Icons.sentiment_dissatisfied;
                          default:
                            return Icons.help;
                        }
                      } catch (e) {
                        print('Error parsing icon: $e');
                        return Icons.help;
                      }
                    }

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProjectCard(
                        title: context.knobs.string(
                          label: 'Title',
                          description: 'Enter the project title',
                          initialValue: 'Karmayogi Bharath',
                        ),
                        imageUrl: context.knobs.string(
                          label: 'Image URL',
                          description: 'Enter the image URL',
                          initialValue:
                              'https://imgs.search.brave.com/j6k8XvpO8OUuBE6GjBqVKDA_jLNO4EtIAYS3G8oN-Eg/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9wbGF5/LWxoLmdvb2dsZXVz/ZXJjb250ZW50LmNv/bS9KZGs1Z1NKeHRf/b2ltRlgwSm5UQ09C/Nms3VjhuaUsySTBB/TUQ1d211MTBtZzdS/ZkdoLVdORGZnbVBZ/aDZSNXBlZEQwPXcy/NDAtaDQ4MC1ydw',
                        ),
                        domain: context.knobs.string(
                          label: 'Domain',
                          description: 'Enter the project domain',
                          initialValue: 'Government',
                        ),
                        department: context.knobs.string(
                          label: 'Department',
                          description: 'Enter the project department',
                          initialValue: 'Digital',
                        ),
                        estimatedHours: context.knobs.string(
                          label: 'Estimated Hours',
                          description: 'Enter the estimated hours',
                          initialValue: 'N/A',
                        ),
                        projectHealthIcon: parseIcon(context.knobs.string(
                          label: 'Project Health Icon',
                          description:
                              'Enter the icon name (e.g., "sentiment_satisfied_alt")',
                          initialValue: 'sentiment_satisfied_alt',
                        )),
                        onPress: () {
                          print("Clicked the project card");
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
            WidgetbookComponent(name: 'Feeds Event Card', useCases: [
              WidgetbookUseCase(
                  name: 'Feed Card',
                  builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FeedsEventCard(
                        profileImage: 'profileImage',
                        channel: 'HR',
                        name: 'name',
                        lastSeen: 60,
                        isPrimary: true,
                        heading: 'heading',
                        date: DateTime(2024, 11, 4),
                        buttonText: 'buttonText',
                        startTime: DateTime(2024, 11, 4, 12),
                        endTime: DateTime(2024, 11, 4, 14),
                        postImage: 'postImage',
                        description: 'lorem epsum ',
                        coordinator: 'coordinator',
                      ),
                    );
                  })
            ]),
            WidgetbookComponent(
              name: 'Expense Card',
              useCases: [
                WidgetbookUseCase(
                  name: 'Dynamic Configuration',
                  builder: (context) {
                    IconData getIconFromString(String iconName) {
                      switch (iconName.toLowerCase()) {
                        case 'person':
                          return Icons.person;
                        case 'access_time':
                          return Icons.access_time;
                        case 'monetization_on':
                          return Icons.monetization_on;
                        case 'location_on':
                          return Icons.location_on;
                        case 'calendar_today':
                          return Icons.calendar_today;
                        case 'work':
                          return Icons.work;
                        case 'group':
                          return Icons.group;
                        case 'category':
                          return Icons.category;
                        default:
                          return Icons.help_outline;
                      }
                    }

                    final iconDataList = [
                      {
                        'icon': getIconFromString(
                          context.knobs.string(
                            label: 'Icon 1',
                            description:
                                '''Available icons: person, access_time, 
                  monetization_on, location_on, calendar_today, 
                  work, group, category''',
                            initialValue: 'person',
                          ),
                        ),
                        'text': context.knobs.string(
                          label: 'Icon 1 Text',
                          description: 'Enter the text for this icon',
                          initialValue: 'Attendees: 5',
                        ),
                      },
                      {
                        'icon': getIconFromString(
                          context.knobs.string(
                            label: 'Icon 2',
                            description:
                                '''Available icons: person, access_time, 
                  monetization_on, location_on, calendar_today, 
                  work, group, category''',
                            initialValue: 'access_time',
                          ),
                        ),
                        'text': context.knobs.string(
                          label: 'Icon 2 Text',
                          description: 'Enter the text for this icon',
                          initialValue: 'Duration: 2 hours',
                        ),
                      },
                      {
                        'icon': getIconFromString(
                          context.knobs.string(
                            label: 'Icon 3',
                            description:
                                '''Available icons: person, access_time, 
                  monetization_on, location_on, calendar_today, 
                  work, group, category''',
                            initialValue: 'monetization_on',
                          ),
                        ),
                        'text': context.knobs.string(
                          label: 'Icon 3 Text',
                          description: 'Enter the text for this icon',
                          initialValue: 'Cost: \$100',
                        ),
                      },
                      {
                        'icon': getIconFromString(
                          context.knobs.string(
                            label: 'Icon 4',
                            description:
                                '''Available icons: person, access_time, 
                  monetization_on, location_on, calendar_today, 
                  work, group, category''',
                            initialValue: 'location_on',
                          ),
                        ),
                        'text': context.knobs.string(
                          label: 'Icon 4 Text',
                          description: 'Enter the text for this icon',
                          initialValue: 'Location: Cafe',
                        ),
                      },
                    ];

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ExpenseCard(
                        iconData: iconDataList,
                        projectTitle: context.knobs.string(
                          label: 'Project Title',
                          description: 'Enter the project title',
                          initialValue: 'Lead Sprint',
                        ),
                        projectStatus: context.knobs.string(
                          label: 'Project Status',
                          description:
                              'Enter the project status (Pending/In Progress/Completed/Cancelled)',
                          initialValue: 'Pending',
                        ),
                        buttonText: context.knobs.string(
                          label: 'Button Text',
                          description: 'Enter the button text',
                          initialValue: 'View More',
                        ),
                        onPressed: () {
                          print("Clicked the expense card");
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Large Expense Card',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default',
                  builder: (context) {
                    IconData getIconFromString(String iconName) {
                      switch (iconName.toLowerCase()) {
                        case 'person':
                          return Icons.person;
                        case 'access_time':
                          return Icons.access_time;
                        case 'monetization_on':
                          return Icons.monetization_on;
                        case 'location_on':
                          return Icons.location_on;
                        case 'calendar_today':
                          return Icons.calendar_today;
                        case 'work':
                          return Icons.work;
                        case 'group':
                          return Icons.group;
                        case 'category':
                          return Icons.category;
                        default:
                          return Icons.help_outline;
                      }
                    }

                    final iconDataList = [
                      {
                        'icon': getIconFromString(
                          context.knobs.string(
                            label: 'Icon 1',
                            description:
                                '''Available icons: person, access_time, 
                  monetization_on, location_on, calendar_today, 
                  work, group, category''',
                            initialValue: 'person',
                          ),
                        ),
                        'text': context.knobs.string(
                          label: 'Icon 1 Text',
                          description: 'Enter the text for this icon',
                          initialValue: 'Attendees: 5',
                        ),
                      },
                      {
                        'icon': getIconFromString(
                          context.knobs.string(
                            label: 'Icon 2',
                            description:
                                '''Available icons: person, access_time, 
                  monetization_on, location_on, calendar_today, 
                  work, group, category''',
                            initialValue: 'access_time',
                          ),
                        ),
                        'text': context.knobs.string(
                          label: 'Icon 2 Text',
                          description: 'Enter the text for this icon',
                          initialValue: 'Duration: 2 hours',
                        ),
                      },
                      {
                        'icon': getIconFromString(
                          context.knobs.string(
                            label: 'Icon 3',
                            description:
                                '''Available icons: person, access_time, 
                  monetization_on, location_on, calendar_today, 
                  work, group, category''',
                            initialValue: 'monetization_on',
                          ),
                        ),
                        'text': context.knobs.string(
                          label: 'Icon 3 Text',
                          description: 'Enter the text for this icon',
                          initialValue: 'Cost: \$100',
                        ),
                      },
                      {
                        'icon': getIconFromString(
                          context.knobs.string(
                            label: 'Icon 4',
                            description:
                                '''Available icons: person, access_time, 
                  monetization_on, location_on, calendar_today, 
                  work, group, category''',
                            initialValue: 'location_on',
                          ),
                        ),
                        'text': context.knobs.string(
                          label: 'Icon 4 Text',
                          description: 'Enter the text for this icon',
                          initialValue: 'Location: Cafe',
                        ),
                      },
                    ];

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ExpenseCardTwo(
                        iconData: iconDataList,
                        projectTitle: context.knobs.string(
                          label: 'Project Title',
                          description: 'Enter the project title',
                          initialValue: 'Expense Reporting',
                        ),
                        projectStatus: context.knobs.string(
                          label: 'Project Status',
                          description:
                              'Enter the project status (Approved/Pending/Rejected)',
                          initialValue: 'Approved',
                        ),
                        buttonTextOne: context.knobs.string(
                          label: 'Button One Text',
                          description: 'Enter the text for first button',
                          initialValue: 'Remind',
                        ),
                        buttonTextTwo: context.knobs.string(
                          label: 'Button Two Text',
                          description: 'Enter the text for second button',
                          initialValue: 'Edit',
                        ),
                        imageUrl: context.knobs.string(
                          label: 'Image URL',
                          description: 'Enter the image URL',
                          initialValue:
                              'https://imgs.search.brave.com/j6k8XvpO8OUuBE6GjBqVKDA_jLNO4EtIAYS3G8oN-Eg/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9wbGF5/LWxoLmdvb2dsZXVz/ZXJjb250ZW50LmNv/bS9KZGs1Z1NKeHRf/b2ltRlgwSm5UQ09C/Nms3VjhuaUsySTBB/TUQ1d211MTBtZzdS/ZkdoLVdORGZnbVBZ/aDZSNXBlZEQwPXcy/NDAtaDQ4MC1ydw',
                        ),
                        descTitle: context.knobs.string(
                          label: 'Description Title',
                          description: 'Enter the description title',
                          initialValue: 'Description',
                        ),
                        description: context.knobs.string(
                          label: 'Description',
                          description: 'Enter the description text',
                          initialValue:
                              'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea.',
                        ),
                        attachmentCount: context.knobs.string(
                          label: 'Attachment Count',
                          description: 'Enter the attachment count',
                          initialValue: '3',
                        ),
                        onPressed: () {
                          print("Clicked button one");
                        },
                        onPressedTwo: () {
                          print("Clicked button two");
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Status Button',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default',
                  builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: StatusButton(
                          status: context.knobs.string(
                        label: 'Status',
                        description: 'Choose the status of the button',
                      )),
                    );
                  },
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Open Positions Card',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default',
                  builder: (context) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OpenPositionCard(
                      jobTitle: context.knobs.string(
                          label: "Job Title",
                          initialValue: "Frontend Developer"),
                      experience: context.knobs
                          .string(label: "Experience", initialValue: "3 to 5"),
                      location: context.knobs.string(
                          label: "Location", initialValue: "Bangaluru Office"),
                      jobType: context.knobs
                          .string(label: "Job Type", initialValue: "Full Time"),
                      postedTime: context.knobs.string(
                          label: "Posted Time",
                          initialValue: "Posted 5 hours ago"),
                      isUrgent: context.knobs
                          .boolean(label: "is Urgent", initialValue: true),
                    ),
                  ),
                ),
              ],
            ),

            WidgetbookComponent(
              name: 'Custom Date Picker',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default',
                  builder: (context) {
                    final DateTime startDate = DateTime(2024, 4, 26);
                    final DateTime endDate =
                        startDate.add(const Duration(days: 6));
                    const int weekNumber = 17;

                    return CustomDatePicker(
                      initialStartDate: startDate,
                      initialEndDate: endDate,
                      initialWeekNumber: weekNumber,
                      onDateChanged: (DateTime value) {},
                      startOfWeek: startDate,
                    );
                  },
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Project Deadline Card',
              useCases: [
                WidgetbookUseCase(
                  name: 'Project deadline card',
                  builder: (context) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ProjectDeadlineCard(
                      projectName: 'Kronos',
                      startDate: DateTime(2024),
                      endDate: DateTime(2025),
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'WeekDayCard',
              useCases: [
                WidgetbookUseCase(
                  name: 'Today',
                  builder: (context) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: WeekDayCard(
                      date: DateTime.now(),
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Not Today',
                  builder: (context) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: WeekDayCard(
                      date: DateTime.now().subtract(const Duration(days: 3)),
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'DurationCard',
              useCases: [
                WidgetbookUseCase(
                  name: 'DurationCard',
                  builder: (context) {
                    final String hoursString =
                        context.knobs.string(label: 'Hours', initialValue: '1');
                    final String minutesString = context.knobs
                        .string(label: 'Minutes', initialValue: '15');
                    final int hours = int.tryParse(hoursString) ?? 1;
                    final int minutes = int.tryParse(minutesString) ?? 15;
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DurationCard(
                        duration: Duration(hours: hours, minutes: minutes),
                      ),
                    );
                  },
                ),
              ],
            ),
            // WidgetbookComponent(name: 'Feeds Hashtag Card', useCases: [
            //   WidgetbookUseCase(
            //       name: 'Hashtag Card',
            //       builder: (context) {
            //         return const Padding(
            //           padding: EdgeInsets.all(8.0),
            //           child: FeedsHashtagCard(hashtags: [
            //             'hr',
            //             'development',
            //             'organisation',
            //             'cultural',
            //             'sports',
            //           ]),
            //         );
            //       })
            // ]),
            WidgetbookComponent(name: 'Icon card', useCases: [
              WidgetbookUseCase(
                  name: 'Icon card',
                  builder: (context) {
                    return const Padding(
                      padding: EdgeInsets.all(8.0),
                      child:
                          IconCard(icon: Icons.person_outline, text: 'Person'),
                    );
                  })
            ]),

            WidgetbookComponent(name: 'Explore Channels Layout', useCases: [
              WidgetbookUseCase(
                  name: 'Explore Channel Layout',
                  builder: (context) {
                    return const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ExploreLayout(),
                    );
                  })
            ]),
            WidgetbookComponent(
                name: 'Title Description Mixed Textfield',
                useCases: [
                  WidgetbookUseCase(
                      name: 'Default',
                      builder: (context) {
                        return const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TitleDescriptionMixedField(),
                        );
                      })
                ]),

            WidgetbookComponent(
              name: 'CustomIconButton',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default Icon Button',
                  builder: (context) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomIconButton(
                      onPressed: () {
                        debugPrint('Button Pressed');
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'With Different Icon',
                  builder: (context) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomIconButton(
                      onPressed: () {
                        debugPrint('Another Button Pressed');
                      },
                      icon: const Icon(Icons.remove),
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'AddTimeCard',
              useCases: [
                WidgetbookUseCase(
                  name: 'Add Time Card',
                  builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AddTimeCard(
                        hours: 10,
                        minutes: 10,
                        date: DateTime.now(),
                        onPressed: (int columnIndex) {},
                        columnIndex: 0,
                      ),
                    );
                  },
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Project Update Text Field',
              useCases: [
                WidgetbookUseCase(
                  name: 'Without description',
                  builder: (context) {
                    final title = context.knobs.string(
                      label: 'Title',
                      initialValue:
                          'Advanced Machine Learning and AI Workshop Series',
                    );
                    final date = context.knobs.dateTime(
                        label: 'Date',
                        initialValue: DateTime(2024, 11, 12),
                        start: DateTime(1700),
                        end: DateTime(2200));
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProjectUpdateTextField(
                        title: title,
                        date: date,
                        withDescription: true,
                      ),
                    );
                  },
                ),
                WidgetbookUseCase(
                  name: 'With description',
                  builder: (context) {
                    final title = context.knobs.string(
                      label: 'Title',
                      initialValue: 'Lorem ipsum dolar sit amet',
                    );
                    final date = context.knobs.dateTime(
                        label: 'Date',
                        initialValue: DateTime(2024, 11, 12),
                        start: DateTime(1700),
                        end: DateTime(2200));
                    final description = context.knobs.string(
                        label: 'Description',
                        initialValue:
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ');
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ProjectUpdateTextField(
                        title: title,
                        date: date,
                        description: description,
                        withDescription: true,
                      ),
                    );
                  },
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'TimeReportDetailsCard',
              useCases: [
                WidgetbookUseCase(
                  name: 'Description Card',
                  builder: (context) {
                    final String projectTitle = context.knobs
                        .string(label: 'Project Title', initialValue: 'Leave');
                    final String taskTitle = context.knobs.string(
                        label: 'Task Title', initialValue: 'Earned Leave');
                    final String hoursString =
                        context.knobs.string(label: 'Hours', initialValue: '8');
                    final String minutesString = context.knobs
                        .string(label: 'Minutes', initialValue: '0');
                    final int hours = int.tryParse(hoursString) ?? 1;
                    final int minutes = int.tryParse(minutesString) ?? 15;
                    final Color color = context.knobs.color(
                        label: 'Project Title Color',
                        initialValue: Colors.black);

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TimeReportDetailsCard(
                        projectTitle: projectTitle,
                        taskTitle: taskTitle,
                        duration: Duration(hours: hours, minutes: minutes),
                        color: color,
                      ),
                    );
                  },
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Dashboard Calendar',
              useCases: [
                WidgetbookUseCase(
                  name: 'Calendar',
                  builder: (context) {
                    return const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: DashboardCalendar(),
                    );
                  },
                )
              ],
            ),
            WidgetbookComponent(
              name: 'Calender Header',
              useCases: [
                WidgetbookUseCase(
                  name: 'Date Tag',
                  builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DashboardCalendarHeader(
                        title: 'Calendar: 2 events today',
                        buttonLabel: 'View on planner',
                        onViewPlanner: () {},
                      ),
                    );
                  },
                )
              ],
            ),
            WidgetbookComponent(
              name: 'Dashboard Actions field',
              useCases: [
                WidgetbookUseCase(
                  name: 'Calendar Header',
                  builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DashboardCalendarHeader(
                        title: 'Calendar: 2 events today',
                        buttonLabel: 'View on planner',
                        onViewPlanner: () {},
                      ),
                    );
                  },
                )
              ],
            ),
            // WidgetbookComponent(
            //   name: 'Calendar Card',
            //   useCases: [
            //     WidgetbookUseCase(
            //       name: 'Calender Card',
            //       builder: (context) {
            //         return const Padding(
            //           padding: EdgeInsets.all(8.0),
            //           child: DashboardCalendarCard(noOfEvents: 2),
            //         );
            //       },
            //     ),
            //   ],
            // ),
            WidgetbookComponent(
              name: 'Event Card',
              useCases: [
                WidgetbookUseCase(
                  name: 'Dynamic Configuration',
                  builder: (context) {
                    // Define the mapping from string names to IconData
                    const Map<String, IconData> iconMap = {
                      'calendar_month': Icons.calendar_month,
                      'access_time': Icons.access_time,
                      'person_outline': Icons.person_outline,
                      'school': Icons.school,
                      'location_on': Icons.location_on,
                      // Add more mappings as needed
                    };

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: EventCard(
                        imageUrl: context.knobs.string(
                          label: 'Image URL',
                          description: 'Enter the event image URL',
                          initialValue:
                              'https://imgs.search.brave.com/j6k8XvpO8OUuBE6GjBqVKDA_jLNO4EtIAYS3G8oN-Eg/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9wbGF5/LWxoLmdvb2dsZXVz/ZXJjb250ZW50LmNv/bS9KZGs1Z1NKeHRf/b2ltRlgwSm5UQ09C/Nms3VjhuaUsySTBB/TUQ1d211MTBtZzdS/ZkdoLVdORGZnbVBZ/aDZSNXBlZEQwPXcy/NDAtaDQ4MC1ydw',
                        ),
                        iconData: List.generate(5, (index) {
                          String iconName = context.knobs.string(
                            label: 'Icon ${index + 1}',
                            description:
                                'Enter the icon name for icon ${index + 1}',
                            initialValue: index == 0
                                ? 'calendar_month'
                                : 'SampleIcon${index + 1}',
                          );

                          return {
                            'icon': iconMap[iconName] ??
                                Icons.help_outline, // Fallback icon
                            'text': context.knobs.string(
                              label: 'Text ${index + 1}',
                              description: 'Enter text for icon ${index + 1}',
                              initialValue: 'Sample Text ${index + 1}',
                            ),
                          };
                        }),
                        cardTitle: context.knobs.string(
                          label: 'Card Title',
                          description: 'Enter the card title',
                          initialValue: 'All Hands',
                        ),
                        onPressOne: () {},
                        onPressTwo: () {},
                        tagText: 'Test',
                        tagColor: AppColors.neutralGray,
                      ),
                    );
                  },
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'EventCardTwo',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default',
                  builder: (context) => Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: EventCardTwo(
                      title: context.knobs.string(
                        label: 'Title',
                        initialValue: 'UI/UX Design Workshop',
                      ),
                      imageUrl: context.knobs.string(
                        label: 'Image URL',
                        initialValue: 'https://picsum.photos/400/257',
                      ),
                      description: context.knobs.string(
                        label: 'Description',
                        initialValue:
                            'Join us for an exciting workshop where we explore the fundamentals of UI/UX design. Learn about user research, wireframing, prototyping, and more.',
                      ),
                      iconCards: [
                        IconCardData(
                          icon: Icons.calendar_today,
                          text: context.knobs.string(
                            label: 'Date Text',
                            initialValue: 'June 15, 2024',
                          ),
                        ),
                        IconCardData(
                          icon: Icons.access_time,
                          text: context.knobs.string(
                            label: 'Time Text',
                            initialValue: '2:00 PM - 4:00 PM',
                          ),
                        ),
                        IconCardData(
                          icon: Icons.location_on,
                          text: context.knobs.string(
                            label: 'Location Text',
                            initialValue: 'Virtual Meeting',
                          ),
                        ),
                      ],
                      linkCards: [
                        LinkCardData(
                          text: context.knobs.string(
                            label: 'Link 1 Text',
                            initialValue: 'Workshop Materials',
                          ),
                          url: context.knobs.string(
                            label: 'Link 1 URL',
                            initialValue: 'https://example.com/materials',
                          ),
                        ),
                        LinkCardData(
                          text: context.knobs.string(
                            label: 'Link 2 Text',
                            initialValue: 'Pre-requisites',
                          ),
                          url: context.knobs.string(
                            label: 'Link 2 URL',
                            initialValue: 'https://example.com/prerequisites',
                          ),
                        ),
                      ],
                      onEnrollPressed: () {
                        // Handle enroll button press
                      },
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Long Content',
                  builder: (context) => Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: EventCardTwo(
                      title: context.knobs.string(
                        label: 'Title',
                        initialValue:
                            'Advanced Machine Learning and AI Workshop Series',
                      ),
                      imageUrl: context.knobs.string(
                        label: 'Image URL',
                        initialValue: 'https://picsum.photos/400/257',
                      ),
                      description: context.knobs.string(
                        label: 'Description',
                        initialValue:
                            'This comprehensive workshop series covers advanced topics in Machine Learning and Artificial Intelligence. From deep learning architectures to reinforcement learning, participants will gain hands-on experience with cutting-edge AI technologies. The course includes practical exercises, real-world case studies, and collaborative projects.',
                      ),
                      iconCards: [
                        IconCardData(
                          icon: Icons.calendar_today,
                          text: context.knobs.string(
                            label: 'Date Text',
                            initialValue: 'July 1 - September 30, 2024',
                          ),
                        ),
                        IconCardData(
                          icon: Icons.access_time,
                          text: context.knobs.string(
                            label: 'Time Text',
                            initialValue: '6:00 PM - 8:00 PM',
                          ),
                        ),
                        IconCardData(
                          icon: Icons.location_on,
                          text: context.knobs.string(
                            label: 'Location Text',
                            initialValue: 'Hybrid (In-person & Virtual)',
                          ),
                        ),
                      ],
                      linkCards: [
                        LinkCardData(
                          text: context.knobs.string(
                            label: 'Link 1 Text',
                            initialValue: 'Course Syllabus',
                          ),
                          url: context.knobs.string(
                            label: 'Link 1 URL',
                            initialValue: 'https://example.com/syllabus',
                          ),
                        ),
                        LinkCardData(
                          text: context.knobs.string(
                            label: 'Link 2 Text',
                            initialValue: 'Required Software',
                          ),
                          url: context.knobs.string(
                            label: 'Link 2 URL',
                            initialValue: 'https://example.com/software',
                          ),
                        ),
                        LinkCardData(
                          text: context.knobs.string(
                            label: 'Link 3 Text',
                            initialValue: 'Learning Resources',
                          ),
                          url: context.knobs.string(
                            label: 'Link 3 URL',
                            initialValue: 'https://example.com/resources',
                          ),
                        ),
                      ],
                      onEnrollPressed: () {
                        // Handle enroll button press
                      },
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Skills card',
              useCases: [
                WidgetbookUseCase(
                  name: 'Skill card',
                  builder: (context) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SkillCard(
                      skillName: context.knobs.string(
                          label: 'skill name', initialValue: 'UX Research'),
                      isActive: false,
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'All Skills card',
                  builder: (context) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AllSkillsCard(
                      skills: context.knobs.list(
                        label: 'skill ',
                        initialOption: [
                          'Flutter',
                          'Dart',
                          'React',
                          'Node.js',
                          'JavaScript',
                          'Python',
                          'Skill 1',
                          'Skill 2',
                          'Skill 3',
                          'Skill 4',
                          'Skill 5',
                          'Skill 6',
                          'Skill 7',
                          'Skill 8',
                          'Skill 9',
                          'Skill 10',
                          'Skill 11',
                          'Skill 12',
                          'Skill 13',
                          'Skill 14',
                        ],
                        options: [
                          [
                            'Flutter',
                            'Dart',
                            'React',
                            'Node.js',
                            'JavaScript',
                            'Python'
                          ]
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'TitleDesc Card',
              useCases: [
                WidgetbookUseCase(
                  name: 'Primary',
                  builder: (context) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TitleDescCard(
                      variant: 'primary',
                      title: context.knobs.string(
                          label: 'Title',
                          initialValue: 'Title Description Card'),
                      description: context.knobs.string(
                          label: 'Description',
                          initialValue:
                              'A quick insight into the modern science of visual perception. We will be decoding how our brain makes assumptions of visual patterns and their  implementations in creating a robust UX design.'),
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Secondary',
                  builder: (context) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TitleDescCard(
                      variant: 'secondary',
                      title: context.knobs.string(
                          label: 'Title',
                          initialValue: 'Title Description Card'),
                      description: context.knobs.string(
                          label: 'Description',
                          initialValue:
                              'A quick insight into the modern science of visual perception. We will be decoding how our brain makes assumptions of visual patterns and their  implementations in creating a robust UX design.'),
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Login Carousel',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default',
                  builder: (context) {
                    // Use knobs for dynamic control of titles, subtitles, and images

                    return const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: LoginCarousel(
                        contentTitles: [
                          'Daily Email Notifications: Create custom email notifications based',
                          'Stay updated with the latest trends',
                          'Join the community of creators',
                        ],
                        contentSubtitles: [
                          'on the triggers that are most important to your goals',
                          'Get insights into the latest trends.',
                          'Connect with people just like you.',
                        ],
                        imagePaths: [
                          'assets/logo/carousel_dummy.svg',
                          'assets/logo/carousel_dummy.svg',
                          'assets/logo/carousel_dummy.svg',
                        ],
                        activeColor: AppColors.brandBlue,
                        inactiveColor: AppColors.luckyGrey,
                      ),
                    );
                  },
                ),
              ],
            ),
            // WidgetbookComponent(
            //   name: 'App Store Card',
            //   useCases: [
            //     WidgetbookUseCase(
            //       name: 'Default',
            //       builder: (context) => Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: AppCard(
            //           app: AppStoreModel(
            //             id: 1,
            //             title: context.knobs.string(
            //                 label: 'Title', initialValue: 'Styria Mobile'),
            //             subtitle: context.knobs.string(
            //                 label: 'Subtitle',
            //                 initialValue:
            //                     'Styria Mobile is an integrated set of HR Mobile apps, packed with a plethora of features & functionality.'),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            WidgetbookComponent(
              name: 'Appstore Layout',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default',
                  builder: (context) {
                    return const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: AppStoreLayout(
                          apps: [],
                        ));
                  },
                ),
              ],
            ),
            WidgetbookComponent(name: 'People page layouts', useCases: [
              WidgetbookUseCase(
                  name: 'People card',
                  builder: (context) {
                    return const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: PeopleCard(
                          name: 'Abhishek Saha',
                          email: 'abhishek.saha@tarento.com',
                          phone: '+918987676543',
                          designation: 'Senior Consultant',
                          department: 'Microsoft Enterprise',
                        ));
                  }),
            ]),
            WidgetbookComponent(
              name: 'Classifieds',
              useCases: [
                WidgetbookUseCase(
                  name: 'Item Card',
                  builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClassifiedsItemCard(
                        productImage: context.knobs.string(
                            label: 'Image',
                            initialValue: 'https://picsum.photos/200/300'),
                        itemName: context.knobs.string(
                            label: 'Description',
                            initialValue: 'Sofa set for sale'),
                        itemPrice: context.knobs
                            .string(label: 'Price', initialValue: ' 5000'),
                        location: context.knobs.string(
                            label: 'Location', initialValue: 'Bangalore'),
                        date: context.knobs
                            .string(label: 'Date', initialValue: 'Dec 27'),
                      ),
                    );
                  },
                ),
                WidgetbookUseCase(
                  name: 'Seller Details Card',
                  builder: (context) {
                    return const Padding(
                      padding: EdgeInsets.all(8),
                      child: SellerDetailsCard(
                          sellerName: 'Pradeep Kumar AR',
                          sellerDesignation: 'Team Member - Engine Machining',
                          phoneNumber: '+91 9876543210',
                          emailId: 'pradeep.ar@gmail.com',
                          location: 'Chennai, Tamil Nadu'),
                    );
                  },
                ),
                WidgetbookUseCase(
                    name: 'Image Carousal',
                    builder: (context) {
                      return const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: ImageCarouselLayout(
                          images: [
                            'https://images.unsplash.com/photo-1621009063622-4467e453c3c1?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8ZWxlY3Ryb25pY3xlbnwwfHwwfHx8MA%3D%3D',
                            'https://images.unsplash.com/photo-1492140260770-41aec2341f6f?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fGVsZWN0cm9uaWN8ZW58MHx8MHx8fDA%3D',
                            'https://images.unsplash.com/photo-1527814050087-3793815479db?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjR8fGVsZWN0cm9uaWN8ZW58MHx8MHx8fDA%3D',
                            'https://images.unsplash.com/photo-1610680509231-08f1f08084d1?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NTh8fGVsZWN0cm9uaWN8ZW58MHx8MHx8fDA%3D',
                          ],
                        ),
                      );
                    })
              ],
            ),
            WidgetbookComponent(
              name: 'Charts',
              useCases: [
                WidgetbookUseCase(
                  name: 'Bar Chart',
                  builder: (context) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          StackedBarChartWidget(
                            dates: List.generate(
                                7,
                                (index) =>
                                    DateTime.now().add(Duration(days: index))),
                            hoursData: const [
                              [
                                5.0,
                                3.0
                              ], // Day 1: Project A: 5hrs, Project B: 3hrs
                              [
                                6.5,
                                1.5
                              ], // Day 2: Project A: 6.5hrs, Project B: 1.5hrs
                              [
                                4.0,
                                2.0,
                                2.0
                              ], // Day 3: Project A: 4hrs, Project B: 2hrs, Project C: 2hrs
                              [
                                7.0,
                                1.0
                              ], // Day 4: Project A: 7hrs, Project B: 1hr
                              [8.0], // Day 5: Project A: 8hrs
                              [
                                3.0,
                                2.0,
                                1.0
                              ], // Day 6: Project A: 3hrs, Project B: 2hrs, Project C: 1hr
                              [
                                2.0,
                                1.0
                              ], // Day 7: Project A: 2hrs, Project B: 1hr
                            ],
                            projects: const [
                              'Project A',
                              'Project B',
                              'Project C'
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'File Picker',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default',
                  builder: (context) => const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: FilePickerWidget(
                      allowedExtensions: [
                        'png',
                        'svg',
                        'jpeg',
                        'jpg',
                      ], // Allowed file types
                      dialogTitle: "Upload a file",
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Footer',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default',
                  builder: (context) => const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Footer(
                      itemList: ["Help", "Feedback", "Release Note"],
                      logo: "assets/logo/logo_tarento.svg",
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Secondary Tag',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default',
                  builder: (context) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SecondaryTag(
                      text: context.knobs
                          .string(label: "text", initialValue: "Trending"),
                      color: context.knobs
                          .color(label: "Color", initialValue: Colors.orange),
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'News Primary Card',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default',
                  builder: (context) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: NewsPrimaryCard(
                      imageUrl: context.knobs.string(
                          label: "Image URL",
                          initialValue:
                              "https://s3-alpha-sig.figma.com/img/d52b/d667/12be549f6a93a5d263d866a0dc8a48da?Expires=1730073600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=AktU8700FSmy1TrkBPJishvJvj0cKudcdwtgP50R-rDBV6XQs18LfsjSXD8TMC9Zq63DbNkeu-Vj8H4TtGXNzPiPfPKqPaRkct3dq~BYptlAI9SZZWvSuqYCm0RezOKYyqcZDHEzg19maqK1c3H31iGocpWV0ufTcURgrd9HUEUN9FHSyQsq05AQhpWTyyGHZdEnuTSmoOLjudEVkBpcm8G5~Je7RI-DD4e0vsIL31WVlSFsBjcQ3ixKYPF94x2-FQfiumL-Uo60fqhCrOaB4GV9S0vqh8KKQ73zGqIFkuTCZmd9FiuGF4tHxtgXWrVQ0y7Q-fCXGNrnYymYW8FuXQ__"),
                      tag: context.knobs
                          .string(label: "Tag", initialValue: "Trending"),
                      title: context.knobs.string(
                          label: "Title",
                          initialValue:
                              "Share price of Ashok Leyland jumps as Sensex gains 820.36 points."),
                      subTitle: context.knobs.string(
                          label: "Subtitle",
                          initialValue:
                              "The share price of Ashok Leyland Ltd. gained 3.0 percent to Rs 253.7 at 10:05 AM (IST) in Friday's trade. The stock has hit a high of Rs 254.6 and a low of Rs 250.2 during the session. This upward movement reflects positive market sentiment following the company’s recent quarterly earnings report, which exceeded analyst expectations."),
                      time: context.knobs
                          .string(label: "Time", initialValue: "2"),
                      tagStatus: context.knobs
                          .boolean(label: "Tag Status", initialValue: true),
                      onTap: () => print("Clicked"),
                      isSecondary: context.knobs
                          .boolean(label: "Is Secondary", initialValue: false),
                    ),
                  ),
                ),
                WidgetbookUseCase(
                  name: 'Secondary',
                  builder: (context) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: NewsPrimaryCard(
                      imageUrl: context.knobs.string(
                          label: "Image URL",
                          initialValue:
                              "https://s3-alpha-sig.figma.com/img/b4a2/b5da/4292e220abd886910ddfd8f425b03d2b?Expires=1730073600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=jd1dqDUodlwJ~IuMtQo6rxr1f~yMVJabx1YH2oF1xSMZFFOETQVQ3wDgp9rR14NbMa6Xor8kplJuphI6ZV6-gIMSfnv7PgRsxqU~7rPTYzax-lE8YPcBU-90mu6LQgT93AdBzUNYLI~O~gA23dly3ybPCwIo09G2rGXsjUgizCNPLssTfHN7iYHD8d10mB1bmT438c1wghPZU8nq51GnNu2g0FBdUrt7o7f1nO1ORUo7bv7QRtlBIt3Nadrq5ldCygm3Lc2kZDLVIDKCad0fyU6tMI9~djlS4fIGZnoNrSeNqME1cxT4dscwTbI5GaaY2k8Xhn5oAuzL3tDq~QWTzA__"),
                      tag: context.knobs
                          .string(label: "Tag", initialValue: "Trending"),
                      title: context.knobs.string(
                          label: "Title",
                          initialValue:
                              "​Reassuring resolve: On the RBI’s Monetary Policy Committee’s move."),
                      subTitle: context.knobs.string(
                          label: "Subtitle",
                          initialValue:
                              "The RBI’s Monetary Policy Committee (MPC) has for a ninth straight meeting chosen to keep the benchmark interest rate unchanged at 6.50%. This decision aims to support economic growth while addressing inflationary pressures. The MPC emphasized its commitment to maintaining price stability and indicated that it would remain vigilant regarding global economic conditions, domestic inflation trends, and growth prospects. As a result, the central bank is closely monitoring various indicators, including food and energy prices, to ensure the economy's resilience amidst fluctuating external factors."),
                      time: context.knobs
                          .string(label: "Time", initialValue: "12"),
                      tagStatus: context.knobs
                          .boolean(label: "Tag Status", initialValue: false),
                      onTap: () => print("Clicked"),
                      isSecondary: context.knobs
                          .boolean(label: "Is Secondary", initialValue: true),
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(name: 'News Page', useCases: [
              WidgetbookUseCase(
                  name: 'News Details Card',
                  builder: (context) {
                    final cardTitle = context.knobs.string(
                        label: 'Card Title',
                        initialValue:
                            'Share price of Ashok Leyland jumps as Sensex gains 820.36 points.');
                    final imageUrl = context.knobs.string(
                        label: 'Image Url',
                        initialValue:
                            'https://s3-alpha-sig.figma.com/img/d52b/d667/12be549f6a93a5d263d866a0dc8a48da?Expires=1731283200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=k-7S8m89e42o5FYu~PaupGjon0SxD4JHU2HlqR5LKkIJ1NTzEepG3osF~p9h~KF9O743npXkHQHHjTkWai3NP9smAwn7XdkW~FjWgFOeETrcua9qsLvQ-zeDSVXmsfy3NeJWRepUgCKRif9CvUOVw~OJsGfkHuJkTjgdONGRiST-pGMFyexH7pXXJY1fbDWGJQLE6Zr4HP9V8iI66XRSxgYq9icBDd3ZOlt5KpqTNfWHwTuRIWhgCnZ5hH3a6jT53dkgDmoiW-r6pDHhxscK4eknK1ikY8lrrSB4QIkieqNEQ-Sv6170xGM57HMvVmzFdBD4GPsFUndsJRtTRtL4hQ__');
                    final timeData = context.knobs.string(
                        label: 'Time data', initialValue: '2 Hours ago');
                    final description = context.knobs.string(
                        label: 'Card Description',
                        initialValue:
                            'Shares of Ashok Leyland Ltd. traded 3.0 per cent up at Rs 253.7 at 10:05AM (IST) on Friday, even as BSE benchmark Sensex gained 820.36 points to 79706.58. The scrip had settled at Rs 246.3 in the previous session. The stock quoted a 52-week high and 52-week low of Rs 258.95 and Rs 157.65, respectively. As per BSE data, total traded volume on the counter till 10:05AM (IST) stood at 10:05AM shares with turnover at Rs 8.41 crore. Shares of Ashok Leyland Ltd. traded 3.0 per cent up at Rs 253.7 at 10:05AM (IST) on Friday, even as BSE benchmark Sensex gained 820.36 points to 79706.58. The scrip had settled at Rs 246.3 in the previous session. The stock quoted a 52-week high and 52-week low of Rs 258.95 and Rs 157.65, respectively. As per BSE data, total traded volume on the counter till 10:05AM (IST) stood at 10:05AM shares with turnover at Rs 8.41 crore. Shareholding Details Promoters held 51.52 per cent stake in the company as of 30-Jun-2024, while FIIs owned 22.03 per cent and DIIs 14.04 per cent.');
                    return Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: NewsDetailsCard(
                        cardTitle: cardTitle,
                        imageUrl: imageUrl,
                        timeData: timeData,
                        description: description,
                        onPress: () {},
                      ),
                    );
                  })
            ]),
            WidgetbookComponent(
              name: 'Notification Card',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default',
                  builder: (context) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: NotificationCard(
                      imageUrl: context.knobs.string(
                          label: "Image URL",
                          initialValue:
                              "https://s3-alpha-sig.figma.com/img/3d5c/b72f/ae1e058c2ed75ab981a9f8bb62e96a13?Expires=1730073600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=dbLyrRW6hCFFhkRZk24akx4f3i-z~sVJ2iQdPBWq5aGIWPhobIXDOKQUmWwgCj3Ono7AiHp7eGkGeCihErHGNtS1Tfu3qCQli8QR7XnVQ65dapxmNz2htDGaMObyJOJ5IggWbqfmMnVHJJKAZanrYTnsqjuviFIEkD6vSbv8Bm5ZocuDoZoI0ByBwJ73CrfRdjA-BlGz8pXKZ1nntwlSROYk9ZP~dTCPRiXhryLqpTAE9GkJIE2M0pmcT9RC1zjTHO~zQPT-d1hl3mSfMe0yyT1c3ia1PC9diMmdPYR2TUTQTZh8YPvINirIkRPQ3OJstLWUVDPuupbao~YbBPES5g__"),
                      title: context.knobs.string(
                        label: "text",
                        initialValue:
                            "Muneer assigned a task to you Concept Design.",
                      ),
                      time: context.knobs.string(
                        label: "Time",
                        initialValue: "2", // Fixed the syntax error
                      ),
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Notification Box',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default',
                  builder: (context) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: NotificationBox(
                      heading: context.knobs.string(
                          label: "Heading", initialValue: "Notifications"),
                      rightText: context.knobs.string(
                          label: "Right Text",
                          initialValue: "Mark all as read"),
                      markAsRead: () => {print("mark as read")},
                      isYesterday: context.knobs.booleanOrNull(
                          label: "Is Yesterday", initialValue: true),
                      notifications: [
                        NotificationData(
                          imageUrl:
                              "https://s3-alpha-sig.figma.com/img/3d5c/b72f/ae1e058c2ed75ab981a9f8bb62e96a13?Expires=1730073600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=dbLyrRW6hCFFhkRZk24akx4f3i-z~sVJ2iQdPBWq5aGIWPhobIXDOKQUmWwgCj3Ono7AiHp7eGkGeCihErHGNtS1Tfu3qCQli8QR7XnVQ65dapxmNz2htDGaMObyJOJ5IggWbqfmMnVHJJKAZanrYTnsqjuviFIEkD6vSbv8Bm5ZocuDoZoI0ByBwJ73CrfRdjA-BlGz8pXKZ1nntwlSROYk9ZP~dTCPRiXhryLqpTAE9GkJIE2M0pmcT9RC1zjTHO~zQPT-d1hl3mSfMe0yyT1c3ia1PC9diMmdPYR2TUTQTZh8YPvINirIkRPQ3OJstLWUVDPuupbao~YbBPES5g__",
                          title:
                              "Muneer assigned a task to you Concept Design.",
                          time: "2",
                        ),
                        NotificationData(
                          imageUrl:
                              "https://s3-alpha-sig.figma.com/img/3d5c/b72f/ae1e058c2ed75ab981a9f8bb62e96a13?Expires=1730073600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=dbLyrRW6hCFFhkRZk24akx4f3i-z~sVJ2iQdPBWq5aGIWPhobIXDOKQUmWwgCj3Ono7AiHp7eGkGeCihErHGNtS1Tfu3qCQli8QR7XnVQ65dapxmNz2htDGaMObyJOJ5IggWbqfmMnVHJJKAZanrYTnsqjuviFIEkD6vSbv8Bm5ZocuDoZoI0ByBwJ73CrfRdjA-BlGz8pXKZ1nntwlSROYk9ZP~dTCPRiXhryLqpTAE9GkJIE2M0pmcT9RC1zjTHO~zQPT-d1hl3mSfMe0yyT1c3ia1PC9diMmdPYR2TUTQTZh8YPvINirIkRPQ3OJstLWUVDPuupbao~YbBPES5g__",
                          title: "John commented on your post.",
                          time: "5",
                        ),
                      ],
                      yesterdayNotifications: [
                        NotificationData(
                          imageUrl:
                              "https://s3-alpha-sig.figma.com/img/a567/1107/c7523f99d4632b2eaa93a8364b095ad5?Expires=1730073600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=ILAtU63Xe2zmZsbF8UrKEOUL~zVdT1lGXH4jTqEeNk8sp1u5FR2Ep9GbLdTRLqlTNV0u30J9BdfoNMZSR8wKMiK5379fMrUcJyxO7kM-eH8nlbdxcxHeBYpi0-wzybr-38dxgw0u9ZJVtoagozkuTBGeJ24I23SFki~RxkAXepFffZMxe4lspCTxCvsMjhRAenJqSHtGmfky6UDuXIG-TYd1QfEMCZjaKdA6GE767kXUznk0w~RuK0Ukuivx7CpR4NHUoXikWEY8tjm~6X3KeAY~NRL5pcSkTM2y~V-sh~54-QqbwAZrzZCBzu2esta6503oN9o~DUVbYGYKGegk3g__",
                          title:
                              "HR has added a new record in Award and Voucher Distribution form.",
                          time: "2",
                        ),
                        NotificationData(
                          imageUrl:
                              "https://s3-alpha-sig.figma.com/img/ce45/a896/d958cf406bb83c3c0a93e2f03fcb0bef?Expires=1730073600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=H3hCTWNhu9anpCCdTSdayZG7HsvZtZkn5MI16u35SMqOwTv~tLBV7zrsTZY3ctA5bD6zUz0Riig6pBMUGwzc-uiz2izIOcSXLYzGcxerdm5xQEFG7oB~LhCh9jYN3iUJiw4M0TdcJI656s~RlbS13MTqlQfBwZ7-LBy6UjjjbphcyQ7ucsURbLf54WsWykkHv8DhZLKS~fLITk5hYvDjwwNyqFOe7TnR~TA0bc6tFo8WlzVA2oBBmGcN8MhSr4NZSzfhkqpmj9D5Xf-GrDZ0nvJ2ejqrPKFzRe8zm2xqi-5Pn0gdz~k3Kn9kFf3RKfHajHHj7vgf0ao6H9P0MHu1oQ__",
                          title:
                              "Harshit Rao has approved a record in Leave form.",
                          time: "5",
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Tag',
              useCases: [
                WidgetbookUseCase(
                  name: 'Dynamic Configuration',
                  builder: (context) {
                    return Tag(
                      text: context.knobs.string(
                        label: 'Tag Text',
                        description: 'Enter the text for the tag',
                        initialValue: 'Sample Tag',
                      ),
                      color: context.knobs.color(
                        label: 'Tag Color',
                        description: 'Select a color for the tag',
                        initialValue: AppColors.neutralGray,
                      ),
                    );
                  },
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'StarRating',
              useCases: [
                WidgetbookUseCase(
                  name: 'Star Rating',
                  builder: (context) {
                    final String starCount = context.knobs
                        .string(label: 'Star Count', initialValue: '5');
                    final String starSize = context.knobs.string(
                      label: 'Star Size',
                      initialValue: '32',
                    );
                    final String spaceBetweenStars = context.knobs.string(
                      label: 'Space Between Stars',
                      initialValue: '4',
                    );
                    return ProviderScope(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: StarRating(
                          id: 'custom-star',
                          starCount: int.tryParse(starCount) ?? 1,
                          starSize: double.tryParse(starSize) ?? 16.0,
                          spaceBetweenStars:
                              double.tryParse(spaceBetweenStars) ?? 16.0,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'StarRatingWithLabel',
              useCases: [
                WidgetbookUseCase(
                  name: 'Star Rating With Label',
                  builder: (context) {
                    final String starCount = context.knobs
                        .string(label: 'Star Count', initialValue: '5');
                    final String starSize = context.knobs
                        .string(label: 'Star Size', initialValue: '16');
                    final String spaceBetweenStars = context.knobs.string(
                        label: 'Space Between Stars', initialValue: '32');
                    final String textSize = context.knobs
                        .string(label: 'Text Size', initialValue: '16');
                    final String spaceBetweenStarsAndLabel = context.knobs
                        .string(
                            label: 'Space Between Stars and Label',
                            initialValue: '16');

                    return ProviderScope(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: StarRatingWithLabel(
                          id: 'custom-star-label',
                          starCount: int.tryParse(starCount) ?? 5,
                          starSize: double.tryParse(starSize) ?? 16.0,
                          spaceBetweenStars:
                              double.tryParse(spaceBetweenStars) ?? 32.0,
                          textSize: double.tryParse(textSize) ?? 16.0,
                          spaceBetweenStarsAndLabel:
                              double.tryParse(spaceBetweenStarsAndLabel) ??
                                  16.0,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'RatingWidget',
              useCases: [
                WidgetbookUseCase(
                  name: 'Rating Widget Example',
                  builder: (context) {
                    final String label = context.knobs.string(
                        label: 'Label', initialValue: 'Client interaction');
                    final String starCount = context.knobs
                        .string(label: 'Star Count', initialValue: '5');
                    final String starSize = context.knobs
                        .string(label: 'Star Size', initialValue: '24');
                    final String spaceBetweenStars = context.knobs.string(
                        label: 'Space Between Stars', initialValue: '8');
                    final String textSize = context.knobs
                        .string(label: 'Text Size', initialValue: '18');
                    final String spaceBetweenStarsAndLabel = context.knobs
                        .string(
                            label: 'Space Between Stars and Label',
                            initialValue: '8');

                    return ProviderScope(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RatingWidget(
                          label: label,
                          id: 'custom-rating-widget',
                          starCount: int.tryParse(starCount) ?? 5,
                          starSize: double.tryParse(starSize) ?? 24.0,
                          spaceBetweenStars:
                              double.tryParse(spaceBetweenStars) ?? 8.0,
                          textSize: double.tryParse(textSize) ?? 18.0,
                          spaceBetweenStarsAndLabel:
                              double.tryParse(spaceBetweenStarsAndLabel) ?? 8.0,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Awards Card',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default',
                  builder: (context) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AwardCard(
                      extraImageUrl: context.knobs.string(
                        label: 'Extra Image URL',
                        initialValue: 'assets/images/Banner.png',
                      ),
                      description: context.knobs.string(
                        label: 'Description',
                        initialValue:
                            'Thank you for helping in inspire project',
                      ),
                      profileUrl: context.knobs.string(
                        label: 'Profile URL',
                        initialValue: '',
                      ),
                      profileName: context.knobs.string(
                        label: 'Profile Name',
                        initialValue: 'John',
                      ),
                      awardedBy: context.knobs.string(
                        label: 'Awarded By',
                        initialValue: 'Tarento',
                      ),
                      date: context.knobs.string(
                        label: 'Date',
                        initialValue: '12/12/2012',
                      ),
                      title: context.knobs.string(
                        label: 'Title',
                        initialValue: 'Awesome addition to team',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(name: 'Awards layout', useCases: [
              WidgetbookUseCase(
                  name: 'Awards Layouts',
                  builder: (context) {
                    return const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: AwardsLayout(),
                    );
                  })
            ])
          ],
        ),
        WidgetbookFolder(
          name: 'Style Guide',
          children: [
            WidgetbookComponent(
              name: 'Typography',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default',
                  builder: (context) => const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TypographyGuide(),
                  ),
                ),
              ],
            ),
            WidgetbookComponent(
              name: 'Colors',
              useCases: [
                WidgetbookUseCase(
                  name: 'Default',
                  builder: (context) => const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ColorGuide(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        WidgetbookFolder(name: 'Layouts', children: [
          WidgetbookFolder(name: 'Dashboard', children: [
            WidgetbookComponent(name: 'Apps Layout', useCases: [
              WidgetbookUseCase(
                name: 'Default',
                builder: (context) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AppsLayout(
                      title: "Apps",
                      buttonLabel: "View All",
                      appsData: [
                        AppCardData(
                            title: 'Time reporting',
                            icon: Icons.timer_outlined,
                            isPinned: true),
                        AppCardData(
                            title: 'People',
                            icon: Icons.people_outline,
                            isPinned: true),
                        AppCardData(
                            title: 'Projects', icon: Icons.folder_outlined),
                        AppCardData(
                            title: 'Trainings', icon: Icons.school_outlined),
                        AppCardData(
                            title: 'Awards', icon: Icons.emoji_events_outlined),
                        AppCardData(
                            title: 'Skills', icon: Icons.psychology_outlined),
                      ],
                    )),
              ),
            ]),
            WidgetbookComponent(name: 'Actions Layout', useCases: [
              WidgetbookUseCase(
                name: 'Default',
                builder: (context) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ActionsLayout(
                      title: 'Actions',
                      buttonLabel: 'View all',
                      actionCardItems: [
                        ActionCardItems(
                          title: 'No time was reported yesterday',
                          description:
                              'A non-compliance is reported against you by the system.',
                          date: DateTime(2024, 4, 21),
                          bgColor: AppColors.coralRed,
                        ),
                        ActionCardItems(
                          title: 'Time report reminder',
                          description:
                              'Report your time before 5:00 pm everyday.',
                          date: DateTime(2024, 4, 22),
                          bgColor: AppColors.brandBlue,
                        ),
                        ActionCardItems(
                          title: 'iGOT Karmayogi - Product check in',
                          description: 'Reminder',
                          date: DateTime(2024, 4, 23),
                          bgColor: AppColors.brandBlue,
                        ),
                      ],
                    )),
              ),
            ]),
            WidgetbookComponent(name: 'Insights Layout', useCases: [
              WidgetbookUseCase(
                name: 'Default',
                builder: (context) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InsightsLayout(
                      title: "Insights: This week's time reporting",
                      dates: List.generate(
                        7,
                        (index) => DateTime.now().add(Duration(days: index)),
                      ),
                      hoursData: const [
                        [5.0, 3.0],
                        [6.5, 1.5],
                        [4.0, 2.0, 2.0],
                        [7.0, 1.0],
                        [8.0],
                        [3.0, 2.0, 1.0],
                        [2.0, 1.0],
                      ],
                      projects: const ['Project A', 'Project B', 'Project C'],
                    )),
              ),
            ]),
            WidgetbookComponent(name: 'Calendar Layout', useCases: [
              WidgetbookUseCase(
                name: 'Default',
                builder: (context) => const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CalendarLayout(
                      title: 'Calendar: 2 events today',
                      buttonLabel: 'View on planner',
                    )),
              ),
            ]),
            WidgetbookComponent(name: 'Feeds Layout', useCases: [
              WidgetbookUseCase(
                name: 'Default',
                builder: (context) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FeedsLayout(
                      title: 'Feeds from today',
                      buttonLabel: 'View all',
                      events: [
                        FeedEvent(
                          profileImage:
                              'https://thumbs.dreamstime.com/b/default-avatar-profile-icon-vector-social-media-user-image-182145777.jpg',
                          name: 'HR',
                          lastSeen: 120,
                          isPrimary: false,
                          heading: 'Event 1 Heading',
                          date: DateTime(2024, 04, 21),
                          buttonText: 'Join Event',
                          startTime: DateTime(2024, 04, 21, 14),
                          endTime: DateTime(2024, 04, 21, 16),
                          postImage: '/assets/images/feeds.png',
                        ),
                      ],
                    )),
              ),
            ]),
          ])
        ]),
      ],
      addons: [
        ThemeAddon(
          themes: [
            WidgetbookTheme(name: 'Light', data: lightTheme),
            WidgetbookTheme(name: 'Dark', data: darkTheme),
          ],
          themeBuilder: (context, theme, child) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (theme == lightTheme) {
                currentTheme.setTheme(AppTheme.light);
              } else if (theme == darkTheme) {
                currentTheme.setTheme(AppTheme.dark);
              }
            });

            final previewBackgroundColor =
                theme == lightTheme ? Colors.white : Colors.grey[900];
            return Theme(
              data: theme,
              child: Container(
                color: previewBackgroundColor,
                child: child,
              ),
            );
          },
        ),
        InspectorAddon(),
        DeviceFrameAddon(
          devices: [
            Devices.ios.iPad,
            Devices.ios.iPhone12ProMax,
            Devices.android.onePlus8Pro,
            Devices.android.samsungGalaxyA50
          ],
        ),
      ],
    );
  }
}
