import 'package:flutter/material.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/design_system/theme/custom_typography.dart';

class ExploreChannelCard extends StatefulWidget {
  final Icon icon;
  final String channelName;
  final int membersCount;
  final String description;
  final bool isFollowing;
  final VoidCallback onFollowToggle;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final bool isEdit;

  const ExploreChannelCard({
    super.key,
    required this.icon,
    required this.channelName,
    required this.membersCount,
    required this.description,
    required this.isFollowing,
    required this.onFollowToggle,
    this.onEdit,
    this.onDelete,
    this.isEdit = false,
  });

  @override
  State<ExploreChannelCard> createState() => _ExploreChannelCardState();
}

class _ExploreChannelCardState extends State<ExploreChannelCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final customTypography = Theme.of(context).extension<CustomTypography>() ??
        CustomTypography.light;

    final descriptionLength = widget.description.split(' ');
    final isLongDescription = descriptionLength.length > 50;

    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            8,
          )),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                ClipOval(
                  child: Container(
                    width: 36,
                    height: 36,
                    color: AppColors.dreamyCloud,
                    child: widget.icon,
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.channelName,
                            style: TextStyle(
                              fontFamily:
                                  customTypography.body2Medium.fontFamily,
                              fontSize: customTypography.body2Medium.fontSize,
                              fontWeight:
                                  customTypography.body2Medium.fontWeight,
                            ),
                          ),
                          Text(
                            widget.membersCount == 1
                                ? '${widget.membersCount} member'
                                : '${widget.membersCount} members',
                            style: TextStyle(
                              color: AppColors.wolFrame,
                              fontFamily:
                                  customTypography.body3Medium.fontFamily,
                              fontSize: customTypography.body3Medium.fontSize,
                              fontWeight:
                                  customTypography.body3Medium.fontWeight,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: widget.onFollowToggle,
                              child: widget.isFollowing
                                  ? Text(
                                      'Following',
                                      style: TextStyle(
                                        color: AppColors.luckyGrey,
                                        fontFamily: customTypography
                                            .body2Medium.fontFamily,
                                        fontSize: customTypography
                                            .body2Medium.fontSize,
                                        fontWeight: customTypography
                                            .body2Medium.fontWeight,
                                      ),
                                    )
                                  : Text(
                                      'Follow',
                                      style: TextStyle(
                                        color: AppColors.sailAway,
                                        fontFamily: customTypography
                                            .body2Medium.fontFamily,
                                        fontSize: customTypography
                                            .body2Medium.fontSize,
                                        fontWeight: customTypography
                                            .body2Medium.fontWeight,
                                      ),
                                    ),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          if (widget.isEdit)
                            PopupMenuButton<String>(
                              shadowColor: Colors.grey[100],
                              offset: const Offset(0, 35),
                              menuPadding: const EdgeInsets.all(0),
                              popUpAnimationStyle: AnimationStyle(
                                duration: const Duration(
                                  milliseconds: 500,
                                ),
                              ),
                              // onSelected: (value) {
                              //   if (value == 'edit' && onEdit != null) {
                              //     onEdit!();
                              //   } else if (value == 'delete' &&
                              //       onDelete != null) {
                              //     onDelete!();
                              //   }
                              // },
                              icon: const Icon(Icons.more_vert),
                              itemBuilder: (context) => [
                                PopupMenuItem(
                                  onTap: widget.onEdit,
                                  padding: const EdgeInsets.all(8),
                                  height: 30,

                                  child: const Row(
                                    children: [
                                      Icon(Icons.edit, size: 16),
                                      SizedBox(width: 8),
                                      Text('Edit'),
                                    ],
                                  ),
                                ),
                                PopupMenuItem(
                                  onTap: widget.onDelete,
                                  padding: const EdgeInsets.all(8),
                                  height: 30,
                                  child: const Row(
                                    children: [
                                      Icon(
                                        Icons.delete,
                                        size: 16,
                                        color: Colors.red,
                                      ),
                                      SizedBox(width: 8),
                                      Text('Delete'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    isExpanded
                        ? Text(widget.description)
                        : Text(
                            widget.description,
                            maxLines: 3,
                          ),
                    if (isLongDescription)
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isExpanded = !isExpanded;
                            });
                          },
                          child: Text(
                            isExpanded ? 'See less' : 'See more',
                            style: TextStyle(
                              color: AppColors.sailAway,
                              fontFamily:
                                  customTypography.caption1Regular.fontFamily,
                              fontSize:
                                  customTypography.caption1Regular.fontSize,
                              fontWeight:
                                  customTypography.caption1Regular.fontWeight,
                            ),
                          ),
                        ),
                      )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
