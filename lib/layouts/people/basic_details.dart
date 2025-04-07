import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styria_flutter_web/design_system/atoms/cards/icon_card.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class BasicDetails extends ConsumerWidget {
  final String name;
  final String? image;
  final String? email;
  final String? phone;
  final String? designation;
  final String? department;
  final String? address;
  final int empId;
  final String? workLoc;
  final String dateOfJoining;
  final String? leavingOn;
  final String? careerStarted;
  final String? manager;
  final String? mentor;
  final List<String>? mentees;

  const BasicDetails({
    super.key,
    required this.name,
    this.image,
    this.email,
    this.phone,
    this.designation,
    this.department,
    this.address,
    required this.empId,
    this.workLoc,
    required this.dateOfJoining,
    this.leavingOn,
    this.careerStarted,
    this.manager,
    this.mentor,
    this.mentees
  });


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
    color: AppColors.snowFlake,    
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text('Contact details',
                  style: TextStyle(
                    fontSize: customTypography.body2Medium.fontSize,
                    fontWeight: customTypography.body2Medium.fontWeight,
                    color: AppColors.lacqueredLiquorice
                  ),
                ),
                const SizedBox(height: 15,),
                IconCard(icon: Icons.message_outlined, text: email != null ? email! : 'NA', iconColor: AppColors.antarctica, iconSize: 15, space: 20, textStyle: TextStyle(fontSize: customTypography.body3Regular.fontSize, fontWeight: customTypography.body3Regular.fontWeight, color: AppColors.lacqueredLiquorice),),
                const SizedBox(height: 15,),
                IconCard(icon: Icons.call_outlined, text: phone!= null ? phone! : 'NA', iconColor: AppColors.antarctica, iconSize: 15, space: 20, textStyle: TextStyle(fontSize: customTypography.body3Regular.fontSize, fontWeight: customTypography.body3Regular.fontWeight, color: AppColors.lacqueredLiquorice),),
                const SizedBox(height: 15,),
                IconCard(icon: Icons.location_on_outlined, text: address!=null ? phone! : 'NA', iconColor: AppColors.antarctica, iconSize: 15, space: 20, textStyle: TextStyle(fontSize: customTypography.body3Regular.fontSize, fontWeight: customTypography.body3Regular.fontWeight, color: AppColors.lacqueredLiquorice),),              
              ],
            ),
          ),
          const SizedBox(height: 16,),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Profesional details',
                  style: TextStyle(
                    fontSize: customTypography.body2Medium.fontSize,
                    fontWeight: customTypography.body2Medium.fontWeight,
                    color: AppColors.lacqueredLiquorice
                  ),
                ),
                const SizedBox(height: 20,),
                IconCard(icon: Icons.group, text: department!= null ? department! : 'NA', iconColor: AppColors.antarctica, iconSize: 15, space: 20, textStyle: TextStyle(fontSize: customTypography.body3Regular.fontSize, fontWeight: customTypography.body3Regular.fontWeight, color: AppColors.lacqueredLiquorice),),
                const SizedBox(height: 15,),
                IconCard(icon: Icons.person_outline, text: empId.toString(), iconColor: AppColors.antarctica, iconSize: 15, space: 20, textStyle: TextStyle(fontSize: customTypography.body3Regular.fontSize, fontWeight: customTypography.body3Regular.fontWeight, color: AppColors.lacqueredLiquorice),),
                const SizedBox(height: 15,),
                IconCard(icon: Icons.location_on_outlined, text: workLoc!= null ? 'Working from: $workLoc' : 'Working from: NA', iconColor: AppColors.antarctica, iconSize: 15, space: 20, textStyle: TextStyle(fontSize: customTypography.body3Regular.fontSize, fontWeight: customTypography.body3Regular.fontWeight, color: AppColors.lacqueredLiquorice),),
                const SizedBox(height: 15,),
                IconCard(icon: Icons.calendar_today_outlined, text: 'Joined on: $dateOfJoining', iconColor: AppColors.antarctica, iconSize: 15, space: 20, textStyle: TextStyle(fontSize: customTypography.body3Regular.fontSize, fontWeight: customTypography.body3Regular.fontWeight, color: AppColors.lacqueredLiquorice),),
                const SizedBox(height: 15,),
                IconCard(icon: Icons.calendar_today_outlined, text: leavingOn != null ? 'Leaving on: $leavingOn' : 'Leaving on: NA', iconColor: AppColors.antarctica, iconSize: 15, space: 20, textStyle: TextStyle(fontSize: customTypography.body3Regular.fontSize, fontWeight: customTypography.body3Regular.fontWeight, color: AppColors.lacqueredLiquorice),),
                const SizedBox(height: 15,),
                IconCard(icon: Icons.calendar_today_outlined, text: leavingOn != null ? 'Career started on: $careerStarted' : 'Career started on: NA', iconColor: AppColors.antarctica, iconSize: 15, space: 20, textStyle: TextStyle(fontSize: customTypography.body3Regular.fontSize, fontWeight: customTypography.body3Regular.fontWeight, color: AppColors.lacqueredLiquorice),),
                const SizedBox(height: 15,),
                IconCard(icon: Icons.person_outline, text: manager!= null ? 'Manager: $manager' : 'Manager: NA', iconColor: AppColors.antarctica, iconSize: 15, space: 20, textStyle: TextStyle(fontSize: customTypography.body3Regular.fontSize, fontWeight: customTypography.body3Regular.fontWeight, color: AppColors.lacqueredLiquorice),),
                const SizedBox(height: 15,),
                IconCard(icon: Icons.school_outlined, text: mentor!= null ? 'Mentor: $mentor' : 'Mentor: NA', iconColor: AppColors.antarctica, iconSize: 15, space: 20, textStyle: TextStyle(fontSize: customTypography.body3Regular.fontSize, fontWeight: customTypography.body3Regular.fontWeight, color: AppColors.lacqueredLiquorice),),
                const SizedBox(height: 15,),
                IconCard(icon: Icons.people_outlined, text: mentees != null && mentees!.isNotEmpty ? mentees!.join(', ') : 'Mentees: NA', iconColor: AppColors.antarctica, iconSize: 15, space: 20, textStyle: TextStyle(fontSize: customTypography.body3Regular.fontSize, fontWeight: customTypography.body3Regular.fontWeight, color: AppColors.lacqueredLiquorice),),
              ],
            ),
          ),
          ],
        ),
    ),
  );
  }
}