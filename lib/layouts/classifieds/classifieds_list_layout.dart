import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:styria_flutter_web/constants/route_constants.dart';
import 'package:styria_flutter_web/design_system/atoms/breadcrumbs/page_breadcrumbs.dart';
import 'package:styria_flutter_web/design_system/atoms/buttons/primary_button.dart';
import 'package:styria_flutter_web/design_system/atoms/inputs/primary_search_field.dart';
import 'package:styria_flutter_web/design_system/atoms/tabs/tabs.dart';
import 'package:styria_flutter_web/design_system/molecules/cards/filter_card.dart';
import 'package:styria_flutter_web/design_system/organisms/cards/classifieds_item_card.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';
import 'package:styria_flutter_web/layouts/classifieds/create_ad_layout.dart';
import 'package:styria_flutter_web/shared/providers/classifieds_provider.dart';
import 'package:styria_flutter_web/shared/providers/mobile_provider.dart';

class ClassifiedsListLayout extends ConsumerStatefulWidget {
  bool showBreadcrumbs;
  ClassifiedsListLayout({super.key, this.showBreadcrumbs = true});

  @override
  ConsumerState<ClassifiedsListLayout> createState() =>
      _ClassifiedsListLayoutState();
}

class _ClassifiedsListLayoutState extends ConsumerState<ClassifiedsListLayout> {
  String _searchQuery = '';
  List<Classifieds> _filteredClassifieds = [];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchData();
    });
  }

  void _fetchData() async {
    final provider = ref.read(classifiedsProvider);
    await provider.fetchClassifieds();
    await provider.fetchCategories();
    setState(() {
      _filteredClassifieds = provider.classifieds;
    });
  }

  void _onSearchChanged(String query) {
    setState(() {
      _searchQuery = query;
      _filteredClassifieds =
          ref.read(classifiedsProvider).classifieds.where((classified) {
        final lowerQuery = _searchQuery.toLowerCase();
        return classified.title.toLowerCase().contains(lowerQuery) ||
            classified.description.toLowerCase().contains(lowerQuery) ||
            classified.category.toLowerCase().contains(lowerQuery);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    final provider = ref.watch(classifiedsProvider);
    final screenWidth = MediaQuery.of(context).size.width;
    bool isMobile = ref.watch(isMobileProvider);

    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.showBreadcrumbs && !isMobile) ...[
            Align(
              alignment: Alignment.topLeft,
              child: PageBreadcrumbs(
                items: [
                  BreadcrumbData(
                    label: 'Apps',
                    link: AppRoute.apps,
                    isActive: true,
                  ),
                  BreadcrumbData(
                    label: 'Classifieds',
                    link: AppRoute.classifieds,
                    isActive: false,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
          ],
          Text(
            'Classifieds',
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
            child: Stack(children: [
              Column(
                children: [
                  Expanded(
                    child: Tabs(
                      tabTitles: [
                        'All (${_filteredClassifieds.length})',
                        'My Ads (${_filteredClassifieds.length})',
                      ],
                      tabViews: [
                        _buildAllClassifiedsTab(context, provider),
                        _buildMyBookmarksTab(context, provider),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                  top: 0,
                  right: 0,
                  child: Row(
                    children: [
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: screenWidth > 1100 ? 400 : 300,
                        ),
                        child: PrimarySearchField(
                          placeholder: 'Search here...',
                          filtering: false,
                          obscureText: false,
                          onChanged: _onSearchChanged,
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      PrimaryButton(
                        buttonText: 'Create Ad',
                        icon: Icons.add,
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: CreateAdLayout(),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ))
            ]),
          ),
        ],
      ),
    );
  }

  Widget _buildAllClassifiedsTab(
      BuildContext context, ClassifiedsProvider provider) {
    final screenWidth = MediaQuery.of(context).size.width;

    String formatDate(DateTime date) {
      return DateFormat.MMMd().format(date);
    }

    if (provider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (provider.errorMessage != null) {
      return Center(child: Text(provider.errorMessage!));
    }
    return Padding(
      padding: const EdgeInsets.only(top: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: screenWidth > 1100 ? 3 : 1,
                  child: SingleChildScrollView(
                    child: Wrap(
                      spacing: 24,
                      runSpacing: 24,
                      children: _filteredClassifieds.map((classified) {
                        return ClassifiedsItemCard(
                          productImage: classified.imageUrl!,
                          itemPrice: classified.price.toString(),
                          itemName: classified.title,
                          location: classified.location,
                          date: formatDate(classified.createdOn),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 24,
                ),
                Expanded(
                  flex: 1,
                  child: FilterCard(
                    heading: 'Categories',
                    filterData: provider.categories,
                    onSelectionChanged:
                        (List<Map<String, dynamic>> selections) {},
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMyBookmarksTab(
      BuildContext context, ClassifiedsProvider provider) {
    final screenWidth = MediaQuery.of(context).size.width;

    String formatDate(DateTime date) {
      return DateFormat.MMMd().format(date);
    }

    if (provider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (provider.errorMessage != null) {
      return Center(child: Text(provider.errorMessage!));
    }
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: screenWidth > 1100 ? 3 : 1,
                    child: SingleChildScrollView(
                      child: Wrap(
                        spacing: 24,
                        runSpacing: 24,
                        children: _filteredClassifieds.map((classified) {
                          return ClassifiedsItemCard(
                            productImage: classified.imageUrl!,
                            itemPrice: classified.price.toString(),
                            itemName: classified.title,
                            location: classified.location,
                            date: formatDate(classified.createdOn),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  Expanded(
                    flex: 1,
                    child: FilterCard(
                      heading: 'Categories',
                      filterData: provider.categories,
                      onSelectionChanged:
                          (List<Map<String, dynamic>> selections) {},
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
