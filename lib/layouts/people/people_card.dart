import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:styria_flutter_web/constants/route_constants.dart';
import 'package:styria_flutter_web/design_system/atoms/buttons/tertiary_button.dart';
import 'package:styria_flutter_web/design_system/atoms/cards/icon_card.dart';
import 'package:styria_flutter_web/design_system/atoms/cards/user_card1.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class PeopleCard extends ConsumerWidget {
  final String name;
  final String? image;
  final String? email;
  final String? phone;
  final String? designation;
  final String? department;

  const PeopleCard(
      {super.key,
      required this.name,
      this.image,
      this.email,
      this.phone,
      this.designation,
      this.department});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserCard1(
            name: name,
            email: email,
            phone: phone,
          ),
          const SizedBox(
            height: 15,
          ),
          if (designation != null)
            IconCard(
              icon: Icons.work_outline,
              text: designation!,
              space: 20,
              iconColor: AppColors.antarctica,
              textStyle: TextStyle(
                fontSize: customTypography.body3Regular.fontSize,
                fontWeight: customTypography.body3Regular.fontWeight,
                color: AppColors.lacqueredLiquorice,
              ),
            ),
          const SizedBox(
            height: 10,
          ),
          if (department != null)
            IconCard(
              icon: Icons.device_hub_outlined,
              text: department!,
              space: 20,
              iconColor: AppColors.antarctica,
              textStyle: TextStyle(
                  fontSize: customTypography.body3Regular.fontSize,
                  fontWeight: customTypography.body3Regular.fontWeight,
                  color: AppColors.lacqueredLiquorice),
            ),
          const SizedBox(
            height: 15,
          ),
          const Divider(
            color: AppColors.beluga,
            height: 1,
          ),
          const SizedBox(
            height: 15,
          ),
          ListTile(
            leading: TertiaryButton(
                buttonText: 'View more',
                onPressed: () {
                  context.go(AppRoute.userDetails);
                }),
            trailing: const FaIcon(
              FontAwesomeIcons.linkedin,
              color: AppColors.luckyGrey,
            ),
            contentPadding: const EdgeInsets.all(0),
          )
        ],
      ),
    );
  }
}
