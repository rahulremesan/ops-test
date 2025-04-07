import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:styria_flutter_web/design_system/atoms/buttons/primary_button.dart';
import 'package:styria_flutter_web/design_system/molecules/feeds/feed_card.dart';
import 'package:styria_flutter_web/layouts/feeds/create_feed.dart';
import 'package:styria_flutter_web/shared/providers/channels_provider.dart';
import 'package:styria_flutter_web/shared/providers/feed_provider.dart';

class PostSection extends ConsumerWidget {
  final bool isBordered;
  const PostSection({
    super.key,
    this.isBordered = false,
  });

  String getTimeAgo(String addedOn) {
    final now = DateTime.now();
    final addedDate = DateTime.parse(addedOn);
    final difference = now.difference(addedDate);

    if (difference.inDays > 1) {
      return DateFormat('MMMM d, yyyy').format(addedDate);
    } else if (difference.inDays == 1) {
      return '1 day ago';
    } else if (difference.inHours > 1) {
      return '${difference.inHours} hours ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hour ago';
    } else if (difference.inMinutes > 1) {
      return '${difference.inMinutes} minutes ago';
    } else {
      return 'Just now';
    }
  }

  void showDeleteDialog(BuildContext context, VoidCallback onConfirmDelete) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          title: Text(
            'Delete',
            style: TextStyle(color: Colors.red[800]),
          ),
          content: const Text('Are you sure you want to delete this Post?'),
          actions: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  PrimaryButton(
                    buttonText: 'Cancel',
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  PrimaryButton(
                    isSecondary: true,
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

  void showEditDialog(
      BuildContext context, WidgetRef ref, List<Channel> channels, Post post) {
    final titleController = TextEditingController(text: post.title);
    final descriptionController = TextEditingController(text: post.content);
    // final referenceNameController = TextEditingController();
    // final referenceUrlController = TextEditingController();
    final selectedChannelIdNotifier = ValueNotifier<String>('');
    final postProvider = ref.watch(feedsProvider);

    showDialog(
      context: context,
      builder: (_) {
        return Dialog(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700, maxHeight: 700),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Stack(children: [
                CreateFeed(
                  title: 'Edit Post',
                  titleController: titleController,
                  descriptionController: descriptionController,
                  selectedChannelIdNotifier: selectedChannelIdNotifier,
                  isSelectChannel: false,
                  channels: channels,
                  onPublish: () async {
                    final title = titleController.text;
                    final content = descriptionController.text;
                    if (title.isEmpty || content.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content:
                                Text('Title and content cannot be empty.')),
                      );
                      return;
                    }

                    try {
                      await postProvider.updatePost(post.id, title, content);

                      if (postProvider.errorMessage != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(postProvider.errorMessage!)),
                        );
                      } else {
                        Navigator.of(context).pop();
                      }
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Invalid channel ID.')),
                      );
                    }
                  },
                ),
              ]),
            ),
          ),
        );
      },
    );
  }

  void handleSendComment({
    required BuildContext context,
    required WidgetRef ref,
    required TextEditingController commentController,
    required int postId,
  }) async {
    final content = commentController.text.trim();
    if (content.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Comment content cannot be empty.')),
      );
      return;
    }

    final notifier = ref.read(feedsProvider);

    await notifier.addComment(postId, content);

    if (notifier.errorMessage != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(notifier.errorMessage!)),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Comment added successfully!')),
      );
      commentController.clear();
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(feedsProvider);
    final notifier = ref.read(feedsProvider);
    final channelProvider = ref.watch(channelsProvider);

    return provider.isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : provider.errorMessage != null
            ? Center(
                child: Text(provider.errorMessage!),
              )
            : Column(
                children: provider.posts.map((post) {
                  final commentController = TextEditingController();
                  return Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    child: FeedCard(
                      // profileImage: ,
                      isBordered: isBordered,
                      username: post.username,
                      postDate: getTimeAgo((post.addedOn.toString())),
                      // bannerImageUrl:
                      //     'https://s3-alpha-sig.figma.com/img/402c/c2e0/d4682730ef5e7de9999042c5bf58b3a9?Expires=1737331200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=QGuO7QwspdZDROgVKLCxIv8v-7tUv1Q~oZn8y4HczB0rc3en52ZoqAUFa-C1ijklh4VyH7PZcEJs1SRWEkerjelN6UWkaUzp3oeQvVQLOkpiovz1-KKuLRRutGTT-W91Ipv6aFxEBMmHafN2zk86FlmC4kVA8BHjVOyeqXERPMeeLiSMQf6giT722~ZV0wHk2Aw9PhsbnpsvX4nMfHjLsnnf26IziehCuwPnevT3rlZWr3vPFFQR3RyOn7lomm4xueacP882hjmaPfS9t1JdTgOHhGR0YL7ZE-1ilFa~U6bLjojSRsnZB0LwI2sLLfOZjlgviKzdw5osQOIk7B-wqw__',
                      bannerImageUrl: '/assets/images/feeds.png',
                      postTitle: post.title,
                      postDescription: post.content,
                      channel: post.channelName,
                      likes: post.likes,
                      comments: post.comments,
                      isLiked: post.liked,
                      isEdit: post.username == provider.userId.toString(),
                      onLike: () {
                        ref.read(feedsProvider).toggleLike(post.id);
                      },
                      postComments: provider.getCommentsForPost(post.id),
                      commentController: commentController,
                      onSend: () => handleSendComment(
                        context: context,
                        ref: ref,
                        commentController: commentController,
                        postId: post.id,
                      ),
                      isCommentEdit:
                          provider.getCommentsForPost(post.id).any((comment) {
                        return comment.userName == provider.userId.toString();
                      }),

                      onComment: () {
                        ref.read(feedsProvider).fetchPostComments(post.id);
                      },
                      onPostEdit: () {
                        showEditDialog(context, ref,
                            channelProvider.followingChannels, post);
                      },
                      onPostDelete: () {
                        showDeleteDialog(context, () async {
                          await notifier.deletePost(post.id);
                          if (notifier.errorMessage != null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(notifier.errorMessage!)),
                            );
                          }
                        });
                      },
                    ),
                  );
                }).toList(),
              );
  }
}
