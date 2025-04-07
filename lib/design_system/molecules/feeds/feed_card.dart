import 'package:flutter/material.dart';
import 'package:styria_flutter_web/design_system/atoms/inputs/add_comment_field.dart';
import 'package:styria_flutter_web/design_system/molecules/feeds/comment_section.dart';
import 'package:styria_flutter_web/design_system/molecules/feeds/feeds_card_footer.dart';
import 'package:styria_flutter_web/design_system/molecules/feeds/feeds_card_header.dart';
import 'package:styria_flutter_web/design_system/molecules/feeds/feeds_post_card.dart';
import 'package:styria_flutter_web/design_system/theme/color_schemes.dart';
import 'package:styria_flutter_web/shared/providers/feed_provider.dart';

class FeedCard extends StatefulWidget {
  final String? profileImage;
  final String username;
  final String postDate;
  final String channel;
  final String bannerImageUrl;
  final String postTitle;
  final String postDescription;
  final int likes;
  final int comments;
  final List<Comments> postComments;
  final VoidCallback? onLike;
  final VoidCallback? onComment;
  final VoidCallback? onShare;
  final VoidCallback onSend;
  final bool isCommentEdit;
  final VoidCallback? onPostEdit;
  final VoidCallback? onPostDelete;
  final TextEditingController? commentController;
  final bool isLiked;
  final bool isEdit;
  final bool isBordered;

  const FeedCard({
    super.key,
    this.profileImage,
    required this.username,
    required this.postDate,
    required this.channel,
    required this.bannerImageUrl,
    required this.postTitle,
    required this.postDescription,
    required this.likes,
    required this.comments,
    required this.postComments,
    required this.isLiked,
    required this.onSend,
    required this.isCommentEdit,
    required this.isEdit,
    required this.commentController,
    this.isBordered = false,
    this.onPostEdit,
    this.onPostDelete,
    this.onLike,
    this.onComment,
    this.onShare,
  });

  @override
  _FeedCardState createState() => _FeedCardState();
}

class _FeedCardState extends State<FeedCard> {
  bool _isCommentSectionVisible = false;

  void _toggleCommentSection() {
    setState(() {
      _isCommentSectionVisible = !_isCommentSectionVisible;
    });
    if (_isCommentSectionVisible && widget.onComment != null) {
      widget.onComment!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          width: 1,
          color: widget.isBordered ? AppColors.dreamyCloud : Colors.transparent,
        ),
      ),
      child: Column(
        children: [
          FeedsCardHeader(
            profileImage: widget.profileImage,
            username: widget.username,
            date: widget.postDate,
            channel: widget.channel,
            onEdit: widget.onPostEdit,
            onDelete: widget.onPostDelete,
            isEdit: widget.isEdit,
          ),
          FeedsPostCard(
            bannerImageUrl: widget.bannerImageUrl,
            title: widget.postTitle,
            description: widget.postDescription,
          ),
          FeedsCardFooter(
            onLike: widget.onLike,
            onComment: _toggleCommentSection,
            onShare: widget.onShare,
            likes: widget.likes,
            comments: widget.comments,
            isLiked: widget.isLiked,
          ),
          if (_isCommentSectionVisible) ...[
            CommentSection(
              comments: widget.postComments,
              profileImage: widget.profileImage,
              isCommentEdit: widget.isCommentEdit,
            ),
          ],
          Padding(
            padding: const EdgeInsets.fromLTRB(20,0,20,10),
            child: AddCommentField(
              commentController: widget.commentController,
              onSend: widget.onSend,
            ),
          ),
        ],
      ),
    );
  }
}
