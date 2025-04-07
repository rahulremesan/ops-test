import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styria_flutter_web/design_system/atoms/rating_card.dart/rating_card.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class SkillList extends ConsumerWidget {
  final List<RatingWidget> skillList;

  const SkillList({super.key, 
    required this.skillList
  });


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.only(top: 16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8)
    ),
    padding: const EdgeInsets.all(16),        
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Skills',
            style: TextStyle(
              fontSize: customTypography.body2Medium.fontSize, 
              fontWeight: customTypography.body2Medium.fontWeight,
              color: AppColors.lacqueredLiquorice
            ),          
          ),  
          const SizedBox(height: 20,), 
          ...skillList.map((skill){
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: RatingWidget(label: skill.label, id: skill.id, textSize: 16,),
          );
        }).toList(),
        ]
        ),
    ),
  );
  }
}