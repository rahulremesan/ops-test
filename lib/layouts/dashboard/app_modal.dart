import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reorderable_grid_view/reorderable_grid_view.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';
import 'package:styria_flutter_web/shared/providers/mobile_provider.dart';

class App {
  final String id;
  final String name;
  final IconData icon;
  bool isPinned;

  App({
    required this.id,
    required this.name,
    required this.icon,
    this.isPinned = false,
  });
}

class AppsModal extends ConsumerStatefulWidget {
  const AppsModal({super.key});

  @override
  ConsumerState<AppsModal> createState() => _AppsModalState();
}

class _AppsModalState extends ConsumerState<AppsModal> {
  late List<App> apps;

  @override
  void initState() {
    super.initState();
    apps = [
      App(
          id: 'time-reporting',
          name: 'Time reporting',
          icon: Icons.access_time,
          isPinned: true),
      App(id: 'people', name: 'People', icon: Icons.people, isPinned: true),
      App(
          id: 'trainings',
          name: 'Trainings',
          icon: Icons.school,
          isPinned: true),
      App(
          id: 'expense-reporting',
          name: 'Expense reporting',
          icon: Icons.receipt_long,
          isPinned: false),
      App(id: 'links', name: 'Links', icon: Icons.link, isPinned: true),
      App(id: 'holidays', name: 'Holidays', icon: Icons.home, isPinned: false),
      App(id: 'feeds', name: 'Feeds', icon: Icons.rss_feed, isPinned: true),
      App(
          id: 'planner',
          name: 'Planner',
          icon: Icons.calendar_today,
          isPinned: true),
      App(id: 'events', name: 'Events', icon: Icons.event, isPinned: true),
      App(
          id: 'projects',
          name: 'Projects',
          icon: Icons.assignment,
          isPinned: false),
      App(
          id: 'awards',
          name: 'Awards',
          icon: Icons.emoji_events,
          isPinned: false),
      App(id: 'skills', name: 'Skills', icon: Icons.psychology, isPinned: true),
    ];
  }

  void togglePin(int index) {
    setState(() {
      apps[index].isPinned = !apps[index].isPinned;
    });
  }

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    final isMobile = ref.watch(isMobileProvider);

    return Dialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 600),
        child: Padding(
          padding: EdgeInsets.all(isMobile ? 16.0 : 32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.push_pin_outlined),
                        onPressed: () => {},
                      ),
                      Text(
                        'Pin the apps',
                        style: TextStyle(
                          fontFamily: customTypography.body1Bold.fontFamily,
                          fontSize: customTypography.body1Bold.fontSize,
                          fontWeight: customTypography.body1Bold.fontWeight,
                          color: AppColors.lacqueredLiquorice,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Apps',
                  style: TextStyle(
                    fontFamily: customTypography.body2Bold.fontFamily,
                    fontSize: customTypography.body2Bold.fontSize,
                    fontWeight: customTypography.body2Bold.fontWeight,
                    color: AppColors.lacqueredLiquorice,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Flexible(
                child: ReorderableGridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: apps.length,
                  itemBuilder: (context, index) {
                    return AppCard(
                      key: ValueKey(apps[index].id),
                      app: apps[index],
                      onPinToggle: () => togglePin(index),
                    );
                  },
                  onReorder: (oldIndex, newIndex) {
                    setState(() {
                      if (oldIndex < newIndex) {
                        newIndex -= 1;
                      }
                      final App item = apps.removeAt(oldIndex);
                      apps.insert(newIndex, item);
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppCard extends ConsumerWidget {
  final App app;
  final VoidCallback onPinToggle;

  const AppCard({
    super.key,
    required this.app,
    required this.onPinToggle,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    final isMobile = ref.watch(isMobileProvider);

    return Card(
      child: Padding(
        // padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 8.0 : 12.0,
          vertical: isMobile ? 4.0 : 8.0,
        ),
        child: Row(
          children: [
            Icon(app.icon, size: 20),
            const SizedBox(width: 12),
            if (!isMobile)
              Expanded(
                child: Text(
                  app.name,
                  style: TextStyle(
                    fontFamily: customTypography.body3Regular.fontFamily,
                    fontSize: customTypography.body3Regular.fontSize,
                    fontWeight: customTypography.body3Regular.fontWeight,
                    color: AppColors.lacqueredLiquorice,
                  ),
                ),
              ),
            IconButton(
              icon: Icon(
                app.isPinned ? Icons.push_pin : Icons.push_pin_outlined,
                size: 20,
                color: app.isPinned ? Colors.indigo : Colors.grey,
              ),
              onPressed: onPinToggle,
            ),
            const MouseRegion(
              cursor: SystemMouseCursors.grab,
              child: Icon(Icons.menu, size: 20, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
