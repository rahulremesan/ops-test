import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';

class FeedsCardFooter extends StatefulWidget {
  final int likes;
  final int comments;
  final VoidCallback? onLike;
  final VoidCallback? onComment;
  final VoidCallback? onShare;
  final bool isLiked;
  const FeedsCardFooter({
    super.key,
    required this.likes,
    required this.comments,
    required this.isLiked,
    this.onLike,
    this.onComment,
    this.onShare,
  });

  @override
  State<FeedsCardFooter> createState() => _FeedsCardFooterState();
}

class _FeedsCardFooterState extends State<FeedsCardFooter> {
  bool isLiked = false;
  bool isCommented = false;
  bool isShared = false;

  @override
  void initState() {
    super.initState();
    isLiked = widget.isLiked;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
          )),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isLiked = !isLiked;
                      });
                      if (widget.onLike != null) widget.onLike!();
                    },
                    child: badges.Badge(
                      badgeContent: Text(
                        '${widget.likes}',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.w400),
                      ),
                      showBadge: widget.likes > 0,
                      badgeStyle: const badges.BadgeStyle(
                        badgeColor: AppColors.brandBlue,
                      ),
                      child: Icon(
                        isLiked
                            ? Icons.thumb_up_alt
                            : Icons.thumb_up_alt_outlined,
                        color: isLiked ? AppColors.brandBlue : AppColors.nickel,
                        size: 24,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: widget.onComment,
                    child: badges.Badge(
                      badgeContent: Text(
                        '${widget.comments}',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.w400),
                      ),
                      showBadge: widget.comments > 0,
                      badgeStyle: const badges.BadgeStyle(
                        badgeColor: AppColors.brandBlue,
                      ),
                      child: const Icon(
                        Icons.chat_bubble_outline,
                        color: AppColors.nickel,
                        size: 24,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: widget.onShare,
                    child: Transform.rotate(
                      angle: -0.5,
                      child: const Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Icon(
                          Icons.send,
                          color: AppColors.nickel,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.bookmark_border,
                  size: 24,
                ))
          ],
        ),
      ),
    );
  }
}
