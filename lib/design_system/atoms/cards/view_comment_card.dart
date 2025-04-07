import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/shared/providers/mobile_provider.dart';

class ViewCommentCard extends ConsumerStatefulWidget {
  final String? profileImage;
  final String userName;
  final String postComment;
  final int commentId;
  final VoidCallback onCommentDelete;
  final bool isCommentEdit;

  const ViewCommentCard({
    super.key,
    this.profileImage,
    required this.commentId,
    required this.userName,
    required this.postComment,
    required this.onCommentDelete,
    required this.isCommentEdit,
  });

  @override
  ConsumerState<ViewCommentCard> createState() => _ViewCommentCardState();
}

class _ViewCommentCardState extends ConsumerState<ViewCommentCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isMobile = ref.watch(isMobileProvider);

    return MouseRegion(
      onEnter: (_) {
        if (!isMobile) {
          setState(() {
            isHovered = true;
          });
        }
      },
      onExit: (_) {
        if (!isMobile) {
          setState(() {
            isHovered = false;
          });
        }
      },
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: ListTile(
          title: Text(
            widget.userName,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Text(widget.postComment),
          leading: CircleAvatar(
            backgroundImage: widget.profileImage != null
                ? AssetImage(widget.profileImage!)
                : const AssetImage('assets/images/profileImage.jpeg'),
            radius: 25,
          ),
          trailing: AnimatedOpacity(
            opacity:
                widget.isCommentEdit && (isMobile || isHovered) ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 200),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: IconButton(
                icon: const Icon(
                  Icons.delete,
                  size: 20,
                  color: AppColors.coralRed,
                ),
                onPressed: widget.onCommentDelete,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
