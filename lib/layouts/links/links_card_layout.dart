import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styria_flutter_web/design_system/molecules/cards/link_card.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';
import 'package:styria_flutter_web/shared/providers/links_page_provider.dart';

class Link {
  final String? logo;
  final String? title;
  final String? link;
  final List<String>? tags;

  Link({this.logo, this.title, this.link, this.tags});
}

class LinksCardLayout extends ConsumerWidget {
  LinksCardLayout({super.key});

  // Sample data
  final List<Link> links = [
    Link(
      logo:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Microsoft_logo.svg/2048px-Microsoft_logo.svg.png',
      title: 'NXT Team Tracker - 2024.xlssj',
      link: ':x:/r/personal/jinesh_sumedhan_tarento_com...',
      tags: ["react", "java"],
    ),
    Link(
      logo: 'https://example.com/logo2.png',
      title: 'Link Title 2',
      link: 'https://example.com/2',
      tags: ['Tag3', 'Tag4'],
    ),
    Link(
      logo: 'https://example.com/logo1.png',
      title: 'Link Title 1',
      link: 'https://example.com/1',
      tags: ['Tag1', 'Tag2'],
    ),
    Link(
      logo: 'https://example.com/logo2.png',
      title: 'Link Title 2',
      link: 'https://example.com/2',
      tags: ['Tag3', 'Tag4'],
    ),
    Link(
      logo: 'https://example.com/logo1.png',
      title: 'Link Title 1',
      link: 'https://example.com/1',
      tags: ['Tag1', 'Tag2'],
    ),
    Link(
      logo: 'https://example.com/logo2.png',
      title: 'Link Title 2',
      link: 'https://example.com/2',
      tags: ['Tag3', 'Tag4'],
    ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;
    final isDialogOpen = ref.watch(dialogBoxState);

    return LayoutBuilder(
      builder: (context, constraints) {
        int columns;
        if (constraints.maxWidth < 600) {
          columns = 1;
        } else if (constraints.maxWidth < 900) {
          columns = 2;
        } else {
          columns = 3;
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Work",
                  style: TextStyle(
                    fontFamily: customTypography.body1Medium.fontFamily,
                    fontSize: customTypography.body1Medium.fontSize,
                    fontWeight: customTypography.body1Medium.fontWeight,
                  ),
                ),
                SizedBox(
                  width: 35,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_vert),
                    hoverColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 20,
              runSpacing: 20,
              children: links.map((link) {
                return SizedBox(
                  width: (constraints.maxWidth - (columns - 1) * 20) / columns,
                  child: LinkCard(
                    logo: link.logo,
                    title: link.title,
                    link: link.link,
                    tags: link.tags,
                    onEdit: () {
                      ref.read(dialogBoxState.notifier).state = !isDialogOpen;
                    },
                    onAddNew: () {},
                    onCardTap: () {},
                    url: "",
                    text: "",
                  ),
                );
              }).toList(),
            ),
          ],
        );
      },
    );
  }
}
