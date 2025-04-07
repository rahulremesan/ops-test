import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styria_flutter_web/design_system/atoms/cards/project_deadline_card.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class ProjectList extends ConsumerWidget {
  final List<ProjectDeadlineCard> projectList;

  const ProjectList({super.key, 
    required this.projectList
  });


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.only(top: 16),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8)
    ),  
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Projects',
            style: TextStyle(
              fontSize: customTypography.body2Medium.fontSize, 
              fontWeight: customTypography.body2Medium.fontWeight,
              color: AppColors.lacqueredLiquorice
            ),          
          ),  
          const SizedBox(height: 20,),         
          ...projectList.map((project){
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: ProjectDeadlineCard(
                    projectName: project.projectName,
                    startDate: project.startDate,
                    endDate: project.endDate,
                  ),
          );
        }).toList(),
        ]
        ),
    ),
  );
  }
}