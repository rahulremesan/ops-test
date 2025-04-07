import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';
import 'package:styria_flutter_web/layouts/people/people_card.dart';

class PeopleCardLayout extends ConsumerWidget {
  PeopleCardLayout({super.key});

  // Sample data
  final List<PeopleCard> peopleDetail = [
    const PeopleCard(
      name: 'Abish Robinson',
      email: 'abish.robinson@tarento.com',
      phone: '+91 8971991100',
      designation: 'Senior consultant',
      department: 'Microsoft enterprise',
    ),
    const PeopleCard(
      name: 'Abish Robinson',
      email: 'abish.robinson@tarento.com',
      phone: '+91 8971991100',
      designation: 'Senior consultant',
      department: 'Microsoft enterprise',
    ),
    const PeopleCard(
      name: 'Abish Robinson',
      email: 'abish.robinson@tarento.com',
      phone: '+91 8971991100',
      designation: 'Senior consultant',
      department: 'Microsoft enterprise',
    ),
    const PeopleCard(
      name: 'Abish Robinson',
      email: 'abish.robinson@tarento.com',
      phone: '+91 8971991100',
      designation: 'Senior consultant',
      department: 'Microsoft enterprise',
    ),
    const PeopleCard(
      name: 'Abish Robinson',
      email: 'abish.robinson@tarento.com',
      phone: '+91 8971991100',
      designation: 'Senior consultant',
      department: 'Microsoft enterprise',
    ),
    const PeopleCard(
      name: 'Abish Robinson',
      email: 'abish.robinson@tarento.com',
      phone: '+91 8971991100',
      designation: 'Senior consultant',
      department: 'Microsoft enterprise',
    ),
    const PeopleCard(
      name: 'Abish Robinson',
      email: 'abish.robinson@tarento.com',
      phone: '+91 8971991100',
      designation: 'Senior consultant',
      department: 'Microsoft enterprise',
    ),
    const PeopleCard(
      name: 'Abish Robinson',
      email: 'abish.robinson@tarento.com',
      phone: '+91 8971991100',
      designation: 'Senior consultant',
      department: 'Microsoft enterprise',
    ),
    const PeopleCard(
      name: 'Abish Robinson',
      email: 'abish.robinson@tarento.com',
      phone: '+91 8971991100',
      designation: 'Senior consultant',
      department: 'Microsoft enterprise',
    ),
    const PeopleCard(
      name: 'Abish Robinson',
      email: 'abish.robinson@tarento.com',
      phone: '+91 8971991100',
      designation: 'Senior consultant',
      department: 'Microsoft enterprise',
    ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final customTypography = Theme.of(context).extension<CustomTypography>() ??
    //     CustomTypography.light;

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
            Wrap(
              spacing: 20,
              runSpacing: 20,
              children: peopleDetail.map((person) {
                return SizedBox(
                  width: (constraints.maxWidth - (columns - 1) * 20) / columns,
                  child: GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      child: PeopleCard(
                        name: person.name,
                        email: person.email,
                        phone: person.phone,
                        designation: person.designation,
                        department: person.department,
                      ),
                    ),
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
