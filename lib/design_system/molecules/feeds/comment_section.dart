import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styria_flutter_web/design_system/atoms/buttons/primary_button.dart';
import 'package:styria_flutter_web/design_system/atoms/cards/view_comment_card.dart';
import 'package:styria_flutter_web/shared/providers/feed_provider.dart';

class CommentSection extends ConsumerWidget {
  final List<Comments> comments;
  final String? profileImage;
  final bool isCommentEdit;

  const CommentSection({
    super.key,
    required this.comments,
    this.profileImage,
    required this.isCommentEdit,
  });
  void showCommentDeleteDialog(
      BuildContext context, VoidCallback onConfirmDelete) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          title: Text(
            'Delete',
            style: TextStyle(color: Colors.red[800]),
          ),
          content: const Text('Are you sure you want to delete this comment?'),
          actions: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  PrimaryButton(
                    isSecondary: true,
                    buttonText: 'Cancel',
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  PrimaryButton(
                    buttonText: 'Delete',
                    onPressed: () {
                      Navigator.of(context).pop();
                      onConfirmDelete();
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(feedsProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: comments.length,
          itemBuilder: (context, index) {
            final comment = comments[index];
            return ViewCommentCard(
              profileImage: comment.profileImage,
              userName: comment.userName,
              postComment: comment.postComment,
              onCommentDelete: () {
                showCommentDeleteDialog(context, () async {
                  await notifier.deleteComment(comment.id, comment.postid);

                  if (notifier.errorMessage != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(notifier.errorMessage!)),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Comment deleted successfully!')),
                    );
                  }
                });
              },
              isCommentEdit: isCommentEdit,
              commentId: comment.id,
            );
          },
        ),
      ],
    );
  }
}
