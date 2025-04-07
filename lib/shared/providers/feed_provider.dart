import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styria_flutter_web/constants/api_constants.dart';
import 'package:http/http.dart' as http;

final feedsProvider = ChangeNotifierProvider((ref) => PostProvider());

class Post {
  final int id;
  final String title;
  final String content;
  final int likes;
  final int comments;
  final String username; // Combined first and second name
  final DateTime addedOn;
  final String? channelId;
  final String channelName;
  final bool liked;

  Post({
    required this.id,
    required this.title,
    required this.content,
    required this.likes,
    required this.comments,
    required this.username,
    required this.addedOn,
    required this.channelId,
    required this.channelName,
    required this.liked,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    var user = json['user'] ?? {};

    return Post(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      content: json['content'] ?? '',
      likes: json['likes'] ?? 0,
      comments: json['comments'] ?? 0,
      username: '${user['first_name'] ?? ''} ${user['last_name'] ?? ''}'
          .trim(), // Merge first & last name
      addedOn: json['added_on'] != null
          ? DateTime.tryParse(json['added_on']) ?? DateTime.now()
          : DateTime.now(),
      channelId: json['channel_id']?.toString(),
      channelName: json['channel_name'] ?? '',
      liked: json['liked'] ?? false,
    );
  }
}

class TrendingTag {
  final int id;
  final String name;
  final int count;
  final String? addedBy;
  final DateTime? addedOn;

  TrendingTag({
    required this.id,
    required this.name,
    required this.count,
    this.addedBy,
    this.addedOn,
  });

  factory TrendingTag.fromJson(Map<String, dynamic> json) {
    return TrendingTag(
      id: json['id'],
      name: json['name'],
      count: json['count'],
      addedBy: json['addedBy'],
      addedOn: json['addedOn'],
    );
  }
}

class Comments {
  final int id;
  final int postid;
  final String? profileImage;
  final String userName;
  final String postComment;

  Comments({
    required this.id,
    required this.postid,
    this.profileImage,
    required this.userName,
    required this.postComment,
  });
  factory Comments.fromJson(Map<String, dynamic> json) {
    return Comments(
      // profileImage: json['profile_image'],
      id: json['id'],
      postid: json['post_id'],
      userName: json['added_by'],
      postComment: json['content'],
    );
  }
}

class PostProvider with ChangeNotifier {
  List<Post> posts = [];
  List<TrendingTag> trendingTags = [];
  List recentActivity = [];
  Map<int, List<Comments>> postComments = {};
  bool isLoading = false;
  String? errorMessage;

  final int userId = 57;

  PostProvider() {
    fetchFeeds();
    fetchTrendingTags();
    fetchRecentActivity();
  }

  Future<void> fetchFeeds() async {
    _setLoadingState(true);

    try {
      final url = ApiConstants.feedHome(userId);

      final response = await http.put(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      });

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['status_code'] == 200) {
          posts = List<Post>.from(
            data['response_data'].map((post) => Post.fromJson(post)),
          );
        } else {
          errorMessage = data['error_message'] ?? 'Failed to load posts';
        }
      } else {
        errorMessage = 'Error: ${response.statusCode}';
      }
    } catch (e) {
      errorMessage = 'An error occurred: $e';
    } finally {
      _setLoadingState(false);
    }
  }

  Future<void> createPost(String title, String content, int channelId) async {
    _setLoadingState(true);
    try {
      const url = ApiConstants.createFeed;
      final body = json.encode({
        "title": title,
        "content": content,
        "added_by": userId,
        "channel_id": channelId,
      });

      final response = await http.post(Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
          body: body);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['status_code'] == 200) {
          if (data['response_data'] is List) {
            final postData = data['response_data'].first;
            posts.insert(0, Post.fromJson(postData));
            notifyListeners();
          } else {
            errorMessage =
                'Invalid response format: response_data is not a List';
          }
        } else {
          errorMessage = data['error_message'] ?? 'Failed to create the post';
        }
      } else {
        errorMessage = 'Error: ${response.statusCode}';
      }
    } catch (e) {
      errorMessage = 'An error occurred: $e';
    } finally {
      _setLoadingState(false);
    }
  }

  Future<void> updatePost(int postId, String title, String content) async {
    _setLoadingState(true);
    try {
      final url = ApiConstants.updateFeed(postId);
      final body = json.encode({
        "id": postId,
        "title": title,
        "content": content,
        "updated_by": userId,
      });

      final response = await http.put(Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
          body: body);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['status_code'] == 200) {
          final updatedPost = Post.fromJson(data['response_data']);
          final postIndex = posts.indexWhere((post) => post.id == postId);

          if (postIndex != -1) {
            posts[postIndex] = updatedPost; // Update the post in the list
            notifyListeners();
          }
        } else {
          errorMessage = data['error_message'] ?? 'Failed to update the post';
        }
      } else {
        errorMessage = 'Error: ${response.statusCode}';
      }
    } catch (e) {
      errorMessage = 'An error occurred: $e';
    } finally {
      _setLoadingState(false);
    }
  }

  Future<void> deletePost(int postId) async {
    _setLoadingState(true);
    try {
      final url = ApiConstants.deleteFeedPost(postId);

      final response =
          await http.delete(Uri.parse('$url&user_id=$userId'), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      });

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['status_code'] == 200) {
          posts.removeWhere((post) => post.id == postId);
          notifyListeners();
        } else {
          errorMessage = data['error_message'] ?? 'Failed to delete the post';
        }
      } else {
        errorMessage = 'Error: ${response.statusCode}';
      }
    } catch (e) {
      errorMessage = 'An error occurred: $e';
    } finally {
      _setLoadingState(false);
    }
  }

  Future<void> fetchTrendingTags() async {
    _setLoadingState(true);
    try {
      final url = ApiConstants.trendingTags();
      final response = await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      });

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['status_code'] == 200) {
          trendingTags = List<TrendingTag>.from(
            data['response_data'].map((tag) => TrendingTag.fromJson(tag)),
          );
        } else {
          errorMessage =
              data['error_message'] ?? 'Failed to load trending hashtags';
        }
      } else {
        errorMessage = 'Error: ${response.statusCode}';
      }
    } catch (e) {
      errorMessage = 'An error occurred: $e';
    } finally {
      _setLoadingState(false);
    }
  }

  Future<void> fetchRecentActivity() async {
    _setLoadingState(true);
    try {
      final url = ApiConstants.recentActivities(userId);
      final response = await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      });

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['status_code'] == 200) {
          recentActivity =
              List<Map<String, dynamic>>.from(data['response_data']);
          notifyListeners();
        } else {
          errorMessage = data['error_message'] ?? 'Failed to fetch activities';
        }
      } else {
        errorMessage = 'Error: ${response.statusCode}';
      }
    } catch (e) {
      errorMessage = 'An error occurred: $e';
    } finally {
      _setLoadingState(false);
    }
  }

  Future<void> toggleLike(int postId) async {
    try {
      final url = ApiConstants.reactionLike();
      final body = json.encode({
        "post_id": postId,
        "user_id": userId,
      });

      final response = await http.post(Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
          body: body);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['status_code'] == 200) {
          final postIndex = posts.indexWhere((post) => post.id == postId);
          if (postIndex != -1) {
            final post = posts[postIndex];
            final newLikes = post.liked ? post.likes - 1 : post.likes + 1;
            posts[postIndex] = Post(
              id: post.id,
              title: post.title,
              content: post.content,
              likes: newLikes,
              comments: post.comments,
              username: post.username, // Ensure username is retained
              addedOn: post.addedOn,
              channelId: post.channelId,
              channelName: post.channelName,
              liked: !post.liked, // Toggle liked status
            );

            notifyListeners();
          }
        } else {
          errorMessage = data['error_message'] ?? 'Failed to like the post';
        }
      } else {
        errorMessage = 'Error: ${response.statusCode}';
      }
    } catch (e) {
      errorMessage = 'An error occurred: $e';
    }
  }

  Future<void> fetchPostComments(int postId) async {
    try {
      final url = ApiConstants.fetchPostComments(postId);

      final response = await http.get(Uri.parse(url), headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      });

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['status_code'] == 200) {
          postComments[postId] = List<Comments>.from(data['response_data']
              .map((comment) => Comments.fromJson(comment)));
          notifyListeners();
        } else {
          errorMessage = data['error_message'] ?? 'Failed to load comments';
        }
      } else {
        errorMessage = 'Error: ${response.statusCode}';
      }
    } catch (e) {
      errorMessage = 'An error occurred: $e';
    }
  }

  Future<void> addComment(int postId, String content) async {
    try {
      final url = ApiConstants.createPostComment();
      final body = json.encode({
        "post_id": postId,
        "user_id": userId,
        "content": content,
      });

      final response = await http.post(Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
          },
          body: body);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['status_code'] == 200) {
          // Add the new comment to the list
          final newComment = Comments.fromJson(data['response_data']);
          postComments[postId]?.add(newComment);

          // Update the comments count in the respective post
          final postIndex = posts.indexWhere((post) => post.id == postId);
          if (postIndex != -1) {
            final post = posts[postIndex];
            posts[postIndex] = Post(
              id: post.id,
              title: post.title,
              content: post.content,
              likes: post.likes,
              comments: post.comments + 1, // Increment comments count
              username: post.username, // Ensure username is retained
              addedOn: post.addedOn,

              channelId: post.channelId,
              channelName: post.channelName,
              liked: post.liked,
            );
          }

          notifyListeners(); // Notify listeners about the changes
        } else {
          errorMessage = data['error_message'] ?? 'Failed to add comment';
        }
      } else {
        errorMessage = 'Error: ${response.statusCode}';
      }
    } catch (e) {
      errorMessage = 'An error occurred: $e';
    }
  }

  List<Comments> getCommentsForPost(int postId) {
    return postComments[postId] ?? [];
  }

  Future<void> deleteComment(int commentId, int postId) async {
    try {
      final url =
          '${ApiConstants.deletePostComment()}?id=$commentId&user_id=$userId';

      final response = await http.delete(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['status_code'] == 200) {
          // Remove the comment locally
          postComments[postId]
              ?.removeWhere((comment) => comment.id == commentId);

          // Update post comment count
          final postIndex = posts.indexWhere((post) => post.id == postId);
          if (postIndex != -1) {
            final post = posts[postIndex];
            posts[postIndex] = Post(
              id: post.id,
              title: post.title,
              content: post.content,
              likes: post.likes,
              comments: post.comments - 1,
              username: post.username,
              addedOn: post.addedOn,
              channelId: post.channelId,
              channelName: post.channelName,
              liked: post.liked,
            );
          }

          notifyListeners(); 
        } else {
          errorMessage =
              data['error_message'] ?? 'Failed to delete the comment';
        }
      } else {
        errorMessage = 'Error: ${response.statusCode}';
      }
    } catch (e) {
      errorMessage = 'An error occurred: $e';
    }
  }

  void _setLoadingState(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
