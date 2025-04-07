import 'package:flutter/material.dart';
import 'package:styria_flutter_web/design_system/atoms/tags/project_info.dart';

class ProjectInfoCard extends StatelessWidget {
  final String hoursSpend;
  final String hoursEstimated;
  final DateTime startDate;
  final DateTime endDate;
  final String department;
  final String client;
  final String domain;
  final String geography;
  final String releaseVersion;
  final DateTime nextRelease;

  const ProjectInfoCard({
    super.key,
    required this.hoursSpend,
    required this.hoursEstimated,
    required this.startDate,
    required this.endDate,
    required this.department,
    required this.client,
    required this.domain,
    required this.geography,
    required this.releaseVersion,
    required this.nextRelease,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                spacing: 70,
                runSpacing: 20,
                children: [
                  ProjectInfo(
                    infoIcon: Icons.access_time_rounded,
                    infoTitle: 'Hours spent',
                    infoType: 'String',
                    infoDescription: hoursSpend,
                  ),
                  ProjectInfo(
                    infoIcon: Icons.access_time_outlined,
                    infoTitle: 'Hours Estimated',
                    infoType: 'String',
                    infoDescription: hoursEstimated,
                  ),
                  ProjectInfo(
                    infoIcon: Icons.date_range,
                    infoTitle: 'Start date',
                    infoType: 'Date',
                    infoDescription: startDate,
                  ),
                  ProjectInfo(
                    infoIcon: Icons.date_range,
                    infoTitle: 'End Date',
                    infoType: 'Date',
                    infoDescription: endDate,
                  ),
                  ProjectInfo(
                    infoIcon: Icons.account_tree_outlined,
                    infoTitle: 'Department',
                    infoType: 'String',
                    infoDescription: department,
                  ),
                  ProjectInfo(
                    infoIcon: Icons.work_outline,
                    infoTitle: 'Client',
                    infoType: 'String',
                    infoDescription: client,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Divider(thickness: 0.5),
              const SizedBox(height: 20),
              Wrap(
                spacing: 70,
                runSpacing: 20,
                children: [
                  ProjectInfo(
                    infoIcon: Icons.domain,
                    infoTitle: 'Domain',
                    infoType: 'String',
                    infoDescription: domain,
                  ),
                  ProjectInfo(
                    infoIcon: Icons.public,
                    infoTitle: 'Geography',
                    infoType: 'String',
                    infoDescription: geography,
                  ),
                  ProjectInfo(
                    infoIcon: Icons.info_outline,
                    infoTitle: 'Release version',
                    infoType: 'String',
                    infoDescription: releaseVersion,
                  ),
                  ProjectInfo(
                    infoIcon: Icons.calendar_today_outlined,
                    infoTitle: 'Next release',
                    infoType: 'Date',
                    infoDescription: nextRelease,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
