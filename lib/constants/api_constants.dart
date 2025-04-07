import 'package:styria_flutter_web/shared/providers/channels_provider.dart';

class ApiConstants {
  static const String baseUrl = 'https://styria-dev.tarento.com/python/api/v1';
  static const String baseUrl2 = 'https://styria-dev.tarento.com/api/v1';
  static const String baseUrlTesting =
      'https://94b53zhd-8077.inc1.devtunnels.ms/python/api/v1';

  //feed post section endpoints
  static String feedHome(int userId) {
    return '$baseUrl/feed/home?id=$userId';
  }

  static const createFeed = '$baseUrl/feed/post';

  static String updateFeed(int postId) {
    return '$baseUrl/feed/post?id=$postId';
  }

  static String getAllFeedPost(int channelId, int userId) {
    return '$baseUrl/feed/post?user_id=$userId&channel_id=$channelId';
  }

  static String deleteFeedPost(int id) {
    return '$baseUrl/feed/post?id=$id';
  }

  static String reactionLike() {
    return '$baseUrl/feed/reaction/like';
  }

  static String fetchChannel(int userId) {
    return '$baseUrl/feed/channel?user_id=$userId';
  }

  static String createChannel() {
    return '$baseUrl/feed/channel';
  }

  static String channelSubscribe() {
    return '$baseUrl/feed/channel/subscribe';
  }

  static String updateChannel(Channel updatedChannel) {
    return '$baseUrl/feed/channel?id=${updatedChannel.id}';
  }

  static String deleteChannel(int channelId) {
    return '$baseUrl/feed/channel?id=$channelId';
  }

  static String trendingTags() {
    return '$baseUrl/feed/tag/trending';
  }

  static String recentActivities(int userId) {
    return '$baseUrl/feed/recent?user_id=$userId';
  }

  static String fetchPostComments(int postId){
    return '$baseUrl/feed/reaction/comment?post_id=$postId';
  }

  static String createPostComment(){
    return '$baseUrl/feed/reaction/comment';
  }

  static String deletePostComment(){
    return '$baseUrl/feed/reaction/comment';
  }

  //clssifieds section endpoints
  static String fetchClassifieds() {
    return '$baseUrl2/classifieds/ads';
  }
}
