import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styria_flutter_web/design_system/molecules/forms/add_link.dart';
import 'package:styria_flutter_web/layouts/links/filter_layout.dart';
import 'package:styria_flutter_web/layouts/links/links_card_layout.dart';
import 'package:styria_flutter_web/layouts/links/top_layout.dart';
import 'package:styria_flutter_web/shared/providers/links_page_provider.dart';

class LinksMainLayout extends ConsumerWidget {
  final bool showBreadcrumbs;

  LinksMainLayout({
    super.key,
    this.showBreadcrumbs = true,
  });

  final List<FilterCardProps> filterdata = [
    FilterCardProps(
      heading: 'Categories',
      filterData: [
        {'title': 'All Categories', 'status': true},
        {'title': 'NXT', 'status': false},
        {'title': 'Digital', 'status': false},
        {'title': 'Enterprise Consultancy', 'status': false},
        {'title': 'Web Development', 'status': false},
        {'title': 'Mobile Apps', 'status': false},
      ],
      onSelectionChanged: (List<Map<String, dynamic>> selections) {
        print('Categories selections: $selections');
      },
    ),
    FilterCardProps(
      heading: 'Tags',
      filterData: [
        {'title': 'All Tags', 'status': true},
        {'title': 'Analytics', 'status': false},
        {'title': 'Business Intelligence (BI)', 'status': false},
        {'title': 'Cloud Computing', 'status': false},
        {'title': 'Machine Learning', 'status': false},
        {'title': 'DevOps', 'status': false},
      ],
      onSelectionChanged: (List<Map<String, dynamic>> selections) {
        print('Tags selections: $selections');
      },
    ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDialogOpen = ref.watch(dialogBoxState);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = screenWidth < 1000;

    if (isDialogOpen) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            final screenWidth = MediaQuery.of(context).size.width;

            return AlertDialog(
              backgroundColor: Colors.transparent,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
              content: SingleChildScrollView(
                child: Container(
                  width: isMobile ? screenWidth : screenWidth * 0.4,
                  padding: EdgeInsets.zero,
                  child: AddLink(
                    title: "Add a new link",
                    onAdd: (link, title, tags, privacy) {
                      print(
                          'Link added: $link, Title: $title, Tags: $tags, Privacy: $privacy');
                    },
                    onClear: () {
                      print('Fields cleared');
                    },
                    onClose: () {
                      ref.read(dialogBoxState.notifier).state = false;
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ),
            );
          },
        );
      });
    }

    return Padding(
      padding:
          EdgeInsets.fromLTRB(isMobile ? 20 : 40, 20, isMobile ? 20 : 40, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TopLayout(showBreadcrumbs: showBreadcrumbs),
          SizedBox(
            height: isMobile ? 20 : 0,
          ),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (screenWidth < 800) {
                  return Column(
                    children: [
                      Expanded(
                        child: FilterLayout(filterCardsProps: filterdata),
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        flex: 3,
                        child: SingleChildScrollView(
                          child: LinksCardLayout(),
                        ),
                      ),
                    ],
                  );
                } else {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          constraints: BoxConstraints(
                            maxHeight: screenHeight,
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                LinksCardLayout(),
                                const SizedBox(height: 30),
                                LinksCardLayout(),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        flex: 1,
                        child: FilterLayout(filterCardsProps: filterdata),
                      ),
                    ],
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
