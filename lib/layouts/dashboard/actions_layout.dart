import 'package:flutter/material.dart';
import 'package:styria_flutter_web/design_system/atoms/buttons/secondary_button.dart';
import 'package:styria_flutter_web/design_system/molecules/fields/dashboard_actions_field.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class ActionCardItems {
  final String title;
  final String description;
  final DateTime date;
  final Color bgColor;

  ActionCardItems({
    required this.title,
    required this.description,
    required this.date,
    required this.bgColor,
  });
}

class ActionsLayout extends StatelessWidget {
  final String title;
  final String buttonLabel;
  final List<ActionCardItems> actionCardItems;

  const ActionsLayout({
    super.key,
    required this.title,
    required this.buttonLabel,
    required this.actionCardItems,
  });

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: customTypography.h5Bold.fontFamily,
                  fontSize: customTypography.h5Bold.fontSize,
                  fontWeight: customTypography.h5Bold.fontWeight,
                ),
              ),
              SecondaryButton(
                buttonText: buttonLabel,
                onPressed: () {},
              )
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: actionCardItems.map((action) {
                  return Column(
                    children: [
                      DashboardActionsField(
                        bgColor: action.bgColor,
                        date: action.date,
                        title: action.title,
                        description: action.description,
                      ),
                      const SizedBox(height: 16),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
